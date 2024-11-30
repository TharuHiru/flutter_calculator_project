//IM/2021/011 - G.W.T.Hirushani//

import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  final List<String> history;

  const HistoryScreen({Key? key, required this.history}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              Navigator.of(context)
                  .pop(true); // Return true to indicate clearing history
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(history[index]),
          );
        },
      ),
    );
  }
}
