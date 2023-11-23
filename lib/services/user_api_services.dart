import 'package:api_testing/services/api_services.dart';
import 'package:http/http.dart';

class UserApiService {
  Future<Response> usersList({
    required String pageSize,
  }) async {
    Response response = await ApiServices.get(
      endPoint: '/api',
      query: {'results': pageSize},
    );
    print('Response is $response');
    return response;
  }
}
