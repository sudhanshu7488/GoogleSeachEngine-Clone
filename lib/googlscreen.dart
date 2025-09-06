import 'package:flutter/material.dart';
import 'package:google_ex/resultSCreen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:easy_localization/easy_localization.dart';

class GoogleSCreen extends StatefulWidget {
  const GoogleSCreen({super.key});
  @override
  State<GoogleSCreen> createState() => _GoogleSCreenState();
}

class _GoogleSCreenState extends State<GoogleSCreen> {
  final TextEditingController _controller = TextEditingController();
  void _search() {
    final query = _controller.text.trim();
    if (query.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultScreen(query: query)),
      );
    }
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    double screenwidth = screensize.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            TextButton(
              onPressed: () => _launchURL(
                "https://about.google/?fg=1&utm_source=google-IN&utm_medium=referral&utm_campaign=hp-header",
              ),
              child: Text(
                "about".tr(),
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () => _launchURL(
                "https://store.google.com/in/?utm_source=hp_header&utm_medium=google_ooo&utm_campaign=GS100042&hl=en-IN",
              ),
              child: Text(
                "store".tr(),
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              TextButton(
                onPressed: () => _launchURL("https://www.gmail.com"),
                child: Text(
                  "gmail".tr(),
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              SizedBox(width: 10),
              TextButton(
                onPressed: () => _launchURL(
                  "https://www.google.com/imghp?hl=en&authuser=0&ogbl",
                ),
                child: Text(
                  "images".tr(),
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ],
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "G",
                style: TextStyle(
                  fontSize: 100,
                  color: Colors.blue,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                "o",
                style: TextStyle(
                  fontSize: 100,
                  color: Colors.red,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                "o",
                style: TextStyle(
                  fontSize: 100,
                  color: Colors.amber,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                "g",
                style: TextStyle(
                  fontSize: 100,
                  color: Colors.blue,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                "l",
                style: TextStyle(
                  fontSize: 100,
                  color: Colors.green,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                "e",
                style: TextStyle(
                  fontSize: 100,
                  color: Colors.red,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          Container(
            width: screenwidth * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(24),
                right: Radius.circular(24),
              ),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: TextField(
              controller: _controller,
              minLines: 1,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: ValueListenableBuilder<TextEditingValue>(
                  valueListenable: _controller,
                  builder: (context, value, child) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (value.text.isNotEmpty)
                          IconButton(
                            onPressed: () => _controller.clear(),
                            icon: const Icon(Icons.close),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: _search, child: Text("search".tr())),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () => _launchURL("https://doodles.google/"),
                child: Text("lucky".tr()),
              ),
            ],
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("offered".tr()),
              TextButton(
                child: Text("English", style: TextStyle(color: Colors.indigo)),
                onPressed: () => context.setLocale(const Locale('en')),
              ),
              TextButton(
                child: Text("हिन्दी", style: TextStyle(color: Colors.indigo)),
                onPressed: () => context.setLocale(const Locale('hi')),
              ),
              TextButton(
                child: Text("বাংলা", style: TextStyle(color: Colors.indigo)),
                onPressed: () => context.setLocale(const Locale('bn')),
              ),
              TextButton(
                child: Text("తెలుగు", style: TextStyle(color: Colors.indigo)),
                onPressed: () => context.setLocale(const Locale('te')),
              ),
              TextButton(
                child: Text("मराठी", style: TextStyle(color: Colors.indigo)),
                onPressed: () => context.setLocale(const Locale('mr')),
              ),
              TextButton(
                child: Text("தமிழ்", style: TextStyle(color: Colors.indigo)),
                onPressed: () => context.setLocale(const Locale('ta')),
              ),
              TextButton(
                child: Text("ગુજરાતી", style: TextStyle(color: Colors.indigo)),
                onPressed: () => context.setLocale(const Locale('gu')),
              ),
              TextButton(
                child: Text("ಕನ್ನಡ", style: TextStyle(color: Colors.indigo)),
                onPressed: () => context.setLocale(const Locale('kn')),
              ),
              TextButton(
                child: Text("മലയാളം", style: TextStyle(color: Colors.indigo)),
                onPressed: () => context.setLocale(const Locale('ml')),
              ),
              TextButton(
                child: Text("ਪੰਜਾਬੀ", style: TextStyle(color: Colors.indigo)),
                onPressed: () => context.setLocale(const Locale('pa')),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 90,
        width: screenwidth,
        decoration: BoxDecoration(color: Colors.grey[200]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "india".tr(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 0.5,
              width: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.grey),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => _launchURL(
                      "https://business.google.com/in/google-ads/?subid=ww-ww-et-g-awa-a-g_hpafoot1_1!o2&utm_source=google.com&utm_medium=referral&utm_campaign=google_hpafooter&fg=1",
                    ),
                    child: Text(
                      "advertising".tr(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  InkWell(
                    onTap: () => _launchURL(
                      "https://business.google.com/in/business-profile/?subid=ww-ww-et-g-awa-a-g_hpbfoot1_1!o2&utm_source=google.com&utm_medium=referral&utm_campaign=google_hpbfooter&fg=1",
                    ),
                    child: Text(
                      "business".tr(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  InkWell(
                    onTap: () => _launchURL(
                      "https://www.google.com/search/howsearchworks/?fg=1",
                    ),
                    child: Text(
                      "how_search_works".tr(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () => _launchURL(
                      "https://policies.google.com/privacy?hl=en-IN&fg=1",
                    ),
                    child: Text(
                      "privacy".tr(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  InkWell(
                    onTap: () => _launchURL(
                      "https://policies.google.com/terms?hl=en-IN&fg=1",
                    ),
                    child: Text(
                      "terms".tr(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
