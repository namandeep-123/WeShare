import 'package:flutter/material.dart';
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => PprofileState();
}

class PprofileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 30,),
          ListTile(leading: Icon(Icons.notifications_active_outlined),),
          SizedBox(height: 30,),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black12)
            ),
            child: ListTile(
              subtitle: Text("USA-Washington",style: TextStyle(color: Colors.grey),),
              title: Text("Nick ",style: TextStyle(fontWeight: FontWeight.bold),),
              trailing: CircleAvatar(),
            ),
          ),
          SizedBox(height: 30,),
Center(child: Container(
  // height: 90,
  width: MediaQuery.of(context).size.width * 0.8,
  decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
color: Colors.blue

  ),
  margin: EdgeInsets.all(10),
  padding: EdgeInsets.all(20),
  child: Text("Total Points: 659",style: TextStyle(fontSize: 30,color: Colors.white),),
)),
          SizedBox(height: 30,),

            Container(margin: EdgeInsets.all(30),

            ),


        ]),
      ),
    );
  }
}