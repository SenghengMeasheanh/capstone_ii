import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LanguagePickerBottomSheet with ModalUtilsMixin {
  // * Variable
  var _isShowing = false;

  // * Show
  Future<T?> show<T>({
    BuildContext? context,
  }) {
    // * Set [isShowing] True
    _isShowing = true;
    // * Build
    return showModalBottomSheet<T>(
      context: context ?? getCurrentContext,
      shape: modalBottomSheetShape,
      showDragHandle: true,
      enableDrag: true,
      builder: (_) => const _LanguagePickerBottomSheet(),
    ).then((result) {
      // * Set [isShowing] False
      _isShowing = false;
      // * Return Result
      return result;
    });
  }

  // * Get Bottom Sheet Showing
  bool get isShowing => _isShowing;
}

class _LanguagePickerBottomSheet extends StatelessWidget with ModalUtilsMixin {
  const _LanguagePickerBottomSheet();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        // * Content
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // * Title & Close Button
            Container(
              margin: const EdgeInsets.symmetric(horizontal: Dimen.mediumSpace),
              child: Text(
                tr(LocaleKeys.change_language),
                style: CustomTextStyle.titleTextStyle(bold: true, fontSize: Dimen.midTitleTextSize),
              ),
            ),
            // * Language Menu
            Padding(
              padding: const EdgeInsets.only(
                left: Dimen.contentPadding,
                right: Dimen.contentPadding,
                bottom: Dimen.contentPadding,
                top: Dimen.mediumSpace,
              ),
              child: Column(
                children: [
                  // * English
                  _LanguageMenu(
                    onTap: (locale) => _onSetLocaleTap(context: context, locale: locale!),
                    locale: LanguageManager.defaultLanguage,
                    iconAssets: Assets.iconFlagEnglish,
                    title: 'English',
                  ),
                  // * Khmer
                  _LanguageMenu(
                    onTap: (locale) => _onSetLocaleTap(context: context, locale: locale!),
                    locale: LanguageManager.khmerLanguage,
                    iconAssets: Assets.iconFlagKhmer,
                    title: 'Khmer',
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _onSetLocaleTap({
    required BuildContext context,
    required Locale locale,
  }) {
    // * Set Locale
    context.setLocale(locale);
    // * Notify In [Dashboard Page]
    languageStreamController.add('locale');
    // * Dismiss Dialog
    dismiss();
  }
}

class _LanguageMenu extends StatelessWidget {
  final void Function(Locale? locale) onTap;
  final Locale locale;
  final String iconAssets;
  final String title;

  const _LanguageMenu({
    required this.onTap,
    required this.locale,
    required this.iconAssets,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.only(bottom: Dimen.mediumSpace),
      child: RadioListTile(
        splashRadius: Dimen.defaultRadius,
        contentPadding: const EdgeInsets.only(left: Dimen.contentPadding, top: Dimen.smallSpace),
        value: locale,
        groupValue: context.locale,
        onChanged: onTap,
        controlAffinity: ListTileControlAffinity.trailing,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // * Flag
            SvgPicture.asset(iconAssets, width: 55, height: 55),
            // * Space
            const SizedBox(width: Dimen.defaultSpace),
            // * Title
            Text(title, style: CustomTextStyle.titleTextStyle()),
          ],
        ),
      ),
    );
  }
}
