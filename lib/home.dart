
import 'package:custom_dialogs/dialog.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String title = 'Info';
  String? content;
  String type = 'success';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  label: Text('Title'),
                  hintText: 'Alert title',
                ),
                onChanged: (value) {
                  setState(() {
                    title = value;
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
                    content = value;
                  });
                },
              ),
              const SizedBox(height: 20,),
              DropdownButtonFormField(
                  value: type,
                  items: alertType
                      .map((e) => DropdownMenuItem(
                            child: Text(e, style: const TextStyle(fontSize: 20,),),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      type = value as String;
                    });
                  }),
              const SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                showDialog(context: context, builder: (context){
                  return CustomDialog(type: type, title: title, content: content);
                });
              }, child: const Text('Open dialog'))
            ],
          ),
        ));
  }
}
