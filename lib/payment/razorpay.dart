import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:train_app/payment/bloc.dart';
import 'package:dio/dio.dart';
import 'package:train_app/common/global_variables.dart';

class PaymentServices {
  late PaymentBloc bloc;
  static PaymentServices? _instance;
  PaymentServices._internal();

  factory PaymentServices() {
    return _instance ??= PaymentServices._internal();
  }
  final _razorpay = Razorpay();

  void init(PaymentBloc paymentBloc) {
    bloc = paymentBloc;

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void pay(int amount, int orderId) async {
    String? key = await _fetchKey();
    if (key == null) {
      print("Got no raz key");
      return;
    }

    var options = {
      'key': key,
      'amount': "${amount}00", //converting into smallet currency unit.
      'name': 'Starkin Corp.',
      "orderId": orderId,
      'description': 'Ticket booking',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'}
    };
    _razorpay.open(options);
  }

  void dispose() {
    _razorpay.clear();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    bloc.add(PaymentSuccessEvent(response));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }
  Future<String?> _fetchKey() async {
    final Dio dio = Dio();

    final response = await dio.get('${GV.baseURi}/raz-key');
    if (response.statusCode == 200) {
      return response.data['key'];
    }
    print("fetch key status code : %{response.statusCode}");
    return null;
  }
}
