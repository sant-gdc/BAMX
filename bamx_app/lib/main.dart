import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BAMX',
      theme: ThemeData(
          errorColor: Colors.red,
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
                  fontSize: 17)),
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
    Text('Eventos'),
    Text('Programas'),
    Text('Calendario'),
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
