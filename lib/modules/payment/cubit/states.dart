abstract class PaymentStates{}

class PaymentInitialState extends PaymentStates{}

class PaymentSuccessState  extends PaymentStates{}
class PaymentErrorState  extends PaymentStates{
  var error;
  PaymentErrorState(this.error);
}

class PaymentOrderIDSuccessState  extends PaymentStates{}
class PaymentOrderIDErrorState  extends PaymentStates{
  var error;
  PaymentOrderIDErrorState(this.error);
}

class PaymentRequestTokenSuccessState  extends PaymentStates{}
class PaymentRequestTokenErrorState  extends PaymentStates{
  var error;
  PaymentRequestTokenErrorState(this.error);
}

class PaymentRequestTokenKioskSuccessState  extends PaymentStates{}
class PaymentRequestTokenKioskErrorState  extends PaymentStates{
  var error;
  PaymentRequestTokenKioskErrorState(this.error);
}

class PaymentRefCodeSuccessState  extends PaymentStates{}
class PaymentRefCodeErrorState  extends PaymentStates{
  var error;
  PaymentRefCodeErrorState(this.error);
}