import 'package:assignment/features/users/domain/entity/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/fixtures/fixture_reader.dart';

void main() {
  group('User Entity', () {
    test('User entity', () async {
      final json = fixtureJson('users.json');

      final UserEntity asset = UserEntity.fromJson(json);
      expect(asset, isA<UserEntity>());
    });
  });
}
