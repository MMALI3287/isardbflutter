import 'package:isar/isar.dart';
import 'package:isardbflutter/user.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

Future<String> getDatabaseDirectory() async {
  final appDirectory = await path_provider.getApplicationDocumentsDirectory();
  return appDirectory.path;
}

class IsarService {
  late Future<Isar> db;
  late final Future<String> directory;

  IsarService() {
    directory = getDatabaseDirectory();
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [UserSchema],
        directory: directory.toString(),
        inspector: true,
      );
    }
    return Future.value(Isar.getInstance());
  }

  Future<void> saveUser(User user) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.users.putSync(user));
  }
}
