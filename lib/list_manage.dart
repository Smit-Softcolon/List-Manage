import 'package:flutter/material.dart';

final ValueNotifier<List<String>> itemsNotifier =
    ValueNotifier<List<String>>([]);

final TextEditingController _controller = TextEditingController();

bool addItems(String str) {
  // Solution
  if (str.isNotEmpty) {
    itemsNotifier.value = List.from(itemsNotifier.value)..add(str);
    _controller.clear();
    return true;
  }
  return false;
}

class ListManage extends StatefulWidget {
  const ListManage({super.key});

  @override
  State<ListManage> createState() => _ListManageState();
}

class _ListManageState extends State<ListManage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Task'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter item',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              addItems(_controller.text);
            },
            child: const Text('Add'),
          ),
          Expanded(
            child: ValueListenableBuilder<List<String>>(
              valueListenable: itemsNotifier,
              builder: (context, items, child) {
                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(items[index]),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
