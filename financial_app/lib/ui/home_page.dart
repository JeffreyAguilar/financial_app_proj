import 'package:financial_app/ui/acc_info.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.account_circle_sharp,
              color: Colors.white,
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const AccInfo(title: 'Account Info');
              }));
            },
          )
        ],
      ),
      body: const WidgetColumn()
    );
  }
}

// ignore: slash_for_doc_comments
/// WidgetColumn class will display the widgets that
/// will navigate the user to the different finance graphs
class WidgetColumn extends StatefulWidget {
  const WidgetColumn({super.key});

  @override
  State<WidgetColumn> createState() => _WidgetColumnState();
}

class _WidgetColumnState extends State<WidgetColumn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text('Widget 1'),
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text('Widget 2'),
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text('Widget 3'),
            ]
          )
        ],
      ),
    );
  }
}
