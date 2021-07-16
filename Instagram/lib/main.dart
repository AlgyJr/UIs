import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      darkTheme: Theme.of(context).copyWith(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.dark(),
        primaryColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        textTheme: TextTheme(
          caption: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final _stories = const [
    {
      "userName": "guyzelh.ramos",
      "userImage":
          "https://instagram.fmpm3-1.fna.fbcdn.net/v/t51.2885-19/s320x320/124869295_374928807060715_5108607728124507950_n.jpg?_nc_ht=instagram.fmpm3-1.fna.fbcdn.net&_nc_ohc=fRmpwUmTMp0AX-KGxHf&edm=ABfd0MgBAAAA&ccb=7-4&oh=adc4253169c2a9a9900be41453649a96&oe=60F7E790&_nc_sid=7bff83",
    },
    {
      "userName": "dancamdev",
      "userImage":
          "https://instagram.fmpm3-1.fna.fbcdn.net/v/t51.2885-19/s150x150/129717745_406089307186056_5971741534359860212_n.jpg?_nc_ht=instagram.fmpm3-1.fna.fbcdn.net&_nc_ohc=Waavl-xmOL0AX8pfBge&tn=umCFbt2nIp768yJX&edm=AHG7ALcBAAAA&ccb=7-4&oh=626ed42124d68a40c058167a78a9faa5&oe=60F73E16&_nc_sid=5cbaad",
    },
    {
      "userName": "edouard_iosdev",
      "userImage":
          "https://instagram.fmpm3-1.fna.fbcdn.net/v/t51.2885-19/s320x320/41387408_336297343604532_8217018022095749120_n.jpg?_nc_ht=instagram.fmpm3-1.fna.fbcdn.net&_nc_ohc=earMscBKTQQAX_vn66H&edm=ABfd0MgBAAAA&ccb=7-4&oh=d2743ece7bf6e638644d47ec255ef90f&oe=60F71157&_nc_sid=7bff83",
    },
    {
      "userName": "aivars_meijers",
      "userImage":
          "https://instagram.fmpm3-1.fna.fbcdn.net/v/t51.2885-19/s320x320/159258785_206604457917839_3428021859745386881_n.jpg?_nc_ht=instagram.fmpm3-1.fna.fbcdn.net&_nc_ohc=8dSPBhPJsvAAX8NYwi0&tn=umCFbt2nIp768yJX&edm=ABfd0MgBAAAA&ccb=7-4&oh=105286173846eaa7c1aab03469b0daf6&oe=60F7880B&_nc_sid=7bff83",
    },
    {
      "userName": "manchesterunited",
      "userImage":
          "https://instagram.fmpm3-1.fna.fbcdn.net/v/t51.2885-19/s320x320/182006495_261224475741844_8575993191776622154_n.jpg?_nc_ht=instagram.fmpm3-1.fna.fbcdn.net&_nc_ohc=9lbK6tyVbRYAX9u2_hN&edm=ABfd0MgBAAAA&ccb=7-4&oh=324bedc8bb8fad42fe5f6fc0bd75f326&oe=60F7FBF6&_nc_sid=7bff83",
    },
    {
      "userName": "mkbhd",
      "userImage":
          "https://instagram.fmpm3-1.fna.fbcdn.net/v/t51.2885-19/s320x320/119212035_239827994073834_7752811925137782806_n.jpg?_nc_ht=instagram.fmpm3-1.fna.fbcdn.net&_nc_ohc=D2KggxN6dW8AX-IKDAf&edm=ABfd0MgBAAAA&ccb=7-4&oh=1da694da56c1d08ce52dedbe68529a09&oe=60F75AF1&_nc_sid=7bff83",
    },
    {
      "userName": "cristiano",
      "userImage":
          "https://instagram.fmpm3-1.fna.fbcdn.net/v/t51.2885-19/s320x320/67310557_649773548849427_4130659181743046656_n.jpg?_nc_ht=instagram.fmpm3-1.fna.fbcdn.net&_nc_ohc=BsrtEUFUw7kAX-x7wXt&edm=ABfd0MgBAAAA&ccb=7-4&oh=35e70219384bee774a08b288025f6abe&oe=60F75263&_nc_sid=7bff83",
    },
    {
      "userName": "apple",
      "userImage":
          "https://instagram.fmpm3-1.fna.fbcdn.net/v/t51.2885-19/s320x320/20635165_1942203892713915_5464937638928580608_a.jpg?_nc_ht=instagram.fmpm3-1.fna.fbcdn.net&_nc_ohc=-lJa-08Ra7kAX8_yoVP&tn=umCFbt2nIp768yJX&edm=ABfd0MgBAAAA&ccb=7-4&oh=af78ce684ebb166d41e06f67c79f854a&oe=60F6845C&_nc_sid=7bff83",
    },
    {
      "userName": "google",
      "userImage":
          "https://instagram.fmpm3-1.fna.fbcdn.net/v/t51.2885-19/s320x320/126151620_3420222801423283_6498777152086077438_n.jpg?_nc_ht=instagram.fmpm3-1.fna.fbcdn.net&_nc_ohc=O5SMOnciwWMAX9RGSuX&edm=ABfd0MgBAAAA&ccb=7-4&oh=b0664e1b99defc92b07d969caccd5b48&oe=60F72D71&_nc_sid=7bff83",
    },
  ];

  final _posts = const [
    {
      "userName": "mario_jorge10",
      "userImage":
          "https://instagram.fmpm3-1.fna.fbcdn.net/v/t51.2885-19/11850247_1442915289372225_221634056_a.jpg?_nc_ht=instagram.fmpm3-1.fna.fbcdn.net&_nc_ohc=pUg8HPaKDOsAX9w-FiM&edm=ABfd0MgBAAAA&ccb=7-4&oh=7f6a3d5035c537ee9cfda157fe1550d9&oe=60F6AFC3&_nc_sid=7bff83",
      "verified": false,
      "location": null,
      "image":
          "https://instagram.fmpm3-1.fna.fbcdn.net/v/t51.2885-15/e35/24174790_138182263507797_600320743036682240_n.jpg?_nc_ht=instagram.fmpm3-1.fna.fbcdn.net&_nc_cat=109&_nc_ohc=Q7xfmbA8ckoAX-BIJWZ&edm=AP_V10EBAAAA&ccb=7-4&oh=2b033b26b168b549f6ee54e82fd06ad1&oe=60F6C3F2&_nc_sid=4f375e",
      "like": true,
      "likedBy": 63,
      "caption": "eu e tu💖",
      "commentsNr": 0,
      "comments": null,
      "createdAt": "November 29, 2017",
    },
    {
      "userName": "dmungoi",
      "userImage":
          "https://instagram.fmpm3-1.fna.fbcdn.net/v/t51.2885-19/s150x150/23969889_1550427701716072_161311734617866240_n.jpg?_nc_ht=instagram.fmpm3-1.fna.fbcdn.net&_nc_ohc=gej9JDEip6IAX-bjsPX&edm=AHG7ALcBAAAA&ccb=7-4&oh=3d20a6ee478a3a75f2488a43f38f5bb6&oe=60F6767F&_nc_sid=5cbaad",
      "verified": false,
      "location": null,
      "image":
          "https://instagram.fmpm3-1.fna.fbcdn.net/v/t51.2885-15/e35/s1080x1080/204527405_502771827444037_7650064774771230934_n.jpg?_nc_ht=instagram.fmpm3-1.fna.fbcdn.net&_nc_cat=101&_nc_ohc=LiNOFs1CAj0AX_u4SIL&edm=AP_V10EBAAAA&ccb=7-4&oh=3fb591eff36c66fc2540687fe591afa0&oe=60F782F2&_nc_sid=4f375e",
      "like": true,
      "likedBy": 365,
      "caption": "Welcome \"Vision\" ⚡️@teslamotros #teslamodely",
      "commentsNr": 27,
      "comments": [
        {
          "userName": "vanessamabunda",
          "comment": "What about Friday?",
          "like": false,
        },
        {
          "userName": "_jaymena",
          "comment": "🔥👌🏾",
          "like": false,
        },
      ],
      "createdAt": "June 23",
    },
    {
      "userName": "yabeda_",
      "userImage":
          "https://instagram.fmpm3-1.fna.fbcdn.net/v/t51.2885-19/s320x320/84318787_236943230644290_6801955086953086976_n.jpg?_nc_ht=instagram.fmpm3-1.fna.fbcdn.net&_nc_ohc=75b1cTKIW7oAX8YGCT5&tn=umCFbt2nIp768yJX&edm=ABfd0MgBAAAA&ccb=7-4&oh=b3089c54b022ad9e953fbde7d5a73482&oe=60F82547&_nc_sid=7bff83",
      "verified": false,
      "location": "10 De Novembro",
      "image":
          "https://instagram.fmpm3-1.fna.fbcdn.net/v/t51.2885-15/e35/47694240_391008521475625_1951971164686451623_n.jpg?_nc_ht=instagram.fmpm3-1.fna.fbcdn.net&_nc_cat=101&_nc_ohc=uH6cunDrX1YAX8WBECR&tn=umCFbt2nIp768yJX&edm=AP_V10EBAAAA&ccb=7-4&oh=27ed672ef36cdc0682b8b58b46d17774&oe=60F841EF&_nc_sid=4f375e",
      "like": false,
      "likedBy": 84,
      "caption": "Levitate.🍃",
      "commentsNr": 4,
      "comments": [
        {
          "userName": "yabeda_",
          "comment": "@ivan.shine 👊😘",
          "like": false,
        },
        {
          "userName": "yabeda_",
          "comment": "@willa.blonde kmk big.👊😂",
          "like": false,
        },
      ],
      "createdAt": "January 14, 2019",
    },
    {
      "userName": "izidinejaime",
      "userImage":
          "https://instagram.fmpm3-1.fna.fbcdn.net/v/t51.2885-19/s320x320/201097177_562525461419255_3250291884801597897_n.jpg?_nc_ht=instagram.fmpm3-1.fna.fbcdn.net&_nc_ohc=ppRk64M9ZosAX8-B8j1&edm=ABfd0MgBAAAA&ccb=7-4&oh=76133812c23f65c509644248f6ea1a30&oe=60F72F69&_nc_sid=7bff83",
      "verified": false,
      "location": null,
      "image":
          "https://instagram.fmpm3-1.fna.fbcdn.net/v/t51.2885-15/e35/205220673_406927840465268_1227665502382572728_n.jpg?_nc_ht=instagram.fmpm3-1.fna.fbcdn.net&_nc_cat=108&_nc_ohc=DuWqwPkn3rsAX-QFFc3&tn=umCFbt2nIp768yJX&edm=AP_V10EBAAAA&ccb=7-4&oh=96631f613c0c0350a6d7c6a776e6e23f&oe=60F816C1&_nc_sid=4f375e",
      "like": false,
      "likedBy": 0,
      "caption":
          "A sua mente é um dos maiores recursos que você tem. Empodera-a com conhecimento e exercite-a com bons hábitos e atrair coisas que pensamos e acreditamos.",
      "commentsNr": 14,
      "comments": [
        {
          "userName": "polanaassucena",
          "comment": "@izidinejaime yeah",
          "like": false,
        },
        {
          "userName": "izidinejaime",
          "comment": "@polanaassucena pois, mas não é impossível🙃",
          "like": false,
        },
      ],
      "createdAt": "June 22",
    },
    {
      "userName": "honey_zanil",
      "userImage":
          "https://instagram.fmpm3-1.fna.fbcdn.net/v/t51.2885-19/s320x320/106610315_620188372226987_5627791909807189986_n.jpg?_nc_ht=instagram.fmpm3-1.fna.fbcdn.net&_nc_ohc=QAu4Aiubd2MAX9ODzqd&edm=ABfd0MgBAAAA&ccb=7-4&oh=671a029432c1e60f2a0e6d91b9c5bbb5&oe=60F83ADC&_nc_sid=7bff83",
      "verified": false,
      "location": null,
      "image":
          "https://instagram.fmpm3-1.fna.fbcdn.net/v/t51.2885-15/e35/s1080x1080/200926569_985938695536819_2033001443315316681_n.jpg?_nc_ht=instagram.fmpm3-1.fna.fbcdn.net&_nc_cat=107&_nc_ohc=6xue3r7ixZ0AX9fh_EZ&edm=AP_V10EBAAAA&ccb=7-4&oh=11ac3fb62cc9d9dac7e97a1d22344f4f&oe=60F825F8&_nc_sid=4f375e",
      "like": true,
      "likedBy": 3637,
      "caption": "#m3 #bmw #mpower #mpackage",
      "commentsNr": 44,
      "comments": [
        {
          "userName": "the.green.skin",
          "comment": "❤️😢",
          "like": false,
        },
        {
          "userName": "pilatosmondlane094",
          "comment": "😍",
          "like": false,
        },
      ],
      "createdAt": "June 13",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/images/logo.png",
              width: 150.0,
            ),
            SvgPicture.asset(
              "assets/icons/messenger.svg",
              width: 30.0,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // Your story
                  Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              "https://instagram.fmpm3-1.fna.fbcdn.net/v/t51.2885-19/s150x150/103195199_191022658851018_3457611182433585699_n.jpg?_nc_ht=instagram.fmpm3-1.fna.fbcdn.net&_nc_ohc=3skCelW3llwAX9Ud55b&tn=umCFbt2nIp768yJX&edm=AIQHJ4wBAAAA&ccb=7-4&oh=02d00445145f9b14168fbd9ad4d049fa&oe=60F6CB50&_nc_sid=7b02f1",
                            ),
                            radius: 35.0,
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(100.0),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 4.0,
                                  )),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 20.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 17.0),
                      Text(
                        "Your Story",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  // Stories
                  ..._stories
                      .map((story) => Story(
                            name: story["userName"],
                            image: story["userImage"],
                          ))
                      .toList(),
                ],
              ),
            ),
            // Posts
            ..._posts
                .map(
                  (post) => Post(
                    userName: post["userName"],
                    location: post["location"],
                    userImage: post["userImage"],
                    image: post["image"],
                    liked: post["like"],
                    likesNr: post["likedBy"],
                    caption: post["caption"],
                    commentsNr: post["commentsNr"],
                    comments: post["comments"],
                    createdAt: post["createdAt"],
                  ),
                )
                .toList(),
          ],
        ),
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
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 80.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                _currentIndex = 0;
              });
            },
            child: SvgPicture.asset(
              _currentIndex == 0
                  ? "assets/icons/home.svg"
                  : "assets/icons/home_outlined.svg",
              width: 25.0,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _currentIndex = 1;
              });
            },
            child: SvgPicture.asset(
              _currentIndex == 1
                  ? "assets/icons/search_selected.svg"
                  : "assets/icons/search.svg",
              width: 25.0,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _currentIndex = 2;
              });
            },
            child: SvgPicture.asset(
              "assets/icons/new_post.svg",
              width: 25.0,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _currentIndex = 3;
              });
            },
            child: SvgPicture.asset(
              _currentIndex == 3
                  ? "assets/icons/activity.svg"
                  : "assets/icons/activity_outlined.svg",
              width: 25.0,
            ),
          ),
          CircleAvatar(
            radius: 20.0,
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(
              "https://instagram.fmpm3-1.fna.fbcdn.net/v/t51.2885-19/s150x150/103195199_191022658851018_3457611182433585699_n.jpg?_nc_ht=instagram.fmpm3-1.fna.fbcdn.net&_nc_ohc=3skCelW3llwAX9Ud55b&tn=umCFbt2nIp768yJX&edm=AIQHJ4wBAAAA&ccb=7-4&oh=02d00445145f9b14168fbd9ad4d049fa&oe=60F6CB50&_nc_sid=7b02f1",
            ),
          )
        ],
      ),
    );
  }
}

class Post extends StatelessWidget {
  const Post({
    Key? key,
    this.userName,
    this.userImage,
    this.location,
    this.image,
    this.caption,
    this.liked,
    this.likesNr,
    this.commentsNr,
    this.comments,
    this.createdAt,
  }) : super(key: key);

  final userName;
  final userImage;
  final image;
  final location;
  final caption;
  final liked;
  final likesNr;
  final commentsNr;
  final comments;
  final createdAt;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // header post
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(userImage),
                  ),
                  const SizedBox(width: 10.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName!,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      ),
                      if (location != null)
                        Text(
                          location!,
                          style: TextStyle(color: Colors.white, fontSize: 12.0),
                        ),
                    ],
                  ),
                ],
              ),
              Icon(
                Icons.more_horiz,
                color: Theme.of(context).iconTheme.color,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        // image
        Image.network(image),
        const SizedBox(height: 10.0),
        // like, comment, share
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  SvgPicture.asset(
                    liked!
                        ? "assets/icons/like.svg"
                        : "assets/icons/like_outlined.svg",
                    width: 30.0,
                  ),
                  const SizedBox(width: 20.0),
                  SvgPicture.asset(
                    "assets/icons/comment.svg",
                    width: 30.0,
                  ),
                  const SizedBox(width: 20.0),
                  SvgPicture.asset(
                    "assets/icons/share_post.svg",
                    width: 30.0,
                  ),
                ],
              ),
              SvgPicture.asset(
                "assets/icons/save_post_outlined.svg",
                width: 30.0,
              ),
            ],
          ),
        ),
        // Likes
        const SizedBox(height: 10.0),
        // Caption
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: userName!,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                  children: [
                    TextSpan(
                      text: "  ${caption!}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        // Comments
        Text(
          "View all $commentsNr comments",
          style: Theme.of(context).textTheme.caption!.copyWith(
                fontSize: 16.0,
              ),
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}

class Story extends StatelessWidget {
  const Story({
    Key? key,
    this.name,
    this.image,
  }) : super(key: key);

  final String? name;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(237, 160, 92, 1.0),
                  Color.fromRGBO(181, 62, 142, 1.0),
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: CircleAvatar(
                radius: 35.0,
                backgroundImage: NetworkImage(
                  image!,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5.0),
          LimitedBox(
            maxWidth: 100.0,
            child: Text(
              name!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
