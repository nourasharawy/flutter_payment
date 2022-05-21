import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterpayment/modules/payment/cubit/states.dart';

class PaymentCubit extends Cubit<PaymentStates>{
  PaymentCubit(): super (PaymentSuccessState());

  static PaymentCubit get (context) => BlocProvider.of(context);

}