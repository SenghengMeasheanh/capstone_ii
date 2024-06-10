import 'package:capstone_ii/helper/helper_export.dart';

class PROFlavor implements FlavorTemplate {
  @override
  String get appName => 'PathFinder';

  @override
  String get apiURL => 'https://finderapi-production.up.railway.app/api_mobile/v01';

  @override
  String get backendURL => '';

  @override
  String get fileURL => '';

  @override
  String get abaPaymentURL => '';

  @override
  String get creditPaymentURL => '';

  @override
  String get checkTransactionURL => '';

  @override
  String get savePaymentCompleteURL => '';

  @override
  String get discordErrorTrackerChannelId => '';
}
