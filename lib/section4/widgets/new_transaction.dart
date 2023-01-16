import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function? addTx;
  NewTransaction({super.key, this.addTx});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  DateTime? _selectedDate;
  void _getDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2025),
    ).then((pickedDate) {
      if(pickedDate==null){
        return;
      }
      setState(() {
        _selectedDate=pickedDate;
      });
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Padding(
          padding:  EdgeInsets.only(top: 10,left: 10,right: 10, bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Title"),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: amountController,
              decoration: InputDecoration(labelText: "Amount"),
            ),
            Container(
              height: 50,
              child: Row(
                children: [
                  Text(_selectedDate==null?"No date choosen!":DateFormat("yyyy-MM-dd").format(_selectedDate!)),
                  TextButton(onPressed: _getDate, child: Text("Choose Date"))
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  widget.addTx!(
                      titleController.text, double.parse(amountController.text));
                },
                child: Text(
                  "Add Transaction",
                  style: TextStyle(color: Colors.white),
                ))
          ]),
        ),
      ),
    );
  }
}
