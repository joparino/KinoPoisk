import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

class EmptyFilmsData extends StatelessWidget {
  const EmptyFilmsData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 250),
      width: 200,
      child: const AutoSizeText(
        "Упс! Кажется тут ничего нет \n\t добавьте фильм в список!",
        style: TextStyle(fontSize: 14),
        overflow: TextOverflow.ellipsis)
      );
  }
}
