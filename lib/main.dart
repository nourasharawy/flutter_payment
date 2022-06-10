import 'package:flutter/material.dart';
import 'package:paymentapp/shared/network/dio.dart';

import 'modules/payment/toggle.dart';
import 'modules/register/register.dart';
import 'shared/network/dio.dart';

void main() async{
  await DioHelperPayment.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  RegisterPage(),
    );
  }
}

