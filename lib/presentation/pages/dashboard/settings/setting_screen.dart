import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                        imageUrl:
                            'https://www.nme.com/wp-content/uploads/2016/09/2015Eminem_GettyImages-187596325020615.jpg',
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
                            Text('Eminem', style: CustomTextStyle.largeTitleTextStyle(bold: true)),
                            Text('CADT', style: CustomTextStyle.bodyTextStyle()),
                          ],
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
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
                      title: Text('Change Language', style: CustomTextStyle.bodyTextStyle()),
                      onTap: () => LanguagePickerBottomSheet().show(),
                    ),
                    // * Rate Us
                    _buildListTileWithDivider(
                      leading: const Icon(Icons.star, color: primaryColor),
                      title: Text('Rate Us', style: CustomTextStyle.bodyTextStyle()),
                      onTap: () {},
                    ),
                    // * Share App
                    _buildListTileWithDivider(
                      leading: const Icon(Icons.share, color: primaryColor),
                      title: Text('Share App', style: CustomTextStyle.bodyTextStyle()),
                      onTap: () {},
                    ),
                    // * Privacy Policy
                    _buildListTileWithDivider(
                      leading: const Icon(Icons.privacy_tip, color: primaryColor),
                      title: Text('Privacy Policy', style: CustomTextStyle.bodyTextStyle()),
                      onTap: () {},
                      trailing: const Icon(Icons.arrow_forward_ios, color: primaryColor),
                    ),
                    // * Terms and Conditions
                    _buildListTileWithDivider(
                      leading: const Icon(Icons.description, color: primaryColor),
                      title: Text('Terms and Conditions', style: CustomTextStyle.bodyTextStyle()),
                      onTap: () {},
                      trailing: const Icon(Icons.arrow_forward_ios, color: primaryColor),
                    ),
                    // * Log out
                    _buildListTileWithDivider(
                      leading: const Icon(Icons.logout, color: Colors.red),
                      title: Text('Log out', style: CustomTextStyle.bodyTextStyle(color: Colors.red)),
                      onTap: () {},
                    ),
                  ],
                ),
              )
            ],
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
