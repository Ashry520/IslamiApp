import 'package:flutter/material.dart';
import 'package:islamic/Home/hadeth/HadethScreen.dart';
import 'package:islamic/Home/hadeth/hadeth_tab.dart';
import 'package:islamic/my_theme.dart';
import 'package:islamic/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class HadethName extends StatelessWidget {
  Hadeth hadeth;

  HadethName({required this.hadeth});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed(HadethScreen.routeName, arguments: hadeth);
          },
          child: Text(
            hadeth.title,
            style: provider.appTheme == ThemeMode.light
                ? Theme.of(context).textTheme.titleSmall
                : Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: MyTheme.whiteColor),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
