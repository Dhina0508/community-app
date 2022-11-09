import 'package:ecyc/Screens/MyProfile.dart';
import 'package:ecyc/Screens/blood/blood.dart';
import 'package:ecyc/Screens/blood/bloodreg.dart';
import 'package:ecyc/Screens/books/books.dart';
import 'package:ecyc/Screens/books/books_Reg.dart';
import 'package:ecyc/Screens/bottomnavigationbar.dart';
import 'package:ecyc/Screens/chat/Chat_Lobby.dart';
import 'package:ecyc/Screens/clothes/clothes.dart';
import 'package:ecyc/Screens/clothes/clothesreg.dart';
import 'package:ecyc/Screens/education/education.dart';
import 'package:ecyc/Screens/education/educationreq.dart';
import 'package:ecyc/Screens/food/food.dart';
import 'package:ecyc/Screens/food/foodreg.dart';
import 'package:ecyc/Screens/get%20started%20screen/blood%20donation.dart';
import 'package:ecyc/Screens/home.dart';
import 'package:ecyc/Screens/medical/medical.dart';
import 'package:ecyc/Screens/medical/medicalreg.dart';
import 'package:ecyc/Screens/scribers/scribers.dart';
import 'package:ecyc/Screens/scribers/scribers_reg.dart';
import 'package:ecyc/Screens/sos.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:ecyc/login_and_register/forget_password/get_email.dart';
import 'package:ecyc/login_and_register/loginpage.dart';
import 'package:ecyc/login_and_register/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'login_and_register/updateUser.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.subscribeToTopic("work");
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
        defaultColor: Colors.amber,
        channelKey: 'key1',
        channelName: 'ecyc',
        channelDescription: 'demo')
  ]);
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  print('User granted permission: ${settings.authorizationStatus}');
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });

  SharedPreferences pref = await SharedPreferences.getInstance();
  var email = pref.getString('email');
  runApp(GetMaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    debugShowCheckedModeBanner: false,
    home: email == null ? MyHomePage() : BottomNavigatorBar(),
    routes: {
      'blood': (context) => blood(),
      'medical': (context) => medical(),
      'education': (context) => education(),
      'food': (context) => food(),
      'clothes': (context) => clothes(),
      'bloodreg': (context) => bloodreg(),
      'medicalreg': (context) => medicalreg(),
      'educationreg': (context) => educationreg(),
      'clothesreg': (context) => clothesreg(),
      'foodreg': (context) => foodreg(),
      'register': (context) => register(),
      'login': (context) => MyHomePage(),
      'login_page': (context) => LoginPage(),
      'profile': (context) => MyProfile(),
      'chatlobby': (context) => Lobby(),

      // 'update': (context) => update(),
      'home': (context) => Home(),
      'scribers': (context) => scribers(),
      'scribersreg': (context) => scribersreg(),
      'sos': (context) => sos(),
      'books': (context) => books(),
      'booksreg': (context) => booksreg(),
      // 'free_tutionreg': (context) => free_tution_reg(),
      'getEmail': (context) => GetEmail(),
      'BottomNavigatorBar': (context) => BottomNavigatorBar(),
    },
  ));
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => BloodStartScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              'ECYC',
              style: TextStyle(
                  fontFamily: 'Cinzel',
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "First People Community App",
            style: TextStyle(
                fontSize: 25,
                color: Color.fromARGB(255, 199, 191, 191),
                fontFamily: 'JosefinSans'),
          ),
          SizedBox(
            height: 60,
          ),
          CircularProgressIndicator(
            color: Colors.white,
          )
        ],
      ),
    ));
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.

  print("Handling a background message: ${message.data}");
  AwesomeNotifications().createNotificationFromJsonData(message.data);
}
