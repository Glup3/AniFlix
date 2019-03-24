import 'package:flutter/material.dart';

class CoverCard extends StatelessWidget {
  final int index;
  final Widget content;

  CoverCard({Key key, this.index, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: content,
              ),
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.blue,
                    onTap: () {},
                  ),
                ),
              )
            ],
          ),
    );
  }
}
