import 'package:assignment/features/users/data/model/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/fixtures/fixture_reader.dart';

void main() {
  test('AssetsModel should deserialize from JSON correctly', () {
    final json = fixtureJson('users.json');

    final model = UserModel.fromJson(json);

    expect(model, isA<UserModel>());
    expect(model.id, json['id']);
    expect(model.first_name, json['first_name']);
    expect(model.last_name, json['last_name']);
    expect(model.email, json['email']);
    expect(model.avatar, json['avatar']);
  });
}
