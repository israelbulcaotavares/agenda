import 'dart:io';

import 'package:agenda/helpers/contact_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ContactHelper helper = ContactHelper();

    List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();

    // Contact c = Contact();
    // c.name = "Raphael Tavares";
    // c.email = "raphaelbulcaotavares@gmail.com";
    // c.phone = "3252353";
    // c.img = "imagexx";
    //
    // helper.saveContact(c);


    helper.getAllContacts().then((list) {
      setState(() {
        contacts = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Contatos"),
          backgroundColor: Colors.red,
          centerTitle: true),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return _contactCard(context, index);
          }
      ),
    );
  }

  Widget _contactCard(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children:  [
            Container(
              width: 80,
              height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: contacts[index].img != null ?
                  FileImage(File(contacts[index].img)) :
                  const AssetImage("images/person.png") as ImageProvider,
              ),
            ),
            ),
              Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Column(

                    children: <Widget>[
                  Text(contacts[index].name ,
                    style: const TextStyle(fontSize: 22.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(contacts[index].email ,
                    style: const TextStyle(fontSize: 18.0),
                  ),
                  Text(contacts[index].phone,
                    style: const TextStyle(fontSize: 18.0),
                  )

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }



}
