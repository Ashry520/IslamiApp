import 'package:flutter/material.dart';
import 'package:islamic/Home/hadeth/HadethScreen.dart';
import 'package:islamic/Home/hadeth/hadeth_tab.dart';
class HadethName extends StatelessWidget {
  Hadeth hadeth;

  HadethName({required this.hadeth});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(HadethScreen.routeName,
                arguments: hadeth);
          },
          child: Text(
            hadeth.title,
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
