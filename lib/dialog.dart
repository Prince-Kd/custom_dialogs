import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  String? title;
  String? content;
  String? type;

  CustomDialog({Key? key, this.title = 'Info', this.content, this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title!.toUpperCase(),
                style: TextStyle(
                  color: title == 'Info' ? Colors.amber : type == 'success'
                      ? Colors.green
                      : type == 'error'
                          ? Colors.red
                          : Colors.amber,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              title == 'Info' ? const Icon(
                Icons.info,
                color: Colors.amber,
              )
                  :
              type == 'success'
                  ? const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    )
                  : type == 'error'
                      ? const Icon(
                          Icons.error,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.info,
                          color: Colors.amber,
                        )
            ],
          ),
          const Divider( color: Colors.black, thickness: 1,),
        ],
      ),
      content: Text(
        content ?? '',
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'OK',
            style: TextStyle(fontSize: 20,),
          ),
        ),
      ],
    );
  }
}
