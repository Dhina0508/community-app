import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecyc/Screens/bottomnavigationbar.dart';
import 'package:ecyc/Screens/clothes/clothesprof.dart';
import 'package:ecyc/Screens/home.dart';
import 'package:flutter/material.dart';

class clothes extends StatefulWidget {
  const clothes({Key? key}) : super(key: key);

  @override
  State<clothes> createState() => _profileState();
}

class _profileState extends State<clothes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BottomNavigatorBar()));
            },
            icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.blueAccent,
        title: Text('Clothes Donated List'),
      ),
      body: Stack(children: [
        Center(
            child: Image.asset(
          'images/cloth.png',
          color: Colors.white.withOpacity(0.3),
          colorBlendMode: BlendMode.modulate,
        )),
        StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("Common_Db")
                .orderBy('Time')
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, i) {
                    QueryDocumentSnapshot x = snapshot.data!.docs[i];

                    if (x['about'] == "cloth") {
                      return Card(
                        elevation: 5,
                        child: ListTile(
                          leading: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'images/tshirt.png',
                                width: 25,
                                height: 25,
                              ),
                            ],
                          ),
                          title: Text(
                            "Name: " + x["Your_name"],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          subtitle: Text("Ph.No: " + x['PhoneNumber']),
                          onTap: () => [
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => clothesprof(
                                        value: snapshot.data!.docs[i])))
                          ],
                        ),
                      );
                    } else {
                      return Container();
                    }
                  });
            }),
      ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          Navigator.of(context).pushNamed('clothesreg');
        },
      ),
    );
  }
}
