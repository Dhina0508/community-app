import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecyc/Screens/missing_person/missing.dart';
import 'package:ecyc/firebase_helper/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'blood/bloodprofile.dart';

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
      backgroundColor: Color.fromARGB(255, 184, 145, 192),
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
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ))
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
      body: Stack(
        children: [
          Image.asset(
            'images/hand1.png',
            color: Colors.white.withOpacity(0.7),
            colorBlendMode: BlendMode.modulate,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("Common_Db")
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, i) {
                      QueryDocumentSnapshot x = snapshot.data!.docs[i];
                      return Card(
                        elevation: 5,
                        child: ListTile(
                            trailing: Text("Needs: " + x['Value3']),
                            leading: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.back_hand_rounded,
                                  size: 45,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                            title: Text(
                              "Name: " + x['Value1'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            subtitle: Text("Ph.No: " + x['Value2']),
                            onTap: () => []),
                      );
                    });
              }),
        ],
      ),
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: GestureDetector(
              child: Text(
                'My Profile',
                style: TextStyle(fontSize: 25),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('profile');
              },
            ),
            accountEmail: Text(''),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('images/profile.png'),
            ),
          ),
          ListTile(
            title: Text('Home'),
            leading: Icon(
              Icons.home,
              color: Colors.brown,
            ),
            onTap: () => [Navigator.of(context).pop()],
          ),
          ListTile(
            title: Text('Blood Donation'),
            leading: Icon(
              Icons.bloodtype,
              color: Colors.red,
            ),
            onTap: () => [Navigator.of(context).pushNamed('blood')],
          ),
          ListTile(
            title: Text('Health'),
            leading: Icon(
              Icons.local_hospital,
              color: Colors.red,
            ),
            onTap: () => [Navigator.of(context).pushNamed('medical')],
          ),
          ListTile(
            title: Text('Education'),
            leading: Icon(
              Icons.menu_book,
              color: Colors.black,
            ),
            onTap: () => [Navigator.of(context).pushNamed('education')],
          ),
          ListTile(
            title: Text('Food'),
            leading: Icon(
              Icons.food_bank,
              color: Colors.amber,
            ),
            onTap: () => [Navigator.of(context).pushNamed('food')],
          ),
          ListTile(
            title: Text('Clothes'),
            leading: Image.asset(
              'images/tshirt.png',
              height: 25,
              width: 25,
            ),
            onTap: () => [Navigator.of(context).pushNamed('clothes')],
          ),
          ListTile(
            title: Text('Missing Person'),
            leading: Icon(
              Icons.person,
              color: Colors.brown,
            ),
            onTap: () => [
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Missing()))
            ],
          ),
          Divider(
            height: 18,
            color: Colors.black45,
          ),
          ListTile(
            title: Text('Invite Friends'),
            leading: Icon(Icons.person_add),
            onTap: () => [],
          ),
          ListTile(
            title: Text('Ecyc Features'),
            leading: Icon(Icons.help_outline_sharp),
            onTap: () => [],
          ),
        ],
      )),
    );
  }
}
