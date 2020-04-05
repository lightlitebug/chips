import 'package:flutter/material.dart';

import '../chip_data.dart';

class FilterChipScreen extends StatefulWidget {
  @override
  _FilterChipScreenState createState() => _FilterChipScreenState();
}

class _FilterChipScreenState extends State<FilterChipScreen> {
  List<String> filters = [];

  void submit() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('You selected'),
          content: Container(
            padding: EdgeInsets.all(10.0),
            color: Colors.grey[200],
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: filters.map((item) {
                return Text(item);
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FilterChip'),
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
                return buildFilterChip(
                  index: idx,
                  label: entry.value['label'],
                  color: entry.value['color'],
                );
              }).toList(),
            ),
          ),
          Center(
            child: RaisedButton(
              child: Text('SUBMIT'),
              onPressed: filters.length == 0 ? null : submit,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFilterChip({int index, String label, Color color}) {
    return FilterChip(
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
      selected: filters.contains(label),
      onSelected: (bool selected) {
        setState(() {
          if (selected) {
            filters.add(label);
          } else {
            filters.removeWhere((value) {
              return value == label;
            });
          }
        });
      },
    );
  }
}
