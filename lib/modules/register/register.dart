import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymentapp/modules/payment/cubit/cubit.dart';
import 'package:paymentapp/modules/payment/cubit/states.dart';
import 'package:paymentapp/modules/payment/toggle.dart';
import 'package:paymentapp/shared/components/component.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var firstnameController = TextEditingController();
  var lastnameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var priceController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create : (context)=>PaymentCubit(),
      child: BlocConsumer<PaymentCubit ,PaymentStates>(
        listener: (context  ,state){
          if (state is PaymentRefCodeSuccessState){
            navigateAndFinish(context , ToggleScreen());
          }
        },
        builder: (context  ,state){
           return SafeArea(
             child: Scaffold(
               resizeToAvoidBottomInset: true,
               appBar: AppBar(
                 title: Center(
                   child: Text("Payment Integration"),
                 ),
               ),
               body: Padding(
                 padding: EdgeInsets.all(10.0),
                 child: SingleChildScrollView(
                   child: Form(
                     key: formKey,
                     child: Column(
                       children: [
                         defauldTextFormField(
                             controller: firstnameController,
                             type: TextInputType.name,
                             validator: (String? value) {
                               if (value!.isEmpty) {
                                 return 'Please enter your fisrt name';
                               }
                               return null;
                             },
                             label: "First Name",
                             prefix: Icons.person),
                         defaultSizedBox(),

                         defauldTextFormField(
                             controller: lastnameController,
                             type: TextInputType.name,
                             validator: (String? value) {
                               if (value!.isEmpty) {
                                 return 'Please enter your last name';
                               }
                               return null;
                             },
                             label: "Last Name",
                             prefix: Icons.person),
                         defaultSizedBox(),

                         defauldTextFormField(
                             controller: emailController,
                             type: TextInputType.emailAddress,
                             validator: (String? value) {
                               if (value!.isEmpty) {
                                 return 'Please enter your email';
                               }
                               return null;
                             },
                             label: "Email",
                             prefix: Icons.email),
                         defaultSizedBox(),

                         defauldTextFormField(
                             controller: phoneController,
                             type: TextInputType.phone,
                             validator: (String? value) {
                               if (value!.isEmpty) {
                                 return 'Please enter your phone';
                               }
                               return null;
                             },
                             label: "Phone Number",
                             prefix: Icons.phone),
                         defaultSizedBox(),

                         defauldTextFormField(
                             controller: priceController,
                             type: TextInputType.number,
                             validator: (String? value) {
                               if (value!.isEmpty) {
                                 return 'Please enter item price';
                               }
                               return null;
                             },
                             label: "Price",
                             prefix: Icons.money),
                         defaultSizedBox(),
                         defaultButton(text: "Go To Pay", function: (){

                           if(formKey.currentState!.validate()){
                             print(firstnameController.text);
                             print(lastnameController.text);
                             print(emailController.text);
                             print(phoneController.text);
                             print(priceController.text);
                             PaymentCubit.get(context).getFirstToken(priceController.text, firstnameController.text,
                                 lastnameController.text, emailController.text, phoneController.text);
                           }

                         } ,  raduis: 12 , width: 200)
                       ],

                     ),
                   ),
                 ),
               ),
             ),
           );
        },
      )

    );
  }
}
