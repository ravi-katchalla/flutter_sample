import 'package:http/http.dart' as http;

class Github {
  final String userName;
  final String url = 'https://api.github.com/';
  static String client_id = 'fb4a79b6846b4915564d';
  static String client_secret = 'c22854308581871cfefa23abc6c03d09916140dc';

  final String query = "?client_id=${client_id}&client_secret=${client_secret}";

  Github(this.userName);

  Future<http.Response> fetchUser() {
    return http.get(Uri.parse(url + 'users/' + userName + query));
  }

  Future<http.Response> fetchFollowing() {
    return http.get(Uri.parse(url + 'users/' + userName + '/following' + query));
  }
}
