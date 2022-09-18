import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weshareapp/Cards.dart';
import 'provider.dart';
class FeedPage extends StatefulWidget {

  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  @override
  Widget build(BuildContext context) {
    final List items=context.watch<Counter>().cart;

    List newitem = context.watch<Counter>().cart;
    return Scaffold(
      backgroundColor: Colors.green[200],
    appBar: AppBar(centerTitle: true,
      backgroundColor: Colors.green,
      title: Text("Feed "),
    ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context,ind){
        return items[ind];
      }),
    );
  }
}
