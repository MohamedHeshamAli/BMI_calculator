import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color clr;
  final Widget cardChild;
  ReusableCard({this.clr, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration:
            BoxDecoration(color: clr, borderRadius: BorderRadius.circular(10)));
  }
}
