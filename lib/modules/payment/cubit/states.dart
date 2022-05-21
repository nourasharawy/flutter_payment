abstract class PaymentStates{}

class PaymentInitialState extends PaymentStates{}

class PaymentSuccessState  extends PaymentStates{}

class PaymentErrorState  extends PaymentStates{
  String? error;
  PaymentErrorState(this.error);
}