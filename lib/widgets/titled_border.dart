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
      clipBehavior: Clip.none,
      children: <Widget>[
        Center(
          child: Container(
            width: double.infinity,
            // margin: const EdgeInsets.only(top: 7),
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
            child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                child: child),
          ),
        ),
        Positioned(
          // more 'left' pushes title text to the right
          left: 16,
          // more 'top' pushes title text downward
          // top: 0,
          top: -7,
          child: Container(
            padding: const EdgeInsets.only(left: 4, right: 4),
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Text(
              title,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}
