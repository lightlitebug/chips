import 'package:flutter/material.dart';

import '../chip_data.dart';

class ChoiceChipScreen extends StatefulWidget {
  @override
  _ChoiceChipScreenState createState() => _ChoiceChipScreenState();
}

class _ChoiceChipScreenState extends State<ChoiceChipScreen> {
  int selectedIndex;

  void submit() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('You selected'),
          content: Container(
            padding: EdgeInsets.all(10.0),
            color: Colors.grey[50],
            child: Text(concerns[selectedIndex]['label']),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChoiceChip'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 10.0,
              runSpacing: 5.0,
              children: concerns.asMap().entries.map((entry) {
                int idx = entry.key;
                return buildChoiceChip(
                  index: idx,
                  label: entry.value['label'],
                  color: entry.value['color'],
                );
              }).toList(),
            ),
          ),
          Center(
            child: RaisedButton(
              onPressed: selectedIndex == null ? null : submit,
              child: Text('SUBMIT'),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildChoiceChip({int index, String label, Color color}) {
    return ChoiceChip(
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
      selected: selectedIndex == index,
      selectedColor: color.withOpacity(0.5),
      onSelected: (bool selected) {
        setState(() {
          selectedIndex = selected ? index : null;
        });
      },
    );
  }
}
