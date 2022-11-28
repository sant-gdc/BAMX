// ignore_for_file: prefer_const_constructors, duplicate_ignore, sort_child_properties_last, prefer_const_literals_to_create_immutables

import './widgets/ProgramWidgets/programs_screen.dart';
import './widgets/EventsWidgets/events_screen.dart';
import './widgets/CalendarWidgets/calendar_screen.dart';
import 'package:flutter/material.dart';
import './widgets/ProfileWidgets/buildPPbubble.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';

void main() {
  runApp(const MyApp());
}

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
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    EventScreen(true),
    ProgramsScreen(admin: true),
    Calendar_Screen(),
  ];

  void _onViewTappedIcon(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Container(
            padding: EdgeInsets.only(left: 20, top: 5),
            child: buildPPbubble(context)),
        title: Text(
          'BAMX',
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
              icon: Icon(Icons.collections_bookmark_outlined),
              label: 'Programs'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: 'Calendar'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onViewTappedIcon,
      ),
    );
  }
}
