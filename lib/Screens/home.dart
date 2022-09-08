import 'package:ecyc/firebase_helper/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Service service = Service();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () async {
                service.signOut(context);
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.remove("email");
              },
              icon: Icon(Icons.logout))
        ],
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Container(
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [
              Color.fromARGB(221, 241, 32, 32),
              Color.fromARGB(234, 219, 33, 219),
              Color.fromARGB(210, 52, 18, 175),
              Color.fromARGB(210, 52, 18, 175),
            ], begin: Alignment.topRight, end: Alignment.bottomLeft),
          ),
          child: Text(
            'ECYC',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Cinzel',
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ),
        ),
      ),
      body: Ink(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 236, 5, 5),
            Color.fromARGB(234, 216, 114, 216),
            Color.fromARGB(236, 91, 19, 159),
            Color.fromARGB(235, 51, 11, 120),
          ], begin: Alignment.topRight, end: Alignment.bottomLeft),
        ),
        child: Center(
          child: Text('This is home Screen',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        ),
      ),
      drawer: Drawer(
        child: Ink(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 221, 117, 117),
              Color.fromARGB(234, 209, 125, 209),
              Color.fromARGB(235, 125, 73, 174),
              Color.fromARGB(235, 78, 57, 113),
            ], begin: Alignment.topRight, end: Alignment.bottomLeft),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Text(
                  'Contents',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
                SizedBox(
                  height: 40,
                ),
                ListTile(
                  title: Row(
                    children: [
                      Icon(
                        Icons.home,
                        color: Colors.brown,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ],
                  ),
                  onTap: () => [
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()))
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  title: Row(
                    children: [
                      Icon(
                        Icons.bloodtype_rounded,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Blood Donation',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ],
                  ),
                  onTap: () => [Navigator.of(context).pushNamed('blood')],
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  title: Row(
                    children: [
                      Icon(
                        Icons.local_hospital_rounded,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Health ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ],
                  ),
                  onTap: () => [Navigator.of(context).pushNamed('medical')],
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  title: Row(
                    children: [
                      Icon(
                        Icons.menu_book_rounded,
                        color: Colors.brown,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Education',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ],
                  ),
                  onTap: () => [Navigator.of(context).pushNamed('education')],
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  title: Row(
                    children: [
                      Icon(
                        Icons.food_bank_rounded,
                        color: Colors.amber,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Food',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ],
                  ),
                  onTap: () => [Navigator.of(context).pushNamed('food')],
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  title: Row(
                    children: [
                      Icon(
                        Icons.settings,
                        color: Colors.brown,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'My Profile',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ],
                  ),
                  onTap: () => [],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
