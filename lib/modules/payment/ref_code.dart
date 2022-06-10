
import 'package:flutter/material.dart';
import 'package:paymentapp/shared/components/constants.dart';

class RefCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("You should go to market to pay" ,style: TextStyle(fontWeight: FontWeight.bold , fontSize: 25)),
              SizedBox(height: 20),
              Text("This is the Reference Code" ,style: TextStyle(fontWeight: FontWeight.normal , fontSize: 20)),
              SizedBox(height: 20),
              Card(
                elevation: 5,
                shadowColor: Colors.blue,
                shape: Border.all(width: 1, color: Colors.red),
                child: Text('$refCode', style: TextStyle(fontWeight: FontWeight.bold , fontSize: 30),),
              ),
            ],
          ),
        ));;
  }
}
