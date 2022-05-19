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
          left: 16, // # of pixels by which title text gets pushed to the right
          top: -7, // # of pixels by which title text gets pushed down
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
