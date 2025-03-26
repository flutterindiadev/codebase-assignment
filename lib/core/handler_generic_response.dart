import 'package:assignment/features/users/data/model/user_model.dart';
import 'package:dio/dio.dart';

T handleGenericResponse<T>(Response response) {
  T? responseType;
  if (T == UserModel) {
    responseType = UserModel.fromJson(response.data['data']) as T;
  } else if (T == List<UserModel>) {
    responseType = (response.data as Map<String, dynamic>)['data']
        .map<UserModel>((json) => UserModel.fromJson(json))
        .toList() as T;
  }
  return responseType ?? response.data;
}
