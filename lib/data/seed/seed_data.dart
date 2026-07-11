/// 种子 / 演示数据（system_design §T11 / class-diagram 一家人）。
///
/// 首次启动写入：5 位家庭成员、分类、商品与批次、用药计划、菜谱、
/// 备忘录、旅游计划书、提醒规则。写入后由 SharedPreferences 标记，避免重复。
library;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constants/app_constants.dart';
import '../../core/constants/member_colors.dart';
import '../../core/utils/datetime_ext.dart';
import '../../core/utils/id_generator.dart';
import '../../providers/app_providers.dart';
import '../models/category.dart';
import '../models/dose_log.dart';
import '../models/dose_schedule.dart';
import '../models/enums.dart';
import '../models/medication.dart';
import '../models/memo.dart';
import '../models/product.dart';
import '../models/recipe.dart';
import '../models/recipe_ingredient.dart';
import '../models/reminder_rule.dart';
import '../models/travel_day.dart';
import '../models/travel_item.dart';
import '../models/travel_plan.dart';
import '../models/member.dart';
import 'package:flutter/material.dart';

/// 首次启动写入种子数据；已写入则直接返回。
Future<void> ensureSeeded(WidgetRef ref) async {
  final prefs = await SharedPreferences.getInstance();
  if (prefs.getBool(AppConstants.seedPrefKey) == true) return;

  final repos = ref.read(repositoriesProvider);
  final now = DateTime.now();

  // —— 成员 ——
  final dadId = IdGenerator.newId(IdPrefix.member);
  final momId = IdGenerator.newId(IdPrefix.member);
  final babyId = IdGenerator.newId(IdPrefix.member);
  final grandmaId = IdGenerator.newId(IdPrefix.member);
  final grandpaId = IdGenerator.newId(IdPrefix.member);
  final members = [
    MemberModel(id: dadId, name: '爸爸', role: MemberRole.admin, color: MemberColors.palette[0], createdAt: now, updatedAt: now),
    MemberModel(id: momId, name: '妈妈', color: MemberColors.palette[1], createdAt: now, updatedAt: now),
    MemberModel(id: babyId, name: '宝宝', color: MemberColors.palette[2], createdAt: now, updatedAt: now),
    MemberModel(id: grandmaId, name: '奶奶', color: MemberColors.palette[3], createdAt: now, updatedAt: now),
    MemberModel(id: grandpaId, name: '爷爷', color: MemberColors.palette[4], createdAt: now, updatedAt: now),
  ];
  for (final m in members) {
    await repos.member.save(m);
  }

  // —— 分类 ——
  final foodId = IdGenerator.newId(IdPrefix.category);
  final medCatId = IdGenerator.newId(IdPrefix.category);
  final dailyId = IdGenerator.newId(IdPrefix.category);
  final otherId = IdGenerator.newId(IdPrefix.category);
  await repos.product.saveCategory(CategoryModel(id: foodId, name: '食品', kind: CategoryKind.food, createdAt: now, updatedAt: now));
  await repos.product.saveCategory(CategoryModel(id: medCatId, name: '药品', kind: CategoryKind.medicine, createdAt: now, updatedAt: now));
  await repos.product.saveCategory(CategoryModel(id: dailyId, name: '日用品', kind: CategoryKind.daily, createdAt: now, updatedAt: now));
  await repos.product.saveCategory(CategoryModel(id: otherId, name: '其他', kind: CategoryKind.other, createdAt: now, updatedAt: now));

  // —— 商品 ——
  String addProduct(String name, String catId, String unit, int low, String location) {
    final id = IdGenerator.newId(IdPrefix.product);
    repos.product.saveProduct(ProductModel(
      id: id,
      name: name,
      categoryId: catId,
      unit: unit,
      lowStockThreshold: low,
      location: location,
      createdAt: now,
      updatedAt: now,
    ));
    return id;
  }

  final milkId = addProduct('牛奶', foodId, '盒', 3, '冰箱');
  final eggId = addProduct('鸡蛋', foodId, '个', 6, '冰箱');
  final breadId = addProduct('面包', foodId, '袋', 2, '冰箱');
  final ibuprofenId = addProduct('布洛芬', medCatId, '粒', 10, '药箱');
  final vitcId = addProduct('维生素C', medCatId, '瓶', 1, '药箱');
  final tissueId = addProduct('抽纸', dailyId, '提', 2, '储物间');
  final detergentId = addProduct('洗衣液', dailyId, '瓶', 1, '储物间');
  final tomatoId = addProduct('番茄', foodId, '个', 4, '蔬果篮');
  final greensId = addProduct('青菜', foodId, '把', 3, '蔬果篮');
  final porkId = addProduct('五花肉', foodId, '克', 500, '冰箱');
  final tofuId = addProduct('豆腐', foodId, '盒', 1, '冰箱');
  final sugarId = addProduct('白糖', foodId, '袋', 1, '橱柜');

  // —— 入库（事件溯源：写 InboundOrderModel + StockBatchModel）——
  Future<void> inbound(String productId, num qty, int expireInDays, [String? note]) =>
      repos.inventory.recordInbound(
        productId: productId,
        qty: qty,
        operatorId: dadId,
        expireDate: expireInDays < 9999 ? DateTimeX.today.add(Duration(days: expireInDays)) : null,
        note: note,
      );
  await inbound(milkId, 4, 2);
  await inbound(eggId, 12, 10);
  await inbound(breadId, 1, 1);
  await inbound(ibuprofenId, 20, 200);
  await inbound(vitcId, 1, 300);
  await inbound(tissueId, 1, 9999);
  await inbound(detergentId, 3, 9999);
  await inbound(tomatoId, 6, 5);
  await inbound(greensId, 4, 3);
  await inbound(porkId, 2, 2);
  await inbound(tofuId, 2, 4);
  await inbound(sugarId, 1, 9999);

  // —— 用药计划 + 今日排程 + 部分已完成记录 ——
  MedicationModel addMed(String memberId, String name, String dosage, List<TimeOfDay> times) {
    final id = IdGenerator.newId(IdPrefix.medication);
    final med = MedicationModel(
      id: id,
      memberId: memberId,
      name: name,
      dosage: dosage,
      times: times,
      createdAt: now,
      updatedAt: now,
    );
    repos.medication.saveMedication(med);
    return med;
  }

  final dadMed = addMed(dadId, '降压药', '1 片', [const TimeOfDay(hour: 8, minute: 0), const TimeOfDay(hour: 20, minute: 0)]);
  final babyMed = addMed(babyId, '维生素D', '1 滴', [const TimeOfDay(hour: 9, minute: 0)]);
  final grandpaMed = addMed(grandpaId, '降糖药', '1 粒', [const TimeOfDay(hour: 7, minute: 30), const TimeOfDay(hour: 12, minute: 30), const TimeOfDay(hour: 18, minute: 30)]);

  // 今日排程
  for (final med in [dadMed, babyMed, grandpaMed]) {
    for (final t in med.times) {
      final st = DateTimeX.todayAt(t.hour, t.minute);
      await repos.medication.saveDoseSchedule(DoseScheduleModel(
        id: IdGenerator.newId(IdPrefix.schedule),
        medicationId: med.id,
        memberId: med.memberId,
        scheduledTime: st,
        createdAt: now,
        updatedAt: now,
      ));
    }
  }

  // 部分已完成打卡
  void checkDone(MedicationModel med, int hour, int minute) {
    final st = DateTimeX.todayAt(hour, minute);
    final logId = IdGenerator.doseLogId(med.id, st);
    repos.medication.checkIn(DoseLogModel(
      id: logId,
      medicationId: med.id,
      memberId: med.memberId,
      scheduledTime: st,
      status: DoseStatus.done,
      takenAt: st,
      createdAt: now,
      updatedAt: now,
    ));
  }
  checkDone(dadMed, 8, 0);
  checkDone(babyMed, 9, 0);
  checkDone(grandpaMed, 7, 30);

  // —— 菜谱（含食材 + 谁会做）——
  RecipeModel addRecipe({
    required String name,
    required String authorId,
    required String steps,
    required List<RecipeIngredientModel> ingredients,
    required List<String> cookableBy,
    List<String> tags = const [],
  }) {
    final id = IdGenerator.newId(IdPrefix.recipe);
    final r = RecipeModel(
      id: id,
      name: name,
      steps: steps,
      tags: tags,
      authorId: authorId,
      ingredients: ingredients,
      cookableBy: cookableBy,
      createdAt: now,
      updatedAt: now,
    );
    repos.recipe.saveRecipe(r);
    return r;
  }

  addRecipe(
    name: '番茄炒蛋',
    authorId: momId,
    steps: '1. 鸡蛋打散；2. 番茄切块；3. 热油先炒蛋盛出，再炒番茄出汁，回锅鸡蛋，加盐。',
    tags: ['家常', '快手'],
    ingredients: [
      RecipeIngredientModel(productId: eggId, amount: 3, unit: '个'),
      RecipeIngredientModel(productId: tomatoId, amount: 2, unit: '个'),
    ],
    cookableBy: [momId, dadId],
  );
  addRecipe(
    name: '红烧肉',
    authorId: dadId,
    steps: '1. 五花肉焯水；2. 炒糖色；3. 加肉与水焖煮 40 分钟；4. 收汁。',
    tags: ['硬菜'],
    ingredients: [
      RecipeIngredientModel(productId: porkId, amount: 500, unit: '克'),
      RecipeIngredientModel(productId: sugarId, amount: 20, unit: '克'),
      RecipeIngredientModel(productId: greensId, amount: 100, unit: '克'),
    ],
    cookableBy: [dadId],
  );
  addRecipe(
    name: '青菜豆腐汤',
    authorId: momId,
    steps: '1. 豆腐切块；2. 水开后下青菜与豆腐；3. 煮 5 分钟加盐。',
    tags: ['清淡', '汤'],
    ingredients: [
      RecipeIngredientModel(productId: greensId, amount: 200, unit: '克'),
      RecipeIngredientModel(productId: tofuId, amount: 1, unit: '盒'),
    ],
    cookableBy: [momId, grandmaId],
  );
  addRecipe(
    name: '牛奶炖蛋',
    authorId: grandmaId,
    steps: '1. 鸡蛋打散加牛奶；2. 过筛；3. 中火蒸 10 分钟。',
    tags: ['甜品', '宝宝'],
    ingredients: [
      RecipeIngredientModel(productId: milkId, amount: 1, unit: '盒'),
      RecipeIngredientModel(productId: eggId, amount: 2, unit: '个'),
    ],
    cookableBy: [grandmaId, babyId],
  );

  // —— 备忘录 ——
  await repos.memo.saveMemo(MemoModel(
    id: IdGenerator.newId(IdPrefix.memo),
    title: '交水电费',
    body: '这个月的水电燃气记得月底前交～',
    authorId: dadId,
    pinned: true,
    dueAt: DateTimeX.today.add(const Duration(days: 2)),
    createdAt: now,
    updatedAt: now,
  ));
  await repos.memo.saveMemo(MemoModel(
    id: IdGenerator.newId(IdPrefix.memo),
    title: '宝宝打疫苗',
    body: '社区医院，带好接种本。',
    authorId: momId,
    dueAt: DateTimeX.today.add(const Duration(days: 5)),
    createdAt: now,
    updatedAt: now,
  ));
  await repos.memo.saveMemo(MemoModel(
    id: IdGenerator.newId(IdPrefix.memo),
    title: '买生日蛋糕',
    body: '奶奶生日用',
    authorId: momId,
    done: true,
    createdAt: now,
    updatedAt: now,
  ));

  // —— 旅游计划书 ——
  final tripId = IdGenerator.newId(IdPrefix.travel);
  await repos.travel.saveTravelPlan(TravelPlanModel(
    id: tripId,
    title: '暑假海边游',
    start: DateTimeX.today.add(const Duration(days: 20)),
    end: DateTimeX.today.add(const Duration(days: 25)),
    memberIds: [dadId, momId, babyId, grandmaId, grandpaId],
    createdAt: now,
    updatedAt: now,
  ));
  final dayPlans = ['抵达 + 海边漫步', '出海浮潜', '海鲜大餐 + 返程'];
  for (var i = 0; i < dayPlans.length; i++) {
    await repos.travel.saveTravelDay(TravelDayModel(
      id: IdGenerator.newId(IdPrefix.day),
      planId: tripId,
      dayIndex: i + 1,
      date: DateTimeX.today.add(Duration(days: 20 + i)),
      agenda: dayPlans[i],
      createdAt: now,
      updatedAt: now,
      version: 1,
      deletedAt: null,
    ));
  }
  await repos.travel.saveTravelItem(TravelItemModel(
    id: IdGenerator.newId(IdPrefix.item),
    planId: tripId,
    type: TravelItemType.luggage,
    name: '防晒霜',
    qty: 2,
    assignedTo: momId,
    createdAt: now,
    updatedAt: now,
    version: 1,
    deletedAt: null,
  ));
  await repos.travel.saveTravelItem(TravelItemModel(
    id: IdGenerator.newId(IdPrefix.item),
    planId: tripId,
    type: TravelItemType.luggage,
    name: '泳衣',
    qty: 4,
    assignedTo: babyId,
    createdAt: now,
    updatedAt: now,
    version: 1,
    deletedAt: null,
  ));
  await repos.travel.saveTravelItem(TravelItemModel(
    id: IdGenerator.newId(IdPrefix.item),
    planId: tripId,
    type: TravelItemType.budget,
    name: '交通',
    amount: 2000,
    assignedTo: dadId,
    createdAt: now,
    updatedAt: now,
    version: 1,
    deletedAt: null,
  ));
  await repos.travel.saveTravelItem(TravelItemModel(
    id: IdGenerator.newId(IdPrefix.item),
    planId: tripId,
    type: TravelItemType.budget,
    name: '住宿',
    amount: 3000,
    createdAt: now,
    updatedAt: now,
    version: 1,
    deletedAt: null,
  ));

  // —— 提醒规则 ——
  await repos.reminder.saveRule(ReminderRuleModel(
    id: IdGenerator.newId(IdPrefix.rule),
    type: ReminderType.expiry,
    sourceRef: 'inventory',
    channel: ChannelType.localLog,
    enabled: true,
    createdAt: now,
    updatedAt: now,
  ));
  await repos.reminder.saveRule(ReminderRuleModel(
    id: IdGenerator.newId(IdPrefix.rule),
    type: ReminderType.lowstock,
    sourceRef: 'inventory',
    channel: ChannelType.localLog,
    enabled: true,
    createdAt: now,
    updatedAt: now,
  ));
  await repos.reminder.saveRule(ReminderRuleModel(
    id: IdGenerator.newId(IdPrefix.rule),
    type: ReminderType.medication,
    sourceRef: 'medication',
    channel: ChannelType.localLog,
    enabled: true,
    createdAt: now,
    updatedAt: now,
  ));

  await prefs.setBool(AppConstants.seedPrefKey, true);
}
