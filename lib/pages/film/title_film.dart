import 'package:flutter/material.dart';

class title extends StatelessWidget {
  const title({Key? key, required this.Title,}) : super(key: key);
  
  final String Title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 0, right: 0, top: 30),
              child: Text('$Title',
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