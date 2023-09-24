import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/Home/quran/SurahDetails.dart';
import 'package:islamic/my_theme.dart';
import 'package:islamic/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class SurahScreen extends StatefulWidget {
  static const String routeName = 'SurahScreen';

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as SurahDetailsArgs;
    if (verses.isEmpty) {
      loadFile(args.index);
    }
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
              '${args.name}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: verses.length == 0
              ? Center(child: CircularProgressIndicator())
              : Container(
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
                      return SurahDetails(
                        content: verses[index],
                        index: index,
                      );
                    },
                    itemCount: verses.length,
                  ),
                ),
        )
      ],
    );
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    verses = lines;
    setState(() {});
  }
}

class SurahDetailsArgs {
  String name;
  int index;

  SurahDetailsArgs({required this.name, required this.index});
}
