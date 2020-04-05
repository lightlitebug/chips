import 'package:flutter/material.dart';

import '../chip_data.dart';

class InputChipScreen extends StatefulWidget {
  @override
  _InputChipScreenState createState() => _InputChipScreenState();
}

class _InputChipScreenState extends State<InputChipScreen> {
  List<String> inputs = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InputChip'),
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
                return buildInputChip(
                  index: idx,
                  label: entry.value['label'],
                  color: entry.value['color'],
                );
              }).toList(),
            ),
          ),
          if (inputs.length > 0)
            Column(
              children: <Widget>[
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    spacing: 10.0,
                    runSpacing: 5.0,
                    children: inputs.asMap().entries.map((entry) {
                      int idx = entry.key;
                      return buildSelectedInputChip(
                        index: idx,
                        label: entry.value,
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget buildInputChip({int index, String label, Color color}) {
    return InputChip(
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
      selected: inputs.contains(label),
      onSelected: (bool selected) {
        setState(() {
          if (selected) {
            inputs.add(label);
          } else {
            inputs.removeWhere((value) {
              return value == label;
            });
          }
        });
      },
    );
  }

  Widget buildSelectedInputChip({int index, String label}) {
    return Chip(
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
      backgroundColor: Colors.grey,
      onDeleted: () {
        setState(() {
          inputs.removeWhere((value) {
            return value == label;
          });
        });
      },
    );
  }
}
