import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
  final _posts = const [
    {
      "userName": "Nurmomade Ali",
      "userImage":
          "https://media-exp1.licdn.com/dms/image/D4D35AQHn5X8Y-25QHg/profile-framedphoto-shrink_100_100/0/1622900878670?e=1626282000&v=beta&t=-5amweZZBHueZ2x3UZl9jfzdEo6147FiUYNt00BjUdY",
      "number": "2nd",
      "currentPosition": "Intermodal Transport Specialist na CMA CGM",
      "createdAt": "2 m",
      "image":
          "https://media-exp1.licdn.com/dms/image/C4D22AQEmYtl0Po3xQA/feedshare-shrink_2048_1536/0/1619508784921?e=1629331200&v=beta&t=iKpCyP_MKRguwxezw6ggZddmhzTJ4kJYXZ1CXWwDBcw",
      "caption":
          """Ha alguns meses atras recebi com agrado o convite da AMECON (Associação Moçambicana de Economistas) da qual sou membro, para participar da iniciativa Cafe Negócios organizada pela Revista Negócios com o tema "Desafios da Economia Moçambicana na era da Nova Normalidade".
Abaixo a foto família e a minha intervenção.""",
      "likeBadges": [
        "assets/icons/like.svg",
        "assets/icons/congrats.svg",
        "assets/icons/support.svg",
      ],
      "reactions": 33,
      "comments": 1,
    },
    {
      "userName": "Dulcidonio Dos Santos Júnior",
      "userImage":
          "https://media-exp1.licdn.com/dms/image/C4D03AQGsu6iOGmIQwQ/profile-displayphoto-shrink_200_200/0/1612965833928?e=1631750400&v=beta&t=MRY-BfBxiAD3i-qBB4V1USFXpM8N3Ct4iu8oPzfhegM",
      "number": "1st",
      "currentPosition": "Applied Technology student.",
      "createdAt": "2 h",
      "image": null,
      "caption":
          """The Strongest techonological security measure can be quickly defeated if the employees angage in unsafe behaviours...
          
So when implementing security policies, I feel that User Education and Awareness Policy is very important, because it helps employees be familiarized with organization's security policy, is where there will find answers of how to respond to security events, and is where the reporting procedures for suspected security violations will be found..""",
      "likeBadges": ["assets/icons/like.svg"],
      "reactions": 1,
      "comments": 0,
    },
    {
      "userName": "Ruben Manhiça",
      "userImage":
          "https://media-exp1.licdn.com/dms/image/C4E03AQGgcvK6VjmQwA/profile-displayphoto-shrink_100_100/0/1566278149183?e=1631750400&v=beta&t=TxGmaRhmjXWJEblmuFGUEGRPPg_BiIm0cgQS-zx0T2Y",
      "number": "1st",
      "currentPosition": "Consultant | Software Developer | Lecturer",
      "createdAt": "1 y",
      "image": null,
      "caption": """Hard work beats talent if talent doesn't work hard.
~ Tim Notke""",
      "likeBadges": ["assets/icons/like.svg"],
      "reactions": 17,
      "comments": 2,
    },
    {
      "userName": "Abel Ernesto",
      "userImage":
          "https://media-exp1.licdn.com/dms/image/C4D03AQHsmrI2ra4HTw/profile-displayphoto-shrink_100_100/0/1597696339477?e=1631750400&v=beta&t=inFg_0ph_lYHKYMiF83SCY4wFRZ55WekrM_hVadqQ7A",
      "number": "1st",
      "currentPosition":
          "Customer Insight Specialist | UX Researcher | CX Analyst | Teacher",
      "createdAt": "1 m",
      "image":
          "https://media-exp1.licdn.com/dms/image/C4D22AQHP_ZAepACndw/feedshare-shrink_800/0/1623178814906?e=1629331200&v=beta&t=rO27gdOcKworSblxDtsIrfmUoKNmsEuoBDVRETijvjM",
      "caption":
          """In a world where #customer, #Product #Experience and #Revenue are inseparable, Understating Users(needs, pains, behavior's) was never more important as customer’s often switch brand’s because a poor customer experience and more over because of products that doesn’t respond to their needs.  
          
The ability to plan, design, carry on a #UserResearch Program that collects actionable insights is crucial to link the metrics above, create successful Business Models, design products that solve real world needs, improve Relationships and therefore create a better world. 
          
And that is what I learned in this great course from #interactiondesignfoundation , and I look forward to put all of them in practice….!""",
      "likeBadges": [
        "assets/icons/like.svg",
        "assets/icons/congrats.svg",
      ],
      "reactions": 45,
      "comments": 14,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1.0,
        title: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/profile.jpeg"),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(238, 241, 246, 1.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          icon: Icon(Icons.search),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    GestureDetector(child: Icon(Icons.qr_code_scanner)),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.textsms),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ..._posts.map((post) {
              return Column(
                children: [
                  PostCard(
                    post: post,
                  ),
                  SizedBox(
                    height: 10.0,
                  )
                ],
              );
            }).toList(),
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
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Header Post
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
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
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          Text("*"),
                          const SizedBox(width: 5.0),
                          Text(
                            post["number"],
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
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
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_horiz),
                ),
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
            child: Divider(
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
                  children: <Widget>[
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
                  children: <Widget>[
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
                  children: <Widget>[
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
                  children: <Widget>[
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
