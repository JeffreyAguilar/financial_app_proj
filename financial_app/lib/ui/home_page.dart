import 'package:financial_app/ui/child_signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:financial_app/ui/account_page.dart';
import 'package:financial_app/ui/manage_child.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'main_page.dart';
import 'package:financial_app/global.dart' as globals;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> children = [];
  late String firstName;
  late String id;
  late String lastName;
  final _firstNameController = TextEditingController();

  Future setInfo() async {
    DocumentSnapshot data = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();
    firstName = data.get('first name');
    lastName = data.get('last name');
    id = FirebaseAuth.instance.currentUser!.uid;
    children = List.from(data['children']);
    debugPrint('i am working');
  }

  Future refreshPage() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const HomePage();
    }));
  }

  Future addChild(
    String childid,
  ) async {
    debugPrint('i am ' + childid);
    await FirebaseFirestore.instance.collection('users').doc(id).update({
      'children': FieldValue.arrayUnion([childid])
    });
  }

  Future removeChild(
    String childid,
  ) async {
    debugPrint('i am ' + childid);
    await FirebaseFirestore.instance.collection('users').doc(id).update({
      'children': FieldValue.arrayRemove([childid])
    });
  }

  @override
  Widget build(BuildContext context) {
    setInfo();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 3, 166, 8),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.account_circle_sharp,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const MainPage();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Sign Out'),
              ),
              IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onPressed: () {},
              )
            ],
          )),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 3, 166, 8),
              Color.fromARGB(255, 94, 238, 168),
            ],
          ),
        ),
        child: SafeArea(
          child: ListView.builder(
            itemCount: children.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  title: Text(children[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const ChildSignUpScreen();
                            }));
                          },
                          icon: const Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            String temp = (children[index]);

                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const ManagePage();
                            }));
                          },
                          icon: const Icon(Icons.savings))
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: Wrap(
        direction: Axis.horizontal,
        children: <Widget>[
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: TextField(
              controller: _firstNameController,
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Child Name',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: FloatingActionButton(
              onPressed: () {
                addChild(_firstNameController.text.trim());
                debugPrint('i am ' + children[0].toString());
                setInfo();
              },
              child: const Icon(Icons.add),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: FloatingActionButton(
              onPressed: () {
                removeChild(_firstNameController.text.trim());
                debugPrint('i am ' + children[1].toString());
                setInfo();
              },
              backgroundColor: Colors.deepPurpleAccent,
              child: const Icon(Icons.delete),
            ),
          ),
        ],
      ),
    );
  }
}
