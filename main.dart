import 'package:flutter/material.dart';
import 'package:flutterpayment/shared/network/dio.dart';

import 'modules/register/register.dart';


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

