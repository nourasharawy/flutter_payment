import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymentapp/models/firstToken.dart';
import 'package:paymentapp/modules/payment/cubit/states.dart';
import 'package:paymentapp/shared/components/constants.dart';
import 'package:paymentapp/shared/network/dio.dart';


class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit() : super(PaymentSuccessState());

  static PaymentCubit get(context) => BlocProvider.of(context);
  FirstToken? firstToken;

  Future getFirstToken(String price,String firstName ,String lastName , String email ,String phone) async {
    print("getFirstToken");
    DioHelperPayment.postData(url: 'auth/tokens', data: {'api_key': PaymobKey})
        .then((value) {
      PaymobToken = value.data['token'];
      print('first token : ${PaymobToken}');
      emit(PaymentSuccessState());
      getOrderId(price,firstName ,lastName ,email ,phone);
    }).catchError((error) {
      print("error");
      print(error);
      emit(PaymentErrorState(error));
    });
  }

  Future getOrderId(String price,String firstName ,String lastName , String email ,String phone) async {
    print("getOrderId");
    DioHelperPayment.postData(url: 'ecommerce/orders', data: {
      'auth_token': PaymobToken,
      'delivery_needed': 'false',
      "amount_cents": price,
      "currency": "EGP",
      "items": []
    }).then((value) {
      paymobOrderId = value.data['id'].toString();
      print('paymobOrderId : ${paymobOrderId}');
      emit(PaymentOrderIDSuccessState());
      getFinalToken(price ,firstName ,lastName ,email ,phone );
      getFinalTokenKiosk(price ,firstName ,lastName ,email ,phone );
    }).catchError((error) {
      print("error");
      print(error);
      emit(PaymentOrderIDErrorState(error));
    });
  }

  Future getFinalToken(String price,String firstName ,String lastName , String email ,String phone) async {
    print("getFinalToken");
    DioHelperPayment.postData(url: 'acceptance/payment_keys', data: {
        "auth_token": PaymobToken,
        "amount_cents": price,
        "expiration": 3600,
        "order_id": paymobOrderId,
        "billing_data": {
          "apartment": "NA",
          "email": email,
          "floor": "NA",
          "first_name": firstName,
          "street": "NA",
          "building": "NA",
          "phone_number": phone,
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "last_name": lastName,
          "state": "NA"
        },
        "currency": "EGP",
        "integration_id": IntegrationIdCard,
        "lock_order_when_paid": "false"
    }).then((value) {
      FinalTokenCard = value.data['token'].toString();
      print('FinalTokenCard : ${FinalTokenCard}');
      emit(PaymentRequestTokenSuccessState());
    }).catchError((error) {
      print("error");
      print(error);
      emit(PaymentRequestTokenErrorState(error));
    });
  }

  Future getFinalTokenKiosk(String price,String firstName ,String lastName , String email ,String phone) async {
    print("getFinalToken");
    DioHelperPayment.postData(url: 'acceptance/payment_keys', data: {
      "auth_token": PaymobToken,
      "amount_cents": price,
      "expiration": 3600,
      "order_id": paymobOrderId,
      "billing_data": {
        "apartment": "NA",
        "email": email,
        "floor": "NA",
        "first_name": firstName,
        "street": "NA",
        "building": "NA",
        "phone_number": phone,
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "last_name": lastName,
        "state": "NA"
      },
      "currency": "EGP",
      "integration_id": IntegrationIdKoisk,
      "lock_order_when_paid": "false"
    }).then((value) {
      FinalTokenKoisk = value.data['token'].toString();
      print('FinalTokenKoisk : ${FinalTokenKoisk}');
      emit(PaymentRequestTokenKioskSuccessState());
      getRefCode();
    }).catchError((error) {
      print("error");
      print(error);
      emit(PaymentRequestTokenKioskErrorState(error));
    });
  }

  Future getRefCode() async {
    print("getRefCode");
    DioHelperPayment.postData(url: 'acceptance/payments/pay', data: {
      "source": {
        "identifier": "AGGREGATOR",
        "subtype": "AGGREGATOR"
      },
      "payment_token": FinalTokenKoisk
    }).then((value) {
      refCode = value.data['id'].toString();
      print('refCode : ${refCode}');
      emit(PaymentRefCodeSuccessState());
    }).catchError((error) {
      print("error");
      print(error);
      emit(PaymentRefCodeErrorState(error));
    });
  }
}
