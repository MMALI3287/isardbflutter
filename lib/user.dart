import 'package:isar/isar.dart';

part 'user.g.dart';

@Collection()
class User {
  Id id = Isar.autoIncrement;
  late String email;
  late String password;
  late String name;
  late String phone;
  late String address;
  late String gender;
  late DateTime birthday;
  late String bio;
}
