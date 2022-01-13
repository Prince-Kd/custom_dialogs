
import 'package:custom_dialogs/dialog.dart';
import 'package:custom_dialogs/dialog_details.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DialogDetails details = DialogDetails();
  List alertType = [
    'success',
    'error',
    'info',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Custom Dialogs'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  label: Text('Title'),
                  hintText: 'Alert title',
                ),
                onChanged: (value) {
                  setState(() {
                    details.title = value;
                  });
                },
              ),
              const SizedBox(height: 20,),
              TextField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  label: Text('Content'),
                  hintText: 'Alert content',
                ),
                onChanged: (value) {
                  setState(() {
                    details.content = value;
                  });
                },
              ),
              const SizedBox(height: 20,),
              DropdownButtonFormField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10.0)
                ),
                  value: details.type,
                  items: alertType
                      .map((e) => DropdownMenuItem(
                            child: Text(e, style: const TextStyle(fontSize: 20,),),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      details.type = value as String;
                    });
                  }),
              const SizedBox(height: 20,),
              const Text('Action buttons', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
              TextField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  label: Text('Action 1'),
                  hintText: 'Action 1 text',
                ),
                onChanged: (value) {
                  setState(() {
                    details.action1 = value;
                  });
                },
              ),
              const SizedBox(height: 20,),
              TextField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  label: Text('Action 2'),
                  hintText: 'Action 2 text',
                ),
                onChanged: (value) {
                  setState(() {
                    details.action2 = value;
                  });
                },
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(padding: EdgeInsets.all(10)),
                  onPressed: (){
                showDialog(context: context, builder: (context){
                  return CustomDialog(details: details);
                });
              }, child: const Text('Open dialog', style: TextStyle(fontSize: 20),))
            ],
          ),
        ));
  }
}
