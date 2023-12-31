import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/Home/shared/constant.dart';
import 'package:islamic/Home/shared/shared_pref.dart';
import 'package:islamic/my_theme.dart';
import 'package:islamic/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: () {
            CacheHelper.saveData(key: 'isLight', value: true)
                .then((value) => provider.changeTheme(ThemeMode.light));
          },
          child: appTheme == ThemeMode.light
              ? getSelectedItem(AppLocalizations.of(context)!.light)
              : getUnselectedItem(AppLocalizations.of(context)!.light),
        ),
        InkWell(
          onTap: () {
            CacheHelper.saveData(key: 'isLight', value: false)
                .then((value) => provider.changeTheme(ThemeMode.dark));
          },
          child: appTheme == ThemeMode.dark
              ? getSelectedItem(AppLocalizations.of(context)!.dark)
              : getUnselectedItem(AppLocalizations.of(context)!.dark),
        ),
      ],
    );
  }

  Widget getSelectedItem(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).primaryColor)),
          Icon(Icons.check, color: Theme.of(context).primaryColor)
        ],
      ),
    );
  }

  Widget getUnselectedItem(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: MyTheme.blackColor)),
        ],
      ),
    );
  }
}
