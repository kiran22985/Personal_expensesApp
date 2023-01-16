import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:udemycourse/section4/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction>? transactions;

  TransactionList({this.transactions});

  @override
  Widget build(BuildContext context) {
    return transactions!.isEmpty ?Image.asset("assets/images/watermark.png"):ListView.builder(
        itemCount: transactions!.length,
        itemBuilder: (ctx, index) {
          return Card(
            child: ListTile(
              leading: FittedBox(
                child: CircleAvatar(
                  radius: 40,
                  child:
                      Text("Rs. ${transactions![index].amount.toString()}"),
                ),
              ),
              title: Text(transactions![index].title!, style: Theme.of(context).textTheme.titleLarge,),
              subtitle: Text(
                        DateFormat.yMMMMd().format(transactions![index].date!),
                        style: const TextStyle(color: Colors.grey),
                      ),
                      trailing: MediaQuery.of(context).size.width<=360?IconButton(icon: Icon(Icons.delete,color: Theme.of(context).errorColor,),onPressed: (){
                        print("Device width  ${MediaQuery.of(context).size.width}");
                        print("Device height  ${MediaQuery.of(context).size.height}");
                      },)
                      :TextButton.icon(onPressed: (){}, icon: Icon(Icons.delete), label: Text("Delete"))
            ),
            
          );
        });
  }
}

// Row(
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.symmetric(
//                           vertical: 10, horizontal: 15),
//                       padding: const EdgeInsets.all(10),
//                       child: Text(
//                         "Rs. ${transactions![index].amount.toString()}",
//                         style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Theme.of(context).primaryColor),
//                       ),
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: Theme.of(context).primaryColor,
//                           width: 2,
//                           //style: BorderStyle.solid
//                         ),
//                         //borderRadius: BorderRadius.circular(20)
//                       ),
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           transactions![index].title!,
//                           style: Theme.of(context).textTheme.titleLarge,
//                         ),
                        
//                       ],
//                     )
//                   ],
//                 )