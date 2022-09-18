import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:weshareapp/Cards.dart';
import 'dart:io';
import 'package:weshareapp/feedpage.dart';
import 'provider.dart';
import 'package:geolocator/geolocator.dart';
class FormPage extends StatefulWidget {
  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  int _counter = 0;
  final ImagePicker _picker = ImagePicker();
  final myController = TextEditingController();
  File? _imageofjunk;
  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    final imageTemp = File(image.path);
    setState(() {
      this._imageofjunk = imageTemp;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  bool isChecked = true;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  //Location

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



  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Scaffold(
      backgroundColor: Colors.green[100],
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.black,
                      ),
                      title: Text("Account"),
                      subtitle: Text("A user protecting earth ")),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: myController,
                      minLines: 5,
                      maxLines: 8,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: OutlineInputBorder(),
                        hintText: 'Description',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _imageofjunk != null
                      ? Image.file(
                          _imageofjunk!,
                          height: 300,
                          width: 300,
                          fit: BoxFit.cover,
                        )
                      :
                      GestureDetector(
                        child: GestureDetector(
                          onTap: getImage,
                          child: Column(
                            children: [
                              Icon(Icons.camera_alt),
                              Text("No Photo Selected"),
                            ],
                          ),
                        ),
                      )

                  ,Column(
                          children: [

                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap:() async {
                                await _determinePosition;
                              } ,
                              child: ListTile(
                                leading: Icon(
                                  Icons.location_on,
                                  color: Colors.green,
                                ),
                                title: Text('Faridabad Manav Rachna College'),
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                print(myController.text);

                context.read<Counter>().increment(CardFeed(Description: myController.text,imageofjunk: _imageofjunk,));
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FeedPage()),
              );
                },
              child: Container(
                child: Center(
                    child: Text(
                  "Upload and Save",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
                height: 80,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Colors.green,
                      width: 2,
                    )),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      )
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             SizedBox(height: 20.0,),
//             _imageofjunk!=null ? Image.file(_imageofjunk!,
//               height: 300,
//               width: 300,
//               fit: BoxFit.cover,): Text("no photo to show"),
//             SizedBox(height: 10,),
// // add account name and
//
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//              child:  ListTile(
//                leading:Icon(Icons.location_on,color: Colors.green,),
//                title: Text('Faridabad Manav Rachna College'),
//
//              ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//               child: TextField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'Description',
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//               child:  ListTile(
//                 leading:Checkbox(
//                   checkColor: Colors.white,
//                   fillColor: MaterialStateProperty.resolveWith(getColor),
//                   value: isChecked,
//                   onChanged: (bool? value) {
//                     setState(() {
//                       isChecked = value!;
//                       if(isChecked) print("hi");
//                     });
//                   },
//                 ),
//                 title: Text('Post it also'),
//
//               ),
//             ),
//
//           ],
//
//         ),
          ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: getImage,
        tooltip: 'press here to send the camera data ',
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
