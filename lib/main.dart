import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/instance_manager.dart';
import 'package:tutor1/controller/controller.dart';
import 'package:tutor1/controller/controller_bindings.dart';
import 'package:tutor1/repo/firebase_options.dart';
import 'package:tutor1/ui/scan_rfid_page/scan_rfid.dart';


 void main() async {
   WidgetsFlutterBinding.ensureInitialized();

   AwesomeNotifications().initialize(null, [
     NotificationChannel(
       channelKey: 'test_channel',
       channelName: 'Test Notification',
       channelDescription: 'Notficiations for basic testing',
     )
   ]);


   runApp(GetMaterialApp(
     initialBinding: ControllerBindings(),
      debugShowCheckedModeBanner: false,
      home: Firstapp(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: const Color(0xFF283593),
    ),
   ),
 ));
 }

 class Firstapp extends StatefulWidget {
   const Firstapp({Key? key}) : super(key: key);

   @override
   State<Firstapp> createState() => _FirstappState();
 }

 class _FirstappState extends State<Firstapp> {
   TextEditingController nama = TextEditingController();
   TextEditingController password = TextEditingController();
   final _controller = Get.find<Controller>();

   final _formKey = GlobalKey<FormState>();

   final _emailTextController = TextEditingController();
   final _passwordTextController = TextEditingController();
   // FirebaseMessaging messaging = FirebaseMessaging.instance;

   final _focusEmail = FocusNode();
   final _focusPassword = FocusNode();

   bool _isProcessing = false;
   @override
   void initState()  {_initializeFirebase();
     FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance; // Change here
     _firebaseMessaging.getToken().then((token){
       print("token is $token");
     });
   }
   Future<FirebaseApp> _initializeFirebase() async {
     FirebaseApp firebaseApp = await Firebase.initializeApp(
       options: DefaultFirebaseOptions.currentPlatform,
     );

     User? user = FirebaseAuth.instance.currentUser;

     if (user != null) {
       // Navigator.of(context).pushReplacement(
       //     MaterialPageRoute(
       //         builder: (context) =>
       //             Home(
       //                 name: user.toString()
       //             )
       //     )
       // );
     }
     return firebaseApp;
   }

   @override
// void initState() {
//     // TODO: implement initState
//      setState(() {
//        nama;
//        password;
//      });
//     super.initState();
   Widget build(BuildContext context) {
     return GestureDetector(
       onTap: () {
         _focusEmail.unfocus();
         _focusPassword.unfocus();
       },
       child: Scaffold(
         // appBar: AppBar(
         // title: Text('Firebase Authentication'),
         // ),
         body: FutureBuilder(
           future: _initializeFirebase(),
           builder: (context, snapshot) {
             if (snapshot.connectionState == ConnectionState.done) {
               return Padding(
                 padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     // ElevatedButton(
                     //   onPressed: () => _controller.sendNotification(),
                     //   child: const Text('Send Notification'),
                     // ),
                     Center(
                       child: ElevatedButton(onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>scan_rfid()));}, child: Text("Open RFID")),
                     )
                   ],
                 ),
               );
             }

             return Center(
               child: CircularProgressIndicator(),
             );
           },
         ),
       ),
     );
   }
 }