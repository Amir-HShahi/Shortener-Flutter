import 'package:http/http.dart' as http;

Future<http.Response> shortenLink(String name, String address) {
  return http.get(
    Uri.parse('http://195.177.255.95:616/api/shorten/?url=$address'),
  );
}

Future<String> fetchLinks() async {
  final response = await http.get(Uri.parse('http://195.177.255.95:616/api/all/'));
  return response.body;
}
