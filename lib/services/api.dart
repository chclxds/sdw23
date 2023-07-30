import 'package:app_sdw23/models/users_models/users_models.dart';
import 'package:http/http.dart' as http;

class ApiApp {
  static Future<UsersModels> fetchUser(int id) async {
    var result = await http
        .get(Uri.parse("https://sdw-2023-prd.up.railway.app/users/1"));
    return UsersModels.fromJson(result.body);
  }
}
