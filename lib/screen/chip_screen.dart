import 'package:flutter/material.dart';

import '../chip_data.dart';

class ChipScreen extends StatefulWidget {
  @override
  _ChipScreenState createState() => _ChipScreenState();
}

class _ChipScreenState extends State<ChipScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chip Widget'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          spacing: 10.0,
          runSpacing: 5.0,
          children: concerns.asMap().entries.map((entry) {
            int idx = entry.key;
            return buildChip(
              index: idx,
              label: entry.value['label'],
              color: entry.value['color'],
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget buildChip({int index, String label, Color color}) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
      avatar: CircleAvatar(
        child: Text(
          label[0].toUpperCase(),
        ),
        backgroundColor: Colors.white,
      ),
      padding: EdgeInsets.all(5),
      backgroundColor: color,
      onDeleted: () {
        setState(() {
          concerns.removeAt(index);
        });
      },
    );
  }
}
