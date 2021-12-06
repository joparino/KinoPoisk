import 'package:flutter/material.dart';

class stitle extends StatelessWidget {
  const stitle({Key? key, required this.Title,}) : super(key: key);
  
  final String Title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 2, top: 30),
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