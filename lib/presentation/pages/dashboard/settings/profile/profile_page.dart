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
  late String _email;
  late String _university;
  late String _universityGraduationYear;
  late String _universityMajor;
  late String _highSchool;
  late String _highSchoolGraduationYear;
  late String _highSchoolGrade;
  late String _religion;
  late String _phoneNumber;
  late String _address;
  late String _country;
  late String _nationality;
  late String _gender;
  late String _birthday;
  late String _imageProfile;

  // * Init State
  @override
  void initState() {
    super.initState();
    // * Get User Info
    setState(() {
      _getUserInfo();
    });
  }

  // * Get User Info
  void _getUserInfo() {
    // * Get User Info
    _fullname = AppPreference.getUser!.name;
    _university = AppPreference.getUser?.universityName ?? '__';
    _universityGraduationYear = AppPreference.getUser?.universityGraduationYear != null
        ? AppPreference.getUser!.universityGraduationYear.toString()
        : '__';
    _universityMajor = AppPreference.getUser?.universityMajor ?? '__';
    _highSchool = AppPreference.getUser?.highSchoolName ?? '__';
    _highSchoolGraduationYear = AppPreference.getUser?.highSchoolGraduationYear != null
        ? AppPreference.getUser!.highSchoolGraduationYear.toString()
        : '__';
    _highSchoolGrade = AppPreference.getUser?.highSchoolGrade ?? '__';
    _religion = AppPreference.getUser?.religion ?? '__';
    _phoneNumber = AppPreference.getUser?.phoneNumber ?? '__';
    _address = AppPreference.getUser?.address ?? '__';
    _country = AppPreference.getUser?.country ?? '__';
    _nationality = AppPreference.getUser?.nationality ?? '__';
    _imageProfile = AppPreference.getUser?.imageProfile ?? '__';
    _email = AppPreference.getUser?.email ?? '__';
    _gender = AppPreference.getUser?.gender ?? '__';
    _birthday = AppPreference.getUser?.birthday ?? '__';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.go(destination: const DashboardPage(index: 3)).then((value) => setState(() {})),
          icon: const Icon(Icons.arrow_back),
        ),
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
                      imageUrl: _imageProfile,
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
                          Text(_university, style: CustomTextStyle.bodyTextStyle()),
                        ],
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => context.pushReplaceTo(destination: const EditProfilePage()),
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
                    _buildProfileInfo(field: tr(LocaleKeys.current_university), value: _university),
                    _buildProfileInfo(field: tr(LocaleKeys.graduation_year), value: _universityGraduationYear),
                    _buildProfileInfo(field: tr(LocaleKeys.major), value: _universityMajor),
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
                    _buidTitleRow(
                        title: tr(LocaleKeys.highschool),
                        onTap: () => context.pushReplaceTo(destination: const EditProfilePage())),
                    _buildProfileInfo(field: tr(LocaleKeys.highschool), value: _highSchool),
                    _buildProfileInfo(field: tr(LocaleKeys.graduation_year), value: _highSchoolGraduationYear),
                    _buildProfileInfo(field: tr(LocaleKeys.high_school_grade), value: _highSchoolGrade),
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
                    _buidTitleRow(
                        title: tr(LocaleKeys.personal_information),
                        onTap: () => context.pushReplaceTo(destination: const EditProfilePage())),
                    Row(
                      children: [
                        Expanded(child: _buildProfileInfo(field: tr(LocaleKeys.birthday), value: _birthday)),
                        Expanded(child: _buildProfileInfo(field: tr(LocaleKeys.gender), value: _gender)),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: _buildProfileInfo(field: tr(LocaleKeys.religion), value: _religion)),
                        Expanded(child: _buildProfileInfo(field: tr(LocaleKeys.nationality), value: _nationality)),
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
                    _buidTitleRow(
                        title: tr(LocaleKeys.contact_info),
                        onTap: () => context.pushReplaceTo(destination: const EditProfilePage())),
                    _buildProfileInfo(field: tr(LocaleKeys.email), value: _email),
                    _buildProfileInfo(field: tr(LocaleKeys.country), value: _country),
                    _buildProfileInfo(field: tr(LocaleKeys.phone_number), value: _phoneNumber),
                    _buildProfileInfo(field: tr(LocaleKeys.address), value: _address),
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
