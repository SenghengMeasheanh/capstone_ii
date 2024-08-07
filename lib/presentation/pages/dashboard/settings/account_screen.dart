import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  // * Variable
  late String _fullname;

  // * Others
  var _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  // * Init State
  @override
  void initState() {
    super.initState();
    // * Get User Info
    setState(() {
      _getUserInfo();
    });
    // * Init Package Info
    _initPackageInfo();
  }

  // * Get User Info
  void _getUserInfo() {
    // * Get User Info
    _fullname = AppPreference.getUser?.name ?? tr(LocaleKeys.welcome);
  }

  Future<void> _initPackageInfo() async {
    // * Init Package Info
    final info = await PackageInfo.fromPlatform();
    // * Notify
    setState(
      () => _packageInfo = info,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: Dimen.defaultSpace),
            child: Column(
              children: [
                // * Profile Image
                Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(Dimen.mediumSpace),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomCachedNetworkImage(
                          onTap: () => context.push(destination: const ProfilePage()),
                          imageUrl: AppPreference.getUser?.imageProfile ?? '',
                          config: CustomCachedNetworkImageConfig(
                            height: 73,
                            width: 73,
                            isProfile: true,
                            boxFit: BoxFit.cover,
                            border: Border.all(
                              color: primaryColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(36.5),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: Dimen.mediumSpace),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(_fullname, style: CustomTextStyle.largeTitleTextStyle(bold: true)),
                              isSignedIn()
                                  ? Text(AppPreference.getUser?.universityName ?? '',
                                      style: CustomTextStyle.bodyTextStyle())
                                  : InkWell(
                                      onTap: () => context.push(destination: const SignInPage()),
                                      child: Text(
                                        tr(LocaleKeys.sign_in),
                                        style: CustomTextStyle.bodyTextStyle(color: primaryColor),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        if (isSignedIn())
                          IconButton(
                            onPressed: () => context.push(destination: const ProfilePage()),
                            icon: const Icon(
                              Icons.edit,
                              color: primaryColor,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                // * Settings Menu
                Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // * Change Language
                      _buildListTileWithDivider(
                        leading: const Icon(Icons.language, color: primaryColor),
                        title: Text(tr(LocaleKeys.change_language), style: CustomTextStyle.bodyTextStyle()),
                        onTap: () => LanguagePickerBottomSheet().show().then((_) => {setState(() {})}),
                      ),
                      // * Rate Us
                      _buildListTileWithDivider(
                        leading: const Icon(Icons.star, color: primaryColor),
                        title: Text(tr(LocaleKeys.rate_us), style: CustomTextStyle.bodyTextStyle()),
                        onTap: () {},
                      ),
                      // * Share App
                      _buildListTileWithDivider(
                        leading: const Icon(Icons.share, color: primaryColor),
                        title: Text(tr(LocaleKeys.share_app), style: CustomTextStyle.bodyTextStyle()),
                        onTap: () {},
                      ),
                      // * Privacy Policy
                      Visibility(
                        child: _buildListTileWithDivider(
                          leading: const Icon(Icons.privacy_tip, color: primaryColor),
                          title: Text(tr(LocaleKeys.privacy_policy), style: CustomTextStyle.bodyTextStyle()),
                          onTap: () => context.push(
                            destination: StaticPagesPage(
                              alias: 'privacy_policy',
                              title: tr(LocaleKeys.privacy_policy),
                            ),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios, color: primaryColor),
                        ),
                      ),
                      // * Terms and Conditions
                      Visibility(
                        child: _buildListTileWithDivider(
                          leading: const Icon(Icons.description, color: primaryColor),
                          title: Text(tr(LocaleKeys.terms_and_conditions), style: CustomTextStyle.bodyTextStyle()),
                          onTap: () => context.push(
                            destination: StaticPagesPage(
                              alias: 'term_condition',
                              title: tr(LocaleKeys.terms_and_conditions),
                            ),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios, color: primaryColor),
                        ),
                      ),
                      // * About Us
                      _buildListTileWithDivider(
                        leading: const Icon(Icons.info, color: primaryColor),
                        title: Text(tr(LocaleKeys.about_us), style: CustomTextStyle.bodyTextStyle()),
                        onTap: () => context.push(
                          destination: StaticPagesPage(
                            alias: 'about_us',
                            title: tr(LocaleKeys.about_us),
                          ),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios, color: primaryColor),
                      ),
                      // * Log out
                      Visibility(
                        visible: isSignedIn(),
                        child: _buildListTileWithDivider(
                          leading: const Icon(Icons.logout, color: Colors.red),
                          title: Text(tr(LocaleKeys.log_out),
                              style: CustomTextStyle.bodyTextStyle(color: Colors.red)),
                          onTap: () => InfoDialog().show(
                            title: tr(LocaleKeys.log_out_of_account),
                            message: tr(LocaleKeys.to_see_it_again_log_back_in_to_your_account),
                            positiveBtnText: tr(LocaleKeys.log_out),
                            positiveBtnBgColor: Colors.red,
                            onPositiveTap: () => clearAndRestart(),
                          ),
                        ),
                      ),
                      // * App Logo
                      Container(
                        margin: const EdgeInsets.only(top: Dimen.mediumSpace),
                        child: Image.asset(
                          Assets.imageSmallLogo,
                          height: 70,
                          width: 70,
                          color: Colors.grey,
                          filterQuality: FilterQuality.high,
                          colorBlendMode: BlendMode.srcIn,
                          isAntiAlias: true,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // * App Version
                      Container(
                        child: Text(
                          '${tr(LocaleKeys.version)} ${_packageInfo.version}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListTileWithDivider({
    required Widget leading,
    required Widget title,
    required Function() onTap,
    Widget? trailing,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: Dimen.mediumSpace, horizontal: Dimen.extraLargeSpace),
          onTap: onTap,
          leading: leading,
          title: title,
          trailing: trailing,
        ),
        Divider(
          height: 1, // Adjust the height as needed
          thickness: 1, // Adjust the thickness as needed
          indent: 80,
          endIndent: 30, // Start the divider with some indentation// End the divider with some indentation
          color: Colors.grey.shade200, // Customize the divider color
        ),
      ],
    );
  }
}
