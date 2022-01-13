import 'package:custom_dialogs/dialog_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomDialog extends StatelessWidget {
  DialogDetails details;

  CustomDialog({Key? key, required this.details})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(10),
      // ),
      title: Column(
        children: [
          details.icon(),
          Text(
            details.title!,
            style: TextStyle(
              color: details.titleColor(),
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      content: Text(
        details.content!,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
      //actionsAlignment: MainAxisAlignment.center,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: details.actions.map((action){
              return action == '' ? (Container()) : (Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: action == '' ? 0 :  10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      primary: details.actions[0] == action ? Colors.green : Colors.red,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    action.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
    ));}).toList()
          ),
        )
      ],
    );
  }
}
