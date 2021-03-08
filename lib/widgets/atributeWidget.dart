import 'package:flutter/material.dart';

class AtributeWidget extends StatelessWidget {
  final int atribute;
  final String atributeLabel;

  AtributeWidget({@required this.atribute, @required this.atributeLabel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(atributeLabel),
        SizedBox(width: 8),
        Stack(
          children: [
            CircularProgressIndicator(
              backgroundColor: Theme.of(context).splashColor,
              value: atribute / 10,
            ),
            Positioned.fill(
              child: Center(
                child: Text(atribute.toString()),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
