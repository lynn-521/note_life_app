/// MedicationDao（class-diagram.mermaid · MedicationDao）。
///
/// 用药计划 / 排程 / 记录。一对多：Member → Medication → DoseSchedule → DoseLog。
import 'package:drift/drift.dart';

import '../../models/dose_log.dart';
import '../../models/dose_schedule.dart';
import '../../models/medication.dart';
import '../tables/dose_log_table.dart';
import '../tables/dose_schedule_table.dart';
import '../tables/medication_table.dart';
import 'base_dao.dart';
import '../app_database.dart' show AppDatabase;
part 'medication_dao.g.dart';

/// 用药数据访问。
@DriftAccessor(tables: [Medications, DoseSchedules, DoseLogs])
class MedicationDao extends DatabaseAccessor<AppDatabase>
    with _$MedicationDaoMixin, BaseDao {
  /// 构造。
  MedicationDao(super.db);

  /// 监听某成员全部未删除用药计划。
  Stream<List<Medication>> watchByMember(String memberId) =>
      (select(medications)
            ..where((t) => t.memberId.equals(memberId) & t.deletedAt.isNull()))
          .watch()
          .map((rows) => rows.map(_toMedication).toList());

  /// 获取某成员全部未删除用药计划。
  Future<List<Medication>> getByMember(String memberId) async =>
      (await (select(medications)
            ..where((t) => t.memberId.equals(memberId) & t.deletedAt.isNull()))
          .get())
          .map(_toMedication)
          .toList();

  /// 全部启用中的用药计划。
  Future<List<Medication>> getAllActive() async =>
      (await (select(medications)
            ..where((t) => t.active.equals(true) & t.deletedAt.isNull()))
          .get())
          .map(_toMedication)
          .toList();

  /// 按 id 获取用药计划。
  Future<Medication?> getMedication(String id) async {
    final row = await (select(medications)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    return row == null ? null : _toMedication(row);
  }

  /// 保存用药计划（upsert）。
  Future<void> saveMedication(Medication m) =>
      into(medications).insertOnConflictUpdate(_toMedicationCompanion(m));

  /// 软删用药计划。
  Future<void> softDeleteMedication(String id) =>
      (update(medications)..where((t) => t.id.equals(id)))
          .write(MedicationsCompanion(deletedAt: Value(now)));

  /// 保存服药排程（upsert）。
  Future<void> saveDoseSchedule(DoseSchedule s) =>
      into(doseSchedules).insertOnConflictUpdate(_toScheduleCompanion(s));

  /// 某用药计划的全部排程。
  Future<List<DoseSchedule>> getSchedulesForMedication(String medicationId) async =>
      (await (select(doseSchedules)
            ..where((t) => t.medicationId.equals(medicationId)))
          .get())
          .map(_toSchedule)
          .toList();

  /// 保存服药记录（upsert，按稳定 id 幂等）。
  Future<void> saveDoseLog(DoseLog log) =>
      into(doseLogs).insertOnConflictUpdate(_toLogCompanion(log));

  /// 按 id 获取服药记录。
  Future<DoseLog?> getDoseLogById(String id) async {
    final row = await (select(doseLogs)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    return row == null ? null : _toLog(row);
  }

  /// 某用药计划全部记录。
  Future<List<DoseLog>> getLogsForMedication(String medicationId) async =>
      (await (select(doseLogs)
            ..where((t) => t.medicationId.equals(medicationId)))
          .get())
          .map(_toLog)
          .toList();

  /// 获取全部用药计划（含软删，供同步推送使用）。
  Future<List<Medication>> getAllMedicationsForSync() async =>
      (await select(medications).get()).map(_toMedication).toList();

  /// 获取全部服药排程（供同步推送使用）。
  Future<List<DoseSchedule>> getAllSchedulesForSync() async =>
      (await select(doseSchedules).get()).map(_toSchedule).toList();

  /// 获取全部服药记录（供同步推送使用）。
  Future<List<DoseLog>> getAllLogsForSync() async =>
      (await select(doseLogs).get()).map(_toLog).toList();

  Medication _toMedication(MedicationRow r) => Medication(
        id: r.id,
        memberId: r.memberId,
        name: r.name,
        type: r.type,
        dosage: r.dosage,
        frequency: r.frequency,
        times: r.times,
        startDate: r.startDate,
        endDate: r.endDate,
        active: r.active,
        createdAt: r.createdAt,
        updatedAt: r.updatedAt,
        version: r.version,
        deletedAt: r.deletedAt,
      );

  DoseSchedule _toSchedule(DoseScheduleRow r) => DoseSchedule(
        id: r.id,
        medicationId: r.medicationId,
        memberId: r.memberId,
        scheduledTime: r.scheduledTime,
        createdAt: r.createdAt,
        updatedAt: r.updatedAt,
        version: r.version,
        deletedAt: r.deletedAt,
      );

  DoseLog _toLog(DoseLogRow r) => DoseLog(
        id: r.id,
        medicationId: r.medicationId,
        memberId: r.memberId,
        scheduledTime: r.scheduledTime,
        status: r.status,
        takenAt: r.takenAt,
        note: r.note,
        createdAt: r.createdAt,
        updatedAt: r.updatedAt,
        version: r.version,
        deletedAt: r.deletedAt,
      );

  MedicationsCompanion _toMedicationCompanion(Medication m) =>
      MedicationsCompanion.insert(
        id: Value(m.id),
        memberId: Value(m.memberId),
        name: Value(m.name),
        type: Value(m.type),
        dosage: Value(m.dosage),
        frequency: Value(m.frequency),
        times: Value(m.times),
        startDate: Value(m.startDate),
        endDate: Value(m.endDate),
        active: Value(m.active),
        createdAt: Value(m.createdAt),
        updatedAt: Value(m.updatedAt),
        version: Value(m.version),
        deletedAt: Value(m.deletedAt),
      );

  DoseSchedulesCompanion _toScheduleCompanion(DoseSchedule s) =>
      DoseSchedulesCompanion.insert(
        id: Value(s.id),
        medicationId: Value(s.medicationId),
        memberId: Value(s.memberId),
        scheduledTime: Value(s.scheduledTime),
        createdAt: Value(s.createdAt),
        updatedAt: Value(s.updatedAt),
        version: Value(s.version),
        deletedAt: Value(s.deletedAt),
      );

  DoseLogsCompanion _toLogCompanion(DoseLog l) => DoseLogsCompanion.insert(
        id: Value(l.id),
        medicationId: Value(l.medicationId),
        memberId: Value(l.memberId),
        scheduledTime: Value(l.scheduledTime),
        status: Value(l.status),
        takenAt: Value(l.takenAt),
        note: Value(l.note),
        createdAt: Value(l.createdAt),
        updatedAt: Value(l.updatedAt),
        version: Value(l.version),
        deletedAt: Value(l.deletedAt),
      );
}
