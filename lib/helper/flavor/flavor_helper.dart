// * Export Flavor

// ? Local
export 'local/local_flavor.dart';

// ? Production
export 'production/pro_flavor.dart';

// ? QA
export 'qa/qa_flavor.dart';

// * Flavor
class Flavor implements FlavorTemplate {
  // * Init Singleton
  late FlavorTemplate _flavorTemplate;

  Flavor._internal();

  static final instance = Flavor._internal();

  // * Init Flavor
  void init({required FlavorTemplate flavor}) => _flavorTemplate = flavor;

  @override
  String get appName => _flavorTemplate.appName;

  @override
  String get apiURL => _flavorTemplate.apiURL;

  @override
  String get backendURL => _flavorTemplate.backendURL;

  @override
  String get fileURL => _flavorTemplate.fileURL;

  @override
  String get savePaymentCompleteURL => _flavorTemplate.savePaymentCompleteURL;

  @override
  String get checkTransactionURL => _flavorTemplate.checkTransactionURL;

  @override
  String get abaPaymentURL => _flavorTemplate.abaPaymentURL;

  @override
  String get creditPaymentURL => _flavorTemplate.creditPaymentURL;

  @override
  String get discordErrorTrackerChannelId => _flavorTemplate.discordErrorTrackerChannelId;
}

abstract class FlavorTemplate {
// * App Name
  final String appName;

  // * API URL
  final String apiURL;

  // * Backend URL
  final String backendURL;

  // * Image URL
  final String fileURL;

  // * ABA Payment URL
  final String abaPaymentURL;

  // * Credit Payment URL
  final String creditPaymentURL;

  // * Check Transaction URL
  final String checkTransactionURL;

  // * Save Payment Complete
  final String savePaymentCompleteURL;

  // * Discord Log Channel ID
  final String discordErrorTrackerChannelId;

  FlavorTemplate(
    this.appName,
    this.apiURL,
    this.backendURL,
    this.fileURL,
    this.abaPaymentURL,
    this.creditPaymentURL,
    this.discordErrorTrackerChannelId,
    this.checkTransactionURL,
    this.savePaymentCompleteURL,
  );
}
