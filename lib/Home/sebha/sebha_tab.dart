import 'package:flutter/material.dart';
import 'package:islamic/my_theme.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double turns = 0;
  int tasbihNum = 0;
  List<String> tasbihat = [
    "سبحان الله",
    "الحمد لله",
    "لا اله الا الله",
    "الله اكبر"
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Center(child: Image.asset('assets/images/sebha_head.png')),
            Center(
                heightFactor: 1.5,
                child: InkWell(
                  onTap: () {
                    turns += 1 / 3;
                    tasbihNum++;
                    if (tasbihNum == 33) {
                      tasbihNum = 0;
                      index = (index + 1) % 4;
                    }
                    setState(() {});
                  },
                  child: AnimatedRotation(
                      turns: turns,
                      duration: Duration(milliseconds: 100),
                      child: Image.asset('assets/images/sebha_body.png')),
                )),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Number of tasbihat',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Expanded(
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: MyTheme.whiteColor,
                ),
                child: Center(
                    child: Text('$tasbihNum',
                        style: Theme.of(context).textTheme.titleMedium)),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Expanded(
              child: Container(
                height: 60,
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: MyTheme.primaryLight,
                ),
                child: Center(
                    child: Text('${tasbihat[index]}',
                        style: Theme.of(context).textTheme.titleMedium)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
