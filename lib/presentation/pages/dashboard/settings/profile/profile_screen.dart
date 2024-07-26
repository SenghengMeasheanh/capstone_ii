import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // * Variable
  late String _fullname;

  // * Init State
  @override
  void initState() {
    super.initState();
    // * Get User Info
    _getUserInfo();
  }

  // * Get User Info
  void _getUserInfo() {
    // * Get User Info
    _fullname = AppPreference.getUser?.name ?? 'Username';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr(LocaleKeys.profile)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimen.mediumSpace),
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
                          Text(_fullname, style: CustomTextStyle.largeTitleTextStyle(bold: true)),
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
            const Divider(),
            Card(
              elevation: 8,
              child: Container(
                margin: const EdgeInsets.only(top: Dimen.extraLargeSpace),
                padding: const EdgeInsets.only(
                    left: Dimen.contentPadding, right: Dimen.contentPadding, bottom: Dimen.extraLargeSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buidTitleRow(title: tr(LocaleKeys.university), onTap: () {}),
                    _buildProfileInfo(field: 'Current University', value: 'CADT'),
                    _buildProfileInfo(field: 'Graduation Year', value: '2025'),
                    _buildProfileInfo(field: 'Major', value: 'Software Engineering'),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimen.contentPadding,
                  vertical: Dimen.extraLargeSpace,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buidTitleRow(title: tr(LocaleKeys.highschool), onTap: () {}),
                    _buildProfileInfo(field: 'High School'),
                    _buildProfileInfo(field: 'Graduation Year', value: '2021'),
                    _buildProfileInfo(field: 'Highschool Grade', value: 'A'),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimen.contentPadding,
                  vertical: Dimen.extraLargeSpace,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buidTitleRow(title: tr(LocaleKeys.personal_information), onTap: () {}),
                    Row(
                      children: [
                        Expanded(child: _buildProfileInfo(field: 'Date of Birth', value: '01/01/2000')),
                        Expanded(child: _buildProfileInfo(field: 'Gender', value: 'Gay')),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: _buildProfileInfo(field: 'Religion', value: 'Buddha')),
                        Expanded(child: _buildProfileInfo(field: 'Nationality', value: 'Cambodian')),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Card(
              elevation: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimen.contentPadding,
                  vertical: Dimen.extraLargeSpace,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buidTitleRow(title: tr(LocaleKeys.contact_info), onTap: () {}),
                    _buildProfileInfo(field: 'Email', value: 'piseybekbek@gmail.com'),
                    _buildProfileInfo(field: 'Country', value: 'Cambodia'),
                    _buildProfileInfo(field: 'Phone Number', value: '012345678'),
                    _buildProfileInfo(field: 'Address', value: 'Phnom Penh'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: Dimen.extraLargeSpace),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfo({
    required String field,
    String? value,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: Dimen.largeSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$field:', style: CustomTextStyle.bodyTextStyle(bold: true)),
          Container(
            margin: const EdgeInsets.only(top: Dimen.smallSpace),
            child: Text(value ?? '__', style: CustomTextStyle.bodyTextStyle()),
          ),
        ],
      ),
    );
  }

  Widget _buidTitleRow({
    required String title,
    required Function() onTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: CustomTextStyle.titleTextStyle(bold: true, color: primaryColor)),
        IconButton(
          onPressed: onTap,
          icon: const Icon(
            Icons.edit,
            color: primaryColor,
          ),
        ),
      ],
    );
  }
}
