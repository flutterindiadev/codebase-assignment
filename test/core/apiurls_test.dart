import 'package:assignment/core/apiurls.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<ApiUrls>()])
void main() {
  group('ApiUrls', () {
    late ApiUrls apiUrls;

    setUp(() {
      apiUrls = ApiUrls();
    });

    test('User URLs are correctly assigned', () {
      expect(apiUrls.getUsers, '/api/users');
      expect(apiUrls.getUserDetails('1'), '/api/users/1');
    });
  });
}
