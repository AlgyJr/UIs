import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'dummy_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LinkedIn',
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
        appBarTheme: AppBarTheme.of(context).copyWith(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.grey[700]),
        ),
        scaffoldBackgroundColor: Color.fromRGBO(232, 229, 222, 1.0),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1.0,
        title: Row(
          children: <Widget>[
            const CircleAvatar(
              backgroundImage: AssetImage("assets/images/profile.jpeg"),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(238, 241, 246, 1.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: "Search",
                          icon: Icon(Icons.search),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    GestureDetector(child: const Icon(Icons.qr_code_scanner)),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.textsms),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: DUMMY_POSTS.length,
        itemBuilder: (context, index) => Column(
          children: [
            PostCard(
              post: DUMMY_POSTS[index],
            ),
            const SizedBox(
              height: 10.0,
            )
          ],
        ),
      ),
      bottomNavigationBar: Bottomnavigationbar(),
    );
  }
}

class Bottomnavigationbar extends StatefulWidget {
  const Bottomnavigationbar({
    Key? key,
  }) : super(key: key);

  @override
  _BottomnavigationbarState createState() => _BottomnavigationbarState();
}

class _BottomnavigationbarState extends State<Bottomnavigationbar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: (index) => setState(() {
        _currentIndex = index;
      }),
      selectedFontSize: 12.0,
      unselectedFontSize: 12.0,
      selectedItemColor: Colors.black,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: "My Network",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_box),
          label: "Post",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: "Notifications",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.work),
          label: "Jobs",
        ),
      ],
    );
  }
}

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Map<String, dynamic> post;

  @override
  Widget build(BuildContext context) {
    print(post);
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Header Post
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(post["userImage"]),
                  radius: 25,
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: Text(
                                    post["userName"],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textWidthBasis: TextWidthBasis.longestLine,
                                  ),
                                ),
                                const SizedBox(width: 1.0),
                                Text("•"),
                                const SizedBox(width: 1.0),
                                Text(
                                  post["number"],
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        post["currentPosition"],
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 14,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        post["createdAt"],
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              fontSize: 14,
                            ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.more_horiz),
              ],
            ),
          ),
          // Caption
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              post["caption"],
              style: Theme.of(context).textTheme.caption!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
            ),
          ),
          if (post["image"] != null) Image.network(post["image"]),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                // A list of badges
                Row(
                  children: <Widget>[
                    ...post["likeBadges"].map(
                      (badge) => SvgPicture.asset(
                        badge,
                        height: 20.0,
                        width: 20.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 5.0),
                Text(
                  "13",
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontSize: 16),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: const Divider(
              thickness: 1.0,
              height: 0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextButton(
                onPressed: () {},
                child: Column(
                  children: const <Widget>[
                    Icon(Icons.thumb_up_outlined),
                    Text(
                      "Like",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                    Color.fromRGBO(102, 102, 102, 1.0),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Column(
                  children: const <Widget>[
                    Icon(Icons.comment_outlined),
                    Text(
                      "Comment",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                    Color.fromRGBO(102, 102, 102, 1.0),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Column(
                  children: const <Widget>[
                    Icon(Icons.share),
                    Text(
                      "Share",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                    Color.fromRGBO(102, 102, 102, 1.0),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Column(
                  children: const <Widget>[
                    Icon(Icons.send),
                    Text(
                      "Send",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                    Color.fromRGBO(102, 102, 102, 1.0),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
