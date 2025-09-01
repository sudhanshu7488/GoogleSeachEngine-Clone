import 'package:flutter/material.dart';
import '../services/google_search_service.dart';
import 'dart:html' as html;

class ResultScreen extends StatefulWidget {
  final String query;
  const ResultScreen({super.key, required this.query});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final _service = GoogleSearchService();
  List<dynamic> _results = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetchResults();
  }

  void _fetchResults() async {
    try {
      final results = await _service.search(widget.query);
      setState(() {
        _results = results;
      });
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    } finally {
      setState(() => _loading = false);
    }
  }

  void _openUrl(String url) {
    html.window.open(url, "_blank");
  }

  String buildFaviconUrl(String url) {
    try {
      final uri = Uri.parse(url);
      return "https://www.google.com/s2/favicons?domain=${uri.host}&sz=64";
    } catch (_) {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Results for '${widget.query}'")),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _results.isEmpty
          ? const Center(child: Text("No results found"))
          : ListView.builder(
              itemCount: _results.length,
              itemBuilder: (context, index) {
                final item = _results[index];
                return ListTile(
                  // leading: CircleAvatar(
                  //   backgroundImage:
                  //       (item['link'] != null &&
                  //           buildFaviconUrl(item['link']).isNotEmpty)
                  //       ? NetworkImage(buildFaviconUrl(item['link']))
                  //       : null,
                  //   child: (buildFaviconUrl(item['link']).isEmpty)
                  //       ? const Icon(Icons.public, color: Colors.grey)
                  //       : null,
                  // ),

                  title: InkWell(
                    child: Text(
                      item['title'],
                      style: TextStyle(color: Colors.indigo, fontSize: 24),
                    ),
                    onTap: () => _openUrl(item['link']),
                  ),
                  subtitle: Text(item['snippet']),
                );
              },
            ),
    );
  }
}
