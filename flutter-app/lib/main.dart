import 'dart:io';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:weshareapp/feedpage.dart';
import 'package:weshareapp/formpage.dart';
import 'package:weshareapp/profile.dart';
import 'uploadpage.dart';
import 'provider.dart';
import 'package:location/location.dart';
import 'package:path_provider/path_provider.dart';
void main() {
  runApp(    MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Counter()),
    ],
    child: const MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fluttesdfrasdf Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter Page'),
    home: MyStatefulWidget()
      // home: Profile(),
    // home: FormPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final ImagePicker _picker = ImagePicker();

  File? _imageofjunk;
Future getImage() async{
  final image =await ImagePicker().pickImage(source: ImageSource.camera);
  if(image ==null) return ;
  final imageTemp=File(image.path);
  setState(() {
    this._imageofjunk=imageTemp;
  });
}
  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
         _imageofjunk!=null ? Image.file(_imageofjunk!,
         height: 300,
         width: 300,
         fit: BoxFit.cover,): Text("no photo to show"),

          ],

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:getImage,
        tooltip: 'press here to send the camera data ',
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
