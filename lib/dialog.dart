import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomDialog extends StatelessWidget {
  String? title;
  String? content;
  String? type;
  List<String>? actions;

  CustomDialog({Key? key, this.title = 'Info', this.content, this.type, this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(10),
      // ),
      title: Column(
        children: [
          title == 'Info'
              ? const Icon(
                  Icons.info,
                  color: Colors.amber,
                  size: 100,
                )
              : type == 'success'
                  ? const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 100,
                    )
                  : type == 'error'
                      ? const Icon(
                          Icons.error,
                          color: Colors.red,
                          size: 100,
                        )
                      : const Icon(
                          Icons.warning,
                          color: Colors.amber,
                          size: 100,
                        ),
          Text(
            title!,
            style: TextStyle(
              color: title == 'Info'
                  ? Colors.amber
                  : type == 'success'
                      ? Colors.green
                      : type == 'error'
                          ? Colors.red
                          : Colors.amber,
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      content: Text(
        content ?? '',
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
            children: actions!.map((String action) => SizedBox(
              width: 120,
              child: action == '' ? const SizedBox() : ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    primary: actions![0] == action ? Colors.green : Colors.red,
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
            )).toList()
          ),
        )
      ],
    );
  }
}
