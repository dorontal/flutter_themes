import 'package:flutter/material.dart';

// see: https://stackoverflow.com/questions/57978545

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
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 200,
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
          padding: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            border: Border.all(
                // color: const Color.fromARGB(255, 51, 204, 255), width: 1),
                color: Theme.of(context)
                    .inputDecorationTheme
                    .enabledBorder!
                    .borderSide
                    .color,
                width: 1),
            borderRadius: BorderRadius.circular(5),
            shape: BoxShape.rectangle,
          ),
        ),
        Positioned(
            left: 50,
            top: 12,
            child: Container(
              padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Text(
                title,
              ),
            )),
      ],
    );
  }
}
