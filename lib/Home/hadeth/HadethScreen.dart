import 'package:flutter/material.dart';
import 'package:islamic/Home/hadeth/HadethDetails.dart';
import 'package:islamic/Home/hadeth/hadeth_tab.dart';
import 'package:islamic/my_theme.dart';
import 'package:islamic/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class HadethScreen extends StatefulWidget {
  static const String routeName = 'HadethScreen';

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    return Stack(
      children: [
        provider.appTheme == ThemeMode.light
            ? Image.asset(
                'assets/images/bg3.png',
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.fill,
              )
            : Image.asset(
                'assets/images/bgdark.png',
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              '${args.title}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.07,
                horizontal: MediaQuery.of(context).size.width * 0.07),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: provider.appTheme == ThemeMode.light
                    ? MyTheme.whiteColor
                    : MyTheme.primarydark,
                borderRadius: BorderRadius.circular(30)),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return HadethDetails(content: args.content[index]);
              },
              itemCount: args.content.length,
            ),
          ),
        )
      ],
    );
  }
}
