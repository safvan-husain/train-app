// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

/// this Bloc handles the UI changes for payment process
///
///make sure this passed on to [PaymentService].
class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentState()) {
    on<PaymentSuccessEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

class PaymentState {}

sealed class PaymentEvent {}

class PaymentSuccessEvent extends PaymentEvent {
  final PaymentSuccessResponse response;
  PaymentSuccessEvent(this.response);
}

class PaymentFailureEvent extends PaymentEvent {}
