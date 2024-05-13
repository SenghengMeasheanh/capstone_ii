import 'package:flutter/cupertino.dart';

// * Navigator Key
final navigatorKey = GlobalKey<NavigatorState>();

// * Get Current Context
BuildContext get getCurrentContext => navigatorKey.currentState!.context;

// * Navigator Utils
extension NavigatorUtils on BuildContext {
  Future<T?> push<T>({
    BuildContext? context,
    required Widget destination,
    bool rootNavigator = true,
  }) {
    return Navigator.of(context ?? this, rootNavigator: rootNavigator).push<T>(
      CupertinoPageRoute<T>(builder: (_) => destination),
    );
  }

  Future<void> pushReplaceTo<T>({
    BuildContext? context,
    required Widget destination,
    bool rootNavigator = true,
  }) {
    return Navigator.of(context ?? this, rootNavigator: rootNavigator).pushReplacement(
      CupertinoPageRoute(builder: (_) => destination),
    );
  }

  Future<void> go({
    BuildContext? context,
    required Widget destination,
    bool rootNavigator = false,
  }) {
    return Navigator.of(context ?? this, rootNavigator: rootNavigator).pushAndRemoveUntil(
      CupertinoPageRoute(builder: (_) => destination),
      (route) => false,
    );
  }

  bool canPop({
    BuildContext? context,
    bool rootNavigator = false,
  }) {
    return Navigator.of(context ?? this, rootNavigator: rootNavigator).canPop();
  }

  void pop({
    BuildContext? context,
    dynamic result,
  }) {
    return canPop(context: context) ? Navigator.of(context ?? this).pop(result) : null;
  }

  // * For Modal
  bool isCurrentStateShowing({
    BuildContext? context,
  }) {
    return ModalRoute.of(context ?? this)!.isCurrent;
  }
}

// * Modal Utils
mixin ModalUtilsMixin {
  void dismiss({
    BuildContext? context,
    dynamic result,
  }) {
    // * Init Context
    context ??= getCurrentContext;
    // * Return Pop
    return context.pop(context: context, result: result);
  }
}
