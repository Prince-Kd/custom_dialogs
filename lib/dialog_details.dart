import 'package:flutter/material.dart';

class DialogDetails {
  String? title;
  String? content = '';
  String? type = 'success';
  String? action1 = '';
  String? action2 = '';
  //List<String>? actions;

  DialogDetails({this.title, this.content = '', this.type, this.action1 = '', this.action2 = ''});

  List get actions => [action1 == '' ? 'OK' : action1, action2];

  Widget icon(){
    switch(type){
      case 'success':
        return const Icon(
            Icons.check_circle,
            color: Colors.green,
          size: 100
        );
      case 'error':
        return const Icon(
          Icons.error,
          color: Colors.red,
          size: 100
        );
      case 'info':
        return const Icon(
          Icons.info,
          color: Colors.amber,
          size: 100
        );
      default:
        return const Icon(
            Icons.info,
            color: Colors.amber,
            size: 100
        );
    }
  }

  Color titleColor(){
    switch(type) {
      case 'success':
        return Colors.green;
      case 'error':
        return Colors.red;
      case 'info':
        return Colors.amber;
      default:
        return Colors.amber;
    }
  }

}

