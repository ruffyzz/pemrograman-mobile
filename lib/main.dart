import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RafiApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // List of pages for each menu item
  final List<Widget> _pages = [
    Center(child: Text("Home Page", style: TextStyle(fontSize: 24))),
    Center(child: Text("About Page", style: TextStyle(fontSize: 24))),
    Center(child: Text("Biodata Page\nName: Rafi\nAge: 20\nNRP: 220414014", style: TextStyle(fontSize: 24))),
    Center(child: Text("Contact Me\nEmail: rafi@gmail.com\nPhone: 123-456-789", style: TextStyle(fontSize: 24))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RafiApp"),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Tambahkan aksi untuk ikon di toolbar
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'RafiApp',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(0);
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(1);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Biodata'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(2);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Contact Me'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(3);
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          _onItemTapped(index);
        },
        selectedItemColor: Colors.blue, // Set color for selected item
        unselectedItemColor: Colors.grey, // Set color for unselected items
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Biodata',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail, color: Colors.blue), // Blue color for Contact icon
            label: 'Contact',
          ),
        ],
      ),
    );
  }
}
