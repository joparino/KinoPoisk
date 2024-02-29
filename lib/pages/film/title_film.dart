import 'package:flutter/material.dart';

class Title extends StatelessWidget {
  const Title({Key? key, required this.title,}) : super(key: key);
  
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 0, right: 0, top: 30),
              child: Text(title,
              style: TextStyle(color: Colors.blueGrey[600],
              fontSize: 26,
              ),
            ),
          ),
        ],
      ),
    );
  }
}