import 'package:http/http.dart' as http;

class HttpClient {
  final http.Client client;

  HttpClient({http.Client? client}) : client = client ?? http.Client();

  Future<http.Response> get(String url) {
    return client.get(Uri.parse(url));
  }

  void close() {
    client.close();
  }
}
