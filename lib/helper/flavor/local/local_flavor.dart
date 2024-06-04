import 'package:capstone_ii/helper/helper_export.dart';

class LocalFlavor implements FlavorTemplate {
  @override
  String get appName => 'PathFinder - Local';

  @override
  String get apiURL => 'http://192.168.103.26:5646/rithMonyAppApi';

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
