import 'package:flutter/cupertino.dart';

class Heading extends StatelessWidget {
  final String text;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final double size;

  const Heading(
      {super.key,
      required this.text,
      required this.size,
      this.top = 0.0,
      this.bottom = 0.0,
      this.left = 0.0,
      this.right = 0.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: top!,
        bottom: bottom!,
        left: left!,
        right: right!,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(text,
            style: TextStyle(
              fontSize: size,
              fontWeight: FontWeight.w700,
            ),
            overflow: TextOverflow.ellipsis,maxLines: 1,),

      ),
    );
  }
}
