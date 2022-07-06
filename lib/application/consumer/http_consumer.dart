import 'package:http/http.dart' as http;
import 'package:starwars_connection/core/abstracts/consumer.dart';

class HttpConsumer extends Consumer<http.Response> {
  final http.Client client = http.Client();

  @override
  Future<http.Response?> fetch({required String url}) async {
    try {
      final Uri uri = Uri.parse(url);
      return await client.get(uri);
    } catch (e) {
      return null;
    }
  }
}
