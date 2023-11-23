import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static const String _baseUrl = 'randomuser.me';

  static Future<Response> get({
    required String endPoint,
    required Map<String, String> query,
  }) async {
    final request = Uri.https(_baseUrl, endPoint, query);
    print('Request Uri is $request');

    Response response = await http.get(request);
    return response;
  }
}
