import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                title: Text('Задача ${index + 1}'),
                subtitle: Text(
                    'наверное надо что-то большое, потому что задач у одного механизатора 1-2'),
              ),
          separatorBuilder: (context, index) => Divider(),
          itemCount: 11),
    );
  }
}
