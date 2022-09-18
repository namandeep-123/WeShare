// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weshareapp/feedpage.dart';
import 'package:weshareapp/formpage.dart';
import 'provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  @override
  void initState() {
    // TODO: implement initState
getlocation();
    super.initState();
  }
  Position ?currentpostition;
  void getlocation()async{
    currentpostition= await _determinePosition();
    setState(() {

      print(currentpostition);
      print("new");

    });
  }
Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
       return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 

  return await Geolocator.getCurrentPosition();
}

  int _selectedIndex1 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),

            Container(
              
            child: Text("Earn with us",style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600
            ),),
          ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.all(10),
              child: Text("Save the earth planet with your mobile and earn with us",style: TextStyle(
                  fontSize: 16,
                          ),),
            ),
            SizedBox(height: 40),
            Container(
            margin: EdgeInsets.only(left: 10,right: 10),
            child: Image.asset('assets/images/image1.png'),
          ),
            SizedBox(height: 30),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FeedPage()),
                );
              },
              child: Container(
              child: Center(child: Text('Feed Page',style: TextStyle(
                fontSize: 16
              ),)),
              height: 80,
              width: MediaQuery. of(context). size. width*0.8,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.green,
                    width: 2,
                  )
          ),
          ),
            ),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FormPage()),
                );
              },
              child: Container(
                child: Center(child: Text("Upload From Camera",style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),)),
                height: 80,
                width: MediaQuery. of(context). size. width*0.8,

                decoration: BoxDecoration(
                  color: Colors.green,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Colors.green,
                      width: 2,
                    )
                ),
              ),
            ),

          ],
        ),
      ),
    ),
    );
  }
}
