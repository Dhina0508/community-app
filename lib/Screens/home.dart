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
      appBar: AppBar(
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
        backgroundColor: Colors.teal,
        title: Text(
          "EcYc",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Text('This is home Screen',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              Text(
                'Contents',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              ListTile(
                title: Text(
                  'home',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
                onTap: () => [],
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
                      'Blood',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    ),
                  ],
                ),
                onTap: () => [Navigator.of(context).pushNamed('blood')],
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
                      'Medicals',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    ),
                  ],
                ),
                onTap: () => [Navigator.of(context).pushNamed('medical')],
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    ),
                  ],
                ),
                onTap: () => [Navigator.of(context).pushNamed('education')],
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
                      'food',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    ),
                  ],
                ),
                onTap: () => [Navigator.of(context).pushNamed('food')],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
