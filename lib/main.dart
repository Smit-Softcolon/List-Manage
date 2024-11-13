import 'package:flutter/material.dart';
import 'package:item_list_manager_task/list_manage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'List Manage',
      debugShowCheckedModeBanner: false,
      home: ListManage(),
    );
  }
}
