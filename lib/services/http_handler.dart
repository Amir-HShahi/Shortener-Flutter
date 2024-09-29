import 'package:http/http.dart' as http;

Future<http.Response> shortenURL(String name, String address) {
  return http.get(
    Uri.parse('http://10.0.2.2:666/api/shorten/?url=$address'),
  );
}
