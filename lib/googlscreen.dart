import 'package:flutter/material.dart';
import 'package:google_ex/resultSCreen.dart';

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
        MaterialPageRoute(
          builder: (context) => ResultScreen(query: query),
        ),
      );
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
              onPressed: () {},
              child: Text(
                "About",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),

            TextButton(
              onPressed: () {},
              child: Text(
                "Store",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  "Gmail",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              SizedBox(width: 10),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Images",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              SizedBox(width: 10),
              IconButton(onPressed: () {}, icon: Icon(Icons.wine_bar)),
              IconButton(
                onPressed: () {},
                icon: SizedBox(
                  width: 24,
                  height: 24,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // 3x3 grid
                          mainAxisSpacing: 2,
                          crossAxisSpacing: 2,
                        ),
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey, // dot color
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(width: 10),
              IconButton(onPressed: () {}, icon: CircleAvatar()),
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
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.mic),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.image_search),
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
              ElevatedButton(onPressed: _search, child: Text("Google Search")),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text("I'm Feeling Lucky"),
              ),
            ],
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Google offered in:"),
              TextButton(
                child: Text("हिन्दी", style: TextStyle(color: Colors.indigo)),
                onPressed: () {},
              ),
              TextButton(
                child: Text("বাংলা", style: TextStyle(color: Colors.indigo)),
                onPressed: () {},
              ),
              TextButton(
                child: Text("తెలుగు", style: TextStyle(color: Colors.indigo)),
                onPressed: () {},
              ),
              TextButton(
                child: Text("मराठी", style: TextStyle(color: Colors.indigo)),
                onPressed: () {},
              ),
              TextButton(
                child: Text("தமிழ்", style: TextStyle(color: Colors.indigo)),
                onPressed: () {},
              ),
              TextButton(
                child: Text("ગુજરાતી", style: TextStyle(color: Colors.indigo)),
                onPressed: () {},
              ),
              TextButton(
                child: Text("ಕನ್ನಡ", style: TextStyle(color: Colors.indigo)),
                onPressed: () {},
              ),
              TextButton(
                child: Text("മലയാളം", style: TextStyle(color: Colors.indigo)),
                onPressed: () {},
              ),
              TextButton(
                child: Text("ਪੰਜਾਬੀ", style: TextStyle(color: Colors.indigo)),
                onPressed: () {},
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
                "India",
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
                    onTap: () {},
                    child: Text(
                      "Advertising",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Business",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "How Search Works",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Privacy",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Terms",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
