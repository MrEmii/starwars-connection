import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:starwars_connection/core/abstracts/consumer.dart';
import 'package:starwars_connection/core/abstracts/dto.dart';

class HttpConsumer extends Consumer<http.Response> {
  final http.Client client = http.Client();

  @override
  Future<http.Response?> get({required String url}) async {
    try {
      final Uri uri = Uri.parse(url);
      return await client.get(uri);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<http.Response?> post({required String url, required RequestDTO dto}) async {
    try {
      final Uri uri = Uri.parse(url);
      return await client.post(
        uri,
        body: json.encode(dto.toMap()),
        headers: {
          'Content-Type': 'application/json',
        },
      );
    } catch (e) {
      return null;
    }
  }
}
