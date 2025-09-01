import 'dart:convert';
import 'package:http/http.dart' as http;

class GoogleSearchService {
  final String apiKey = "AIzaSyDEkPpiof36ISpSqhdCpV1VNAJZEcFcQxU";
  final String cx = "665ef77ad40d840f8";

  Future<List<dynamic>> search(String query) async {
    final url = Uri.parse(
      "https://www.googleapis.com/customsearch/v1?q=$query&key=$apiKey&cx=$cx",
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final items = data['items'] ?? [];

      // add faviconUrl
      for (var item in items) {
        try {
          final uri = Uri.parse(item['link']);
          if (uri.host.isNotEmpty) {
            // Try root favicon.ico
            item['faviconUrl'] = "${uri.scheme}://${uri.host}/favicon.ico";
          } else {
            item['faviconUrl'] = null;
          }
        } catch (_) {
          item['faviconUrl'] = null;
        }
      }

      return items;
    } else {
      throw Exception("Failed: ${response.statusCode}");
    }
  }
}
