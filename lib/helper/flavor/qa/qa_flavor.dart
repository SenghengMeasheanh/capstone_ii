import 'package:capstone_ii/helper/helper_export.dart';

class QAFlavor implements FlavorTemplate {
  @override
  String get appName => 'PathFinder - QA';

  @override
  String get apiURL => 'https://finderapi-production.up.railway.app/api_mobile/v01';

  @override
  String get backendURL => '';

  @override
  String get fileURL => '';

  @override
  String get abaPaymentURL => '$backendURL/payments/abaMobilePay';

  @override
  String get creditPaymentURL => '$backendURL/payments/abaVisalPayment';

  @override
  String get checkTransactionURL => '$backendURL/payments/checkAbaTransaction';

  @override
  String get savePaymentCompleteURL => '$backendURL/payments/saveAbaPaymentComplete';

  @override
  String get discordErrorTrackerChannelId => '';
}
