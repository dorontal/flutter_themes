import 'package:flutter/material.dart';

// Used: https://stackoverflow.com/questions/57978545
//   and https://stackoverflow.com/questions/51182803
//   and https://stackoverflow.com/questions/68965718 (for clipBehavior)

class TitledBorder extends StatelessWidget {
  const TitledBorder({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  final String title;
  final Widget child;

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
                // TODO: padding numbers based on TextFormField so use
                // a theme for that and put those class constants here
                // instead of hardwired numbers - this may not be true
                // for padding but it may be true for font size.
                padding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
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
