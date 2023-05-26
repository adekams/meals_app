import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Categories'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: const [
          Text(
            'one',
            style: TextStyle(color: Colors.amber),
          ),
          Text(
            'two',
            style: TextStyle(color: Colors.amber),
          ),
          Text(
            'three',
            style: TextStyle(color: Colors.amber),
          ),
          Text(
            'four',
            style: TextStyle(color: Colors.amber),
          ),
        ],
      ),
    );
  }
}
