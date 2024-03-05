import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HivePage extends StatefulWidget {
  const HivePage({super.key});

  @override
  State<HivePage> createState() => _HivePageState();
}

class _HivePageState extends State<HivePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  List<Map<String, dynamic>> _items = [];
  final _shoppingBox = Hive.box('shopping_box');
  @override
  void initState() {
    super.initState();
    _refreshItems();
  }

  void _refreshItems() {
    final data = _shoppingBox.keys.map((key) {
      final item = _shoppingBox.get(key);

      return {"key": key, "name": item["name"], "quantity": item['quantity']};
    }).toList();
    setState(() {
      _items = data.reversed.toList();
    });
  }

  Future<void> _createItem(Map<String, dynamic> newItem) async {
    await _shoppingBox.add(newItem);
    _refreshItems();
  }

  Future<void> _upadteItem(int itemKey, Map<String, dynamic> item) async {
    await _shoppingBox.put(itemKey, item);
    _refreshItems();
  }

  Future<void> _deleteItem(int itemKey) async {
    await _shoppingBox.delete(itemKey);
    _refreshItems();
  }

  void _showForm(BuildContext ctx, int? itemKey) async {
    if (itemKey != null) {
      final existingItem =
          _items.firstWhere((element) => element['key'] == itemKey);
      _nameController.text = existingItem['name'];
      _quantityController.text = existingItem['quantity'];
    }

    showModalBottomSheet(
        context: ctx,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(ctx).viewInsets.bottom,
                  top: 15,
                  left: 15,
                  right: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(hintText: 'Task'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _quantityController,
                    decoration: const InputDecoration(hintText: 'Summary'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (itemKey == null) {
                        _createItem({
                          "name": _nameController.text,
                          "quantity": _quantityController.text,
                        });
                      }
                      if (itemKey != null) {
                        _upadteItem(itemKey, {
                          'name': _nameController.text.trim(),
                          'quantity': _quantityController.text.trim(),
                        });
                      }

                      _nameController.text = '';
                      _quantityController.text = '';
                      Navigator.of(context).pop();
                    },
                    child: Text(itemKey == null ? 'Create New' : 'Update'),
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurple[100],
          // leading: InkWell(
          //     onTap: () {
          //       Navigator.of(context).pop();
          //     },
          //     child: const Icon(Icons.arrow_back)),
          title: const Center(
              child: Text(
            'Notes',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )),
          actions: const [
            Padding(
              padding: EdgeInsets.all(15.0),
            )
          ]),
      body: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (_, index) {
            final currentItem = _items[index];
            return Card(
              color: Colors.orange.shade100,
              margin: const EdgeInsets.all(10),
              elevation: 3,
              child: ListTile(
                title: Text(currentItem['name']),
                subtitle: Text(currentItem['quantity'].toString()),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () => _showForm(context, currentItem['key']),
                        icon: const Icon(Icons.edit)),
                    IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (ctx1) {
                              return AlertDialog(
                                title: const Text('Delete'),
                                content: const Text('Do you want to delete'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(ctx1).pop();
                                    },
                                    child: const Text('cancel'),
                                  ),
                                  TextButton(
                                      onPressed: () async {
                                        _deleteItem(currentItem['key']);
                                        Navigator.of(ctx1).pop();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content:
                                                Text('Delete successfully'),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      },
                                      child: const Text('ok'))
                                ],
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.delete))
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(context, null),
        child: const Icon(Icons.add),
      ),
    );
  }
}
