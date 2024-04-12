import 'package:flutter/material.dart';

class SearchTrainTile extends StatelessWidget {
  const SearchTrainTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          "198353",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      title: Text("Avadh EXP", style: Theme.of(context).textTheme.bodyLarge),
      subtitle: Text(
        'Bangloor -> Kannur',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
