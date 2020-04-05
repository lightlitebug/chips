import 'package:flutter/material.dart';

import '../chip_data.dart';

class ActionChipScreen extends StatefulWidget {
  @override
  _ActionChipScreenState createState() => _ActionChipScreenState();
}

class _ActionChipScreenState extends State<ActionChipScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('ActionChip'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          spacing: 10.0,
          runSpacing: 5.0,
          children: concerns.asMap().entries.map((entry) {
            int idx = entry.key;
            return buildActionChip(
              index: idx,
              label: entry.value['label'],
              color: entry.value['color'],
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget buildActionChip({int index, String label, Color color}) {
    return ActionChip(
      label: Text(
        label,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      avatar: CircleAvatar(
        child: Text(
          label[0].toUpperCase(),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: color,
      padding: const EdgeInsets.all(5),
      onPressed: () {
        scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text('$label Action Chip is pressed'),
          ),
        );
      },
    );
  }
}
