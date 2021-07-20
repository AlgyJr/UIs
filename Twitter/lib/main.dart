import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter/dummy_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter',
      themeMode: ThemeMode.dark,
      darkTheme: Theme.of(context).copyWith(
        scaffoldBackgroundColor: darkBackgroundColor,
        colorScheme: ColorScheme.dark(),
        primaryColor: primaryColor,
        textTheme: TextTheme(
          caption: TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            automaticallyImplyLeading: false,
            titleSpacing: size.width - 430.0,
            forceElevated: true,
            elevation: 1.0,
            pinned: false,
            floating: true,
            snap: true,
            toolbarHeight: 120.0,
            title: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.menu,
                        color: Theme.of(context).primaryColor,
                        size: 30.0,
                      ),
                      SvgPicture.asset(
                        'assets/icons/twitter_logo.svg',
                        color: Theme.of(context).primaryColor,
                        width: 40.0,
                      ),
                      SvgPicture.asset(
                        'assets/icons/content_preference.svg',
                        color: Theme.of(context).primaryColor,
                        width: 30.0,
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(width: 20.0),
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 5.0),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://pbs.twimg.com/profile_images/1319568255225397249/nD-wrZhw_x96.jpg'),
                              radius: 25.0,
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 5,
                            child: CircleAvatar(
                              radius: 8.0,
                              child: Icon(
                                Icons.add,
                                size: 15.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10.0),
                      ...DUMMY_STORIES.map(
                        (story) => Story(
                          userName: story['userName'],
                          image: story['userImage'],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    '${DUMMY_POSTS[index]['userImage']}'),
                                radius: 30.0,
                              ),
                            ],
                          ),
                          const SizedBox(width: 10.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // header
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Flexible(
                                            child: Text(
                                              '${DUMMY_POSTS[index]['userName']}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const SizedBox(width: 5.0),
                                          Text(
                                            '${DUMMY_POSTS[index]['account']}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption,
                                          ),
                                          Text(
                                            '•',
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption,
                                          ),
                                          Text(
                                            '${DUMMY_POSTS[index]['createdDate']}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      Icons.more_horiz,
                                      color: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .color,
                                    ),
                                  ],
                                ),
                                // caption
                                Text(
                                  '${DUMMY_POSTS[index]['caption']}',
                                  maxLines: 10,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                                ),
                                if (DUMMY_POSTS[index]['image'] != null)
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Image.network(
                                        '${DUMMY_POSTS[index]['image']}',
                                        fit: BoxFit.fitWidth,
                                        filterQuality: FilterQuality.high,
                                      ),
                                    ),
                                  ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/comment.svg',
                                          color: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .color,
                                        ),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                            '${DUMMY_POSTS[index]['quoteRetweets']}'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/retweet.svg',
                                          color: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .color,
                                        ),
                                        const SizedBox(width: 10.0),
                                        Text(
                                            '${DUMMY_POSTS[index]['retweets']}'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          DUMMY_POSTS[index]['liked'] == true
                                              ? 'assets/icons/like.svg'
                                              : 'assets/icons/like_outlined.svg',
                                          color: DUMMY_POSTS[index]['liked'] ==
                                                  true
                                              ? Colors.red
                                              : Theme.of(context)
                                                  .textTheme
                                                  .caption!
                                                  .color,
                                        ),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        Text('${DUMMY_POSTS[index]['likes']}'),
                                      ],
                                    ),
                                    SvgPicture.asset(
                                      'assets/icons/share.svg',
                                      color: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .color,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: .5,
                      color: Theme.of(context).textTheme.caption!.color,
                    ),
                  ],
                );
              },
              childCount: DUMMY_POSTS.length,
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(
            top: 8.0, right: 0.0, bottom: 20.0, left: 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  index = 0;
                });
              },
              child: SvgPicture.asset(
                index == 0
                    ? 'assets/icons/home.svg'
                    : 'assets/icons/home_outlined.svg',
                color: Theme.of(context).primaryColor,
                width: 30.0,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  index = 1;
                });
              },
              child: SvgPicture.asset(
                index == 1
                    ? 'assets/icons/search_selected.svg'
                    : 'assets/icons/search.svg',
                color: Theme.of(context).primaryColor,
                width: 30.0,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  index = 2;
                });
              },
              child: SvgPicture.asset(
                index == 2
                    ? 'assets/icons/notifications.svg'
                    : 'assets/icons/notifications_outlined.svg',
                color: Theme.of(context).primaryColor,
                width: 30.0,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  index = 3;
                });
              },
              child: SvgPicture.asset(
                index == 3
                    ? 'assets/icons/messages.svg'
                    : 'assets/icons/messages_outlined.svg',
                color: Theme.of(context).primaryColor,
                width: 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Story extends StatelessWidget {
  const Story({
    Key? key,
    this.userName,
    this.image,
  }) : super(key: key);

  final String? userName;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 3.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: CircleAvatar(
                radius: 22.0,
                backgroundImage: NetworkImage(image!),
              ),
            ),
          ),
          LimitedBox(
            maxWidth: 60.0,
            child: Text(
              userName!,
              style: TextStyle(
                fontSize: 14.0,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
