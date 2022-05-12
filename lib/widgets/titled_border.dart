import 'package:flutter/material.dart';

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
      clipBehavior: Clip.none,
      children: [
        Positioned(
            top: 7,
            left: -12,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
            )),
        Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 7, height: 17, color: backgroundColor),
              Text(title,
                  style: TextStyle(
                    color: Colors.white,
                    backgroundColor: backgroundColor,
                  )),
              Container(width: 7, height: 17, color: backgroundColor),
            ])
      ],
    );
  }
}
