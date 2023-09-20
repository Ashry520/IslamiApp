import 'package:flutter/material.dart';

class HadethTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Image.asset('assets/images/hadeth_logo.png')),
        Divider(
          color: Theme.of(context).primaryColor,
          thickness: 3,
        ),
        Text('Hadeth Name', style: Theme.of(context).textTheme.titleMedium),
        Divider(
          color: Theme.of(context).primaryColor,
          thickness: 3,
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Text('');
            },
            itemCount: 0,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: Theme.of(context).primaryColor,
                thickness: 1,
              );
            },
          ),
        )
      ],
    );
  }

  void loadHadethFile() {

    return;
  }
}
