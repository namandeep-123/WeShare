import 'dart:io';
import 'package:flutter/material.dart';

class CardFeed extends StatelessWidget {
 CardFeed({this.Description,this.imageofjunk});
  String? Description;
  File ? imageofjunk;


  @override
  Widget build(BuildContext context) {
    return  Container(
              margin: EdgeInsets.all(20),
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
                    child: Text(
                      '${Description}',style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 30
                    ),
                    )
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  imageofjunk != null
                      ? Image.file(
                          imageofjunk!,
                          height: 300,
                          width: 300,
                          fit: BoxFit.cover,
                        )
                      : Text(""),

                  Column(
                          children: [

                            Text(""),
                            SizedBox(
                              height: 20,
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.location_on,
                                color: Colors.green,
                              ),
                              title: Text('Faridabad Manav Rachna College'),
                            ),
                            SizedBox(height: 20,)
                          ],
                        ),
                ],
              ),
            );
  }
}