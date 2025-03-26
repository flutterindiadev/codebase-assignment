import 'package:injectable/injectable.dart';

@lazySingleton
class ApiUrls {
  final String getUsers = '/api/users';
  String getUserDetails(String userId) => '/api/users/$userId';
}
