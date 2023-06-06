import 'package:hive/hive.dart';
import 'package:hive_and_api_for_class/config/constants/hive_table_constant.dart';
import 'package:hive_and_api_for_class/features/auth/domain/entity/student_entity.dart';
import 'package:hive_and_api_for_class/features/batch/data/model/batch_hive_model.dart';
import 'package:hive_and_api_for_class/features/course/data/model/course_hive_model.dart';
import 'package:uuid/uuid.dart';

part 'student_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.studentTableId)
class StudentHiveModel {
  @HiveField(0)
  final String studentId;

  @HiveField(1)
  final String fname;

  @HiveField(2)
  final String lname;

  @HiveField(3)
  final String phone;

  @HiveField(4)
  final BatchHiveModel batch;

  @HiveField(5)
  final List<CourseHiveModel> courses;

  @HiveField(6)
  final String username;

  @HiveField(7)
  final String password;

  // Constructor
  StudentHiveModel({
    String? studentId,
    required this.fname,
    required this.lname,
    required this.phone,
    required this.batch,
    required this.courses,
    required this.username,
    required this.password,
  }) : studentId = studentId ?? const Uuid().v4();

  // empty constructor
  StudentHiveModel.empty()
      : this(
          studentId: '',
          fname: '',
          lname: '',
          phone: '',
          batch: BatchHiveModel.empty(),
          courses: [],
          username: '',
          password: '',
        );

  // Convert Hive Object to Entity
  StudentEntity toEntity() => StudentEntity(
        fname: fname,
        lname: lname,
        phone: phone,
        batch: batch.toEntity(),
        courses: CourseHiveModel.empty().toEntityList(courses),
        username: username,
        password: password,
      );

  // Convert Entity to Hive Object
  StudentHiveModel toHiveModel(StudentEntity entity) => StudentHiveModel(
        fname: entity.fname,
        lname: entity.lname,
        phone: entity.phone,
        batch: BatchHiveModel.empty().toHiveModel(entity.batch!),
        courses: CourseHiveModel.empty().toHiveModelList(entity.courses),
        username: entity.username,
        password: entity.password,
      );

  // Convert Entity List to Hive List
  List<StudentHiveModel> toHiveModelList(List<StudentEntity> entities) =>
      entities.map((entity) => toHiveModel(entity)).toList();

  @override
  String toString() {
    return 'studentId: $studentId, fname: $fname, lname: $lname, phone: $phone, batch: $batch, courses: $courses, username: $username, password: $password';
  }
}
