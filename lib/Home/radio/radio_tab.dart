import 'package:flutter/material.dart';
import 'package:islamic/my_theme.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/radio.png'),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Text(
            'Quran Radio',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                iconSize: 72,
                icon: Icon(Icons.skip_previous, color: MyTheme.primaryLight),
                onPressed: () {
                  // ...
                },
              ),
              IconButton(
                iconSize: 72,
                icon: Icon(Icons.play_arrow, color: MyTheme.primaryLight),
                onPressed: () {
                  // ...
                },
              ),
              IconButton(
                iconSize: 72,
                icon: Icon(Icons.skip_next, color: MyTheme.primaryLight),
                onPressed: () {
                  // ...
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
