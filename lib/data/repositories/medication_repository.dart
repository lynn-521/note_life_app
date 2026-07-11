/// MedicationRepository（class-diagram.mermaid · MedicationRepository）。
library;
import '../models/dose_log.dart';
import '../models/dose_schedule.dart';
import '../models/medication.dart';
import '../local_db/app_database.dart';

/// 用药仓储接口。
abstract class MedicationRepository {
  /// 打卡（upsert 服药记录，按稳定 id 幂等）。
  Future<void> checkIn(DoseLogModel log);

  /// 按 id 获取服药记录。
  Future<DoseLogModel?> getDoseLogById(String id);

  /// 监听某成员用药计划。
  Stream<List<MedicationModel>> watchByMember(String memberId);

  /// 获取某成员用药计划。
  Future<List<MedicationModel>> getByMember(String memberId);

  /// 获取全部启用中的用药计划。
  Future<List<MedicationModel>> getAllActive();

  /// 按 id 获取用药计划。
  Future<MedicationModel?> getMedication(String id);

  /// 保存用药计划。
  Future<void> saveMedication(MedicationModel medication);

  /// 软删用药计划。
  Future<void> deleteMedication(String id);

  /// 保存服药排程。
  Future<void> saveDoseSchedule(DoseScheduleModel schedule);

  /// 某用药计划全部记录。
  Future<List<DoseLogModel>> getDoseLogsByMedication(String medicationId);
}

/// 基于 Drift 的实现。
class MedicationRepositoryImpl implements MedicationRepository {
  /// 构造。
  MedicationRepositoryImpl(this.db);

  /// 数据库。
  final AppDatabase db;

  @override
  Future<void> checkIn(DoseLogModel log) => db.medicationDao.saveDoseLog(log);

  @override
  Future<DoseLogModel?> getDoseLogById(String id) =>
      db.medicationDao.getDoseLogById(id);

  @override
  Stream<List<MedicationModel>> watchByMember(String memberId) =>
      db.medicationDao.watchByMember(memberId);

  @override
  Future<List<MedicationModel>> getByMember(String memberId) =>
      db.medicationDao.getByMember(memberId);

  @override
  Future<List<MedicationModel>> getAllActive() => db.medicationDao.getAllActive();

  @override
  Future<MedicationModel?> getMedication(String id) =>
      db.medicationDao.getMedication(id);

  @override
  Future<void> saveMedication(MedicationModel medication) =>
      db.medicationDao.saveMedication(medication);

  @override
  Future<void> deleteMedication(String id) =>
      db.medicationDao.softDeleteMedication(id);

  @override
  Future<void> saveDoseSchedule(DoseScheduleModel schedule) =>
      db.medicationDao.saveDoseSchedule(schedule);

  @override
  Future<List<DoseLogModel>> getDoseLogsByMedication(String medicationId) =>
      db.medicationDao.getLogsForMedication(medicationId);
}
