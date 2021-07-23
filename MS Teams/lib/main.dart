import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:microsoft_teams/dummy_data.dart';

void main() {
  runApp(MyApp());
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MS Teams',
      themeMode: ThemeMode.dark,
      darkTheme: Theme.of(context).copyWith(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.dark(),
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
          backgroundColor: Color.fromRGBO(27, 26, 24, 1.0),
        ),
        iconTheme: IconThemeData(
          color: Color.fromRGBO(119, 119, 120, 1.0),
        ),
        textTheme: TextTheme(
          caption: TextStyle(
            color: Color.fromRGBO(119, 119, 120, 1.0),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Color.fromRGBO(242, 242, 242, 1.0),
          backgroundColor: Color.fromRGBO(27, 26, 24, 1.0),
          unselectedItemColor: Color.fromRGBO(119, 119, 120, 1.0),
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
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
        toolbarHeight: 120.0,
        elevation: 1.0,
        title: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: AssetImage('assets/images/profile.jpeg'),
                    ),
                    const SizedBox(width: 10.0),
                    Text(
                      'Teams',
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 37.0,
                    ),
                    SvgPicture.asset(
                      'assets/icons/settings.svg',
                      color: Colors.white,
                      width: 45.0,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5.0),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: Theme.of(context).textTheme.caption!.color,
                  fontSize: 18.0,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).textTheme.caption!.color,
                ),
                contentPadding: const EdgeInsets.all(0.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                filled: true,
                fillColor: Color.fromRGBO(48, 48, 48, 1.0),
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: DUMMY_TEAMS.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    color: HexColor.fromHex('${DUMMY_TEAMS[index]['color']}'),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  width: 50.0,
                  height: 50.0,
                  child: Center(
                    child: Text(
                      '${DUMMY_TEAMS[index]['abbreviation']}',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
                title: Text('${DUMMY_TEAMS[index]['team']}'),
                trailing: Icon(
                  Icons.more_horiz,
                  color: Theme.of(context).textTheme.caption!.color,
                ),
              ),
              Divider(
                color: Theme.of(context).textTheme.caption!.color,
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int index = 2;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 12.0,
      unselectedFontSize: 12.0,
      currentIndex: index,
      onTap: (i) {
        setState(() {
          index = i;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/activity_outlined.svg',
            color: Theme.of(context).iconTheme.color,
            width: 45.0,
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/activity.svg',
            color: Colors.white,
            width: 45.0,
          ),
          label: 'Activity',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/chat_outlined.svg',
            color: Theme.of(context).iconTheme.color,
            width: 45.0,
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/chat.svg',
            color: Colors.white,
            width: 45.0,
          ),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/teams_outlined.svg',
            color: Theme.of(context).iconTheme.color,
            width: 45.0,
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/teams.svg',
            color: Colors.white,
            width: 45.0,
          ),
          label: 'Teams',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/assignments_outlined.svg',
            color: Theme.of(context).iconTheme.color,
            width: 45.0,
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/assignments.svg',
            color: Colors.white,
            width: 45.0,
          ),
          label: 'Assignments',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/calendar_outlined.svg',
            color: Theme.of(context).iconTheme.color,
            width: 45.0,
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/calendar.svg',
            color: Colors.white,
            width: 45.0,
          ),
          label: 'Calendar',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/more.svg',
            color: Theme.of(context).iconTheme.color,
            width: 45.0,
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/more.svg',
            color: Colors.white,
            width: 45.0,
          ),
          label: 'More',
        ),
      ],
    );
  }
}
