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
        title: Text(
          'Selecione o mês da transação',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _meses.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 65,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/detalhes',
                              arguments: _meses[index]);
                        },
                        child: Text(
                          _meses[index],
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(color: Colors.purple, width: 1),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
