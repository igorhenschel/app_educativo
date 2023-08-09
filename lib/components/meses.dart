import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeMeses extends StatelessWidget {
  final DateFormat _dateFormat = DateFormat.MMMM();

  final List<String> _meses = List.generate(12, (index) {
    DateTime dateTime = DateTime(DateTime.now().year, index + 1);
    return DateFormat.MMMM().format(dateTime);

  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nomes dos Meses'),
      ),
      
      body: Center(
        child: ListView.builder(
          itemCount: _meses.length,
          itemBuilder: (context, index) {
            return TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/detalhes',
                      arguments: _meses[index]);
                },
                child: Text(_meses[index]));
          },
        ),
      ),
    );
  }
}
