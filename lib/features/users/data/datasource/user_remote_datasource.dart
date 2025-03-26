import 'package:assignment/core/api_handler_middleware.dart';
import 'package:assignment/core/api_response.dart';
import 'package:assignment/core/apiurls.dart';
import 'package:assignment/core/requestoptions.dart';
import 'package:assignment/features/users/data/model/user_model.dart';

abstract class UserRemoteDatasource {
  Future<ApiResponse<List<UserModel>>> getUsers(int noOfUser, int page);
  Future<ApiResponse<UserModel>> getUserDetails(int id);
}

class UserRemoteDatasourceImpl extends ApiHandlerMiddleWare
    implements UserRemoteDatasource {
  final ApiUrls apiUrls;
  final ApiHandlerMiddleWare apiHandlerMiddleWare;
  UserRemoteDatasourceImpl(
    this.apiUrls,
    this.apiHandlerMiddleWare,
  ) : super(apiHandlerMiddleWare.serverRequestManager);

  @override
  Future<ApiResponse<List<UserModel>>> getUsers(int noOfUser, int page) async {
    final response = await apiHandlerMiddleWare.sendRequest<List<UserModel>>(
      AppRequestOptions(
        RequestTypes.get,
        "${apiUrls.getUsers}?per_page=$noOfUser&page=$page",
      ),
    );
    return response;
  }

  @override
  Future<ApiResponse<UserModel>> getUserDetails(int id) async {
    final response = await apiHandlerMiddleWare.sendRequest<UserModel>(
      AppRequestOptions(
        RequestTypes.get,
        apiUrls.getUserDetails(id.toString()),
      ),
    );
    return response;
  }
}
