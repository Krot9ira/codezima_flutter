import 'dart:convert';
import 'dart:io';

//add error handler
class ApiClient {
  final _client = HttpClient();
  static const _host = 'http://localhost:3000/users';

//post make user
  Future<String> registration(
      {required String fullName,
      required String email,
      required String password}) async {
    final url = Uri.parse(_host);
    final parameters = <String, dynamic>{
      'name': fullName,
      "email": email,
      'password': password,
    };
    final request = await _client.post('10.0.2.2', 3000, '/users');
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(parameters));

    final response = await request.close();
    final json = await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((v) => jsonDecode(v) as Map<String, dynamic>);

    return json['name'] as String;
  }

  // get password and email
  Future<String> auth() async {
    return 'temp';
  }
}
