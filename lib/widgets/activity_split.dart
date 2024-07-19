import 'package:custom_scroll/widgets/split_row.dart';
import 'package:flutter/material.dart';
import 'package:custom_scroll/models/split.dart';
import 'dart:math';

class ActivitySplit extends StatelessWidget {
  const ActivitySplit({
    super.key,
    this.splits
  });
  final List<SplitActivity>? splits;
  


  @override
  Widget build(BuildContext context) {
    final max = maxPace();
    final min = minPace();
    return Column(
      children: [
        const Text(
          'Split',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: 40,
              child: Text('KM', style: Theme.of(context).textTheme.labelMedium),
            ),
            SizedBox(
              width: 50,
              child:
                  Text('PACE', style: Theme.of(context).textTheme.labelMedium),
            ),
            const Expanded(
              child: Row(
                children: <Widget>[],
              ),
            ),
            SizedBox(
              width: 40,
              child: Text('ELEV',
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.right),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        if(splits != null && max != null && min != null)
        for(var split in splits!)
        ActivitySplitRow(split: split, maxPace: max, minPace: min,)
      ],
    );
  }
     int? maxPace() {
      if(splits != null){
        return splits!.map((split) => split.pace!.inSeconds).reduce((value,element)=> max(value, element));
      }
      return null;

   
   
  }

  int? minPace() {
    if(splits != null){

      final paces = splits!.map((split) => split.pace!.inSeconds);
      print(paces);
    return paces.reduce((value, element) => min(value, element));
    }
    return null;
    
  }
}
