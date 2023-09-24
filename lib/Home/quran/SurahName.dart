import 'package:flutter/material.dart';
import 'package:islamic/Home/quran/SurahScreen.dart';
import 'package:islamic/my_theme.dart';
import 'package:islamic/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class SurahNames extends StatelessWidget {
  String surahName;
  int index;

  SurahNames({required this.surahName, required this.index});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(SurahScreen.routeName,
                arguments: SurahDetailsArgs(name: surahName, index: index));
          },
          child: Text(
            surahName,
            style: provider.appTheme == ThemeMode.light
                ? Theme.of(context).textTheme.titleSmall
                : Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: MyTheme.whiteColor),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.02,
        ),
        Text(
          '${index + 1}',
          style: provider.appTheme == ThemeMode.light
              ? Theme.of(context).textTheme.titleSmall
              : Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: MyTheme.whiteColor),
        )
      ],
    );
  }
}
