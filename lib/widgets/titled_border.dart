import 'package:flutter/material.dart';

// See: https://stackoverflow.com/questions/57978545

class TitledBorder extends StatelessWidget {
  final String title;
  final Widget child;

  const TitledBorder({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 200,
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
          padding: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context)
                    .inputDecorationTheme
                    .enabledBorder!
                    .borderSide
                    .color,
                width: 1),
            borderRadius: BorderRadius.circular(4),
            shape: BoxShape.rectangle,
          ),
        ),
        Positioned(
            // more 'left' pushes title text to the right
            left: 16,
            // more 'top' pushes title text downward
            top: 13,
            child: Container(
              padding: const EdgeInsets.only(left: 4, right: 4),
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Text(
                title,
                style: const TextStyle(fontSize: 12),
              ),
            )),
      ],
    );
  }
}
