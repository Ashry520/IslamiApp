import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/Home/shared/shared_pref.dart';
import 'package:islamic/my_theme.dart';
import 'package:islamic/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

import '../Home/shared/constant.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: () {
            CacheHelper.saveData(key: 'lang', value: 'en')
                .then((value) => provider.changeLanguage('en'));
          },
          child: appLanguage == 'en'
              ? getSelectedItem(AppLocalizations.of(context)!.english)
              : getUnselectedItem(AppLocalizations.of(context)!.english),
        ),
        InkWell(
          onTap: () {
            CacheHelper.saveData(key: 'lang', value: 'ar')
                .then((value) => provider.changeLanguage('ar'));
          },
          child: appLanguage == 'ar'
              ? getSelectedItem(AppLocalizations.of(context)!.arabic)
              : getUnselectedItem(AppLocalizations.of(context)!.arabic),
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
