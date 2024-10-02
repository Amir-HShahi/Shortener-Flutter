import 'package:http/http.dart' as http;

Future<http.Response> shortenLink(String name, String address) {
  return http.get(
    Uri.parse('http://10.0.2.2:666/api/shorten/?url=$address'),
  );
}

Future<String> fetchLinks() async {
  final response = await http.get(Uri.parse('http://10.0.2.2:666/api/all/'));
  return response.body;
}
