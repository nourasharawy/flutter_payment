import 'package:flutter/material.dart';
import 'package:paymentapp/modules/payment/ref_code.dart';
import 'package:paymentapp/modules/payment/visa_card.dart';
import 'package:paymentapp/shared/components/component.dart';

class ToggleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        navigateAndFinish(context , VisaCardScreen());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.red)
                        ),
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage("assets/visa.jpg")),
                            SizedBox(height: 15,),
                            Text('Payment with Card'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        navigateAndFinish(context , RefCodeScreen());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.red)
                        ),
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage("assets/refCode.jpg")),
                            SizedBox(height: 15,),
                            Text('Payment with refCode'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}

