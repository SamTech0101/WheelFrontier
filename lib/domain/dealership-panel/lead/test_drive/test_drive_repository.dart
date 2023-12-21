import 'test_drive.dart';

abstract class TestDriveRepository {
  Future<List<TestDrive>> fetchTestDrives(int limit, int offset);
  Future<String> update(TestDrive testDrive);
}
