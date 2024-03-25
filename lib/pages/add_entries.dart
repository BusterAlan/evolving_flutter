import 'package:flutter/material.dart';

class AddEntries extends StatelessWidget {

  const AddEntries({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(title: const Text('Agregar ingresos')),
      body: const Center(child: Text('Add Entries Page')),

    );

  }

}

