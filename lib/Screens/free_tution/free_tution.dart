// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecyc/Screens/education/educationprof.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';


// class Free_tution extends StatefulWidget {
//   const Free_tution({Key? key}) : super(key: key);

//   @override
//   State<Free_tution> createState() => _profileState();
// }

// class _profileState extends State<Free_tution> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Free Tution List'),
//         actions: [
//           IconButton(
//               onPressed: () =>
//                   [Navigator.of(context).pushNamed('free_tution_reg')],
//               icon: Icon(Icons.add))
//         ],
//         backgroundColor: Colors.red,
//       ),
//       body: Stack(children: [
//         Center(
//             child: Image.asset(
//           'images/book.png',
//           color: Colors.white.withOpacity(0.2),
//           colorBlendMode: BlendMode.modulate,
//         )),
//         SafeArea(
//           child: StreamBuilder<QuerySnapshot>(
//               stream: FirebaseFirestore.instance
//                   .collection("Common_Db")
//                   .orderBy('Time')
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//                 return ListView.builder(
//                     itemCount: snapshot.data!.docs.length,
//                     itemBuilder: (context, i) {
//                       QueryDocumentSnapshot x = snapshot.data!.docs[i];

//                       if (x['about'] == "free_tution") {
//                         return Card(
//                           elevation: 5,
//                           child: ListTile(
//                             leading: Icon(
//                               Icons.school_rounded,
//                               size: 35,
//                               color: Colors.red,
//                             ),
//                             title: Text(
//                               "Topic Name : " + x['Name'],
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold, fontSize: 20),
//                             ),
//                             subtitle: Text("Ph.No: " + x['PhoneNumber']),
//                             onTap: () => [
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => free_tution_prof(
//                                           value: snapshot.data!.docs[i])))
//                             ],
//                           ),
//                         );
//                       } else {
//                         return Container();
//                       }
//                     });
//               }),
//         )
//       ]),
//     );
//   }
// }
