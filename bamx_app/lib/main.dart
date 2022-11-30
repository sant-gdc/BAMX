// ignore_for_file: prefer_const_constructors, duplicate_ignore, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:bamx_app/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import './widgets/AuthenticationWidgets/login_module.dart';
import './widgets/ProgramWidgets/programs_screen.dart';
import './widgets/EventsWidgets/events_screen.dart';
import './widgets/CalendarWidgets/calendar_screen.dart';
import 'package:flutter/material.dart';
import './widgets/ProfileWidgets/buildPPbubble.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';
import 'package:firebase_database/firebase_database.dart';
import 'globals.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();
final messengerKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        SfGlobalLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('es'),
      ],
      locale: const Locale('es'),
      scaffoldMessengerKey: messengerKey,
      navigatorKey: navigatorKey,
      title: 'BAMX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          errorColor: Colors.red,
          // ignore: prefer_const_constructors
          appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          fontFamily: 'Inter',
          textTheme: TextTheme(
            titleMedium: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
            bodyMedium: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.red,
          ).copyWith(
            secondary: Colors.grey,
          )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Hubo un error'));
          } else if (snapshot.hasData) {
            return MenuPage();
          } else {
            return LogInModule();
          }
        },
      ),
    );
  }
}

class MenuPage extends StatefulWidget {
  const MenuPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _selectedIndex = 0;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => getAdminStatus());
    super.initState();
  }

  Future getAdminStatus() async {
    DatabaseReference userReference = FirebaseDatabase.instance
        .ref('Users/${FirebaseAuth.instance.currentUser!.uid}');
    DatabaseEvent event = await userReference.once();
    Map userInfo = event.snapshot.value as Map;
    if (userInfo.values.first['user'] == 'A') {
      setState(() {
        isAdmin = true;
      });
    } else {
      setState(() {
        isAdmin = false;
      });
    }
  }

  void _onViewTappedIcon(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = [
      EventScreen(isAdmin),
      ProgramsScreen(admin: isAdmin),
      Calendar_Screen(),
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/images/bamx_logo.png',
          fit: BoxFit.cover,
          height: 50,
        ),
        leading: Container(
            padding: EdgeInsets.only(left: 20, top: 5),
            child: buildPPbubble(context, false)),
        actions: [
          GestureDetector(
            child: Container(
                padding: EdgeInsets.only(right: 20, top: 5),
                child: Icon(Icons.logout)),
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          const BottomNavigationBarItem(
              icon: Icon(Icons.collections_bookmark_outlined),
              label: 'Programas'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: 'Calendario'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onViewTappedIcon,
      ),
    );
  }
}
