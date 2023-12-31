import 'package:flutter/material.dart';
import 'package:islamic/Home/quran/SurahName.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/Home/shared/constant.dart';
import 'package:islamic/my_theme.dart';
import 'package:islamic/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class QuranTab extends StatelessWidget {
  List<String> surahNames = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      children: [
        Center(child: Image.asset('assets/images/quran_logo.png')),
        Divider(
          color: appTheme == ThemeMode.light
              ? Theme.of(context).primaryColor
              : MyTheme.yellowColor,
          thickness: 3,
        ),
        Text(AppLocalizations.of(context)!.surah_name,
            style: Theme.of(context).textTheme.titleMedium),
        Divider(
          color: appTheme == ThemeMode.light
              ? Theme.of(context).primaryColor
              : MyTheme.yellowColor,
          thickness: 3,
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return SurahNames(
                surahName: surahNames[index],
                index: index,
              );
            },
            itemCount: surahNames.length,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: appTheme == ThemeMode.light
                    ? Theme.of(context).primaryColor
                    : MyTheme.yellowColor,
                thickness: 1,
              );
            },
          ),
        )
      ],
    );
  }
}
