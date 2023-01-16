import 'package:flutter/material.dart';
import 'package:udemycourse/section4/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:udemycourse/section4/widgets/chart.dart';
import 'package:udemycourse/section4/widgets/new_transaction.dart';
import 'package:udemycourse/section4/widgets/transaction_list.dart';



class ExpensesApp extends StatefulWidget {
  ExpensesApp({super.key});

  @override
  State<ExpensesApp> createState() => _ExpensesAppState();
}

class _ExpensesAppState extends State<ExpensesApp> {

  bool switchValue=false;
  final List<Transaction> userTransactions=[
    

  ];
  void _getUserTransactionData (String title, double amount){
    final newTx=Transaction(Id: DateTime.now().toString(), title: title, amount: amount, date: DateTime.now());
    setState(() {
      userTransactions.add(newTx);
    });


  }
  void _startAddNewTransaction( BuildContext context){
    showModalBottomSheet(context: context, builder: (_){
      return NewTransaction(addTx: _getUserTransactionData,);

    });
  }

  List<Transaction> get _recentTransactions {
    return userTransactions.where((tx) {
      return tx.date!.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  


  

  @override
  Widget build(BuildContext context) {
    final isLandscape=MediaQuery.of(context).orientation==Orientation.landscape;
    final appBar=AppBar(
        title: const Text("Expenses App"),
        actions: [
          IconButton(onPressed: (){
            _startAddNewTransaction(context);
          }, icon: const Icon(Icons.add))
        ],
      );
    
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          
          children: [
            if(isLandscape)Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
            
              Text("Show chart"),
              Switch(value: switchValue, onChanged: (value){
                setState(() {
                  switchValue=value;
                });
              })
            ],),

            if(!isLandscape)
            Container(
              height: (MediaQuery.of(context).size.height- appBar.preferredSize.height-MediaQuery.of(context).padding.top)*0.3,
              child: Chart(_recentTransactions)),
            if(!isLandscape)
            Container(
            height: (MediaQuery.of(context).size.height- appBar.preferredSize.height-MediaQuery.of(context).padding.top)*0.7,
            child: TransactionList(transactions:userTransactions)),

            if(isLandscape)
            switchValue?Container(
              height: (MediaQuery.of(context).size.height- appBar.preferredSize.height-MediaQuery.of(context).padding.top)*0.7,
              child: Chart(_recentTransactions))
           :Container(
            height: (MediaQuery.of(context).size.height- appBar.preferredSize.height-MediaQuery.of(context).padding.top)*1,
            child: TransactionList(transactions:userTransactions))
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(onPressed: (){
        _startAddNewTransaction(context);
      }, child: Icon(Icons.add),),
    );
  }
}
