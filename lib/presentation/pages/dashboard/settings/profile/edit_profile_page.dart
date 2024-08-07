import 'dart:convert';
import 'dart:io';

import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/logic/logic_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // * Form Key
  final _formKey = GlobalKey<FormState>();
  // * Text Controllers
  final _fullNameTextController = TextEditingController();
  final _currentUniversityTextController = TextEditingController();
  final _majorTextController = TextEditingController();
  final _highSchoolNameTextController = TextEditingController();
  final _highSchoolGradeTextController = TextEditingController();
  final _highSchoolGraduationYearTextController = TextEditingController();
  final _universityGraduationYearTextController = TextEditingController();
  final _phoneNumberTextController = TextEditingController();
  final _genderTextController = TextEditingController();
  final _dateOfBirthTextController = TextEditingController();
  final _countryTextController = TextEditingController();
  final _religionTextController = TextEditingController();
  final _nationalityTextController = TextEditingController();
  final _addressTextController = TextEditingController();

  // * User ID
  late int _userId;

  // * Saved Photo Path & Picked Date
  String? _photoPath;
  DateTime? _savedPickedDate;
  String? _imageProfile;

  // * Country
  Country? _country;

  // * Progress Dialog
  final _progressDialog = ProgressDialog();

  // * Initial values to track changes
  late Map<String, String?> _initialValues;

  @override
  void initState() {
    super.initState();
    // * Get User Info
    _getUserInfo();
    // * Init Initial Values
    // * Store initial values
    _initialValues = {
      'fullName': _fullNameTextController.text,
      'currentUniversity': _currentUniversityTextController.text,
      'universityGraduationYear': _universityGraduationYearTextController.text,
      'highSchoolName': _highSchoolNameTextController.text,
      'major': _majorTextController.text,
      'highSchoolGrade': _highSchoolGradeTextController.text,
      'highSchoolGraduationYear': _highSchoolGraduationYearTextController.text,
      'address': _addressTextController.text,
      'phoneNumber': _phoneNumberTextController.text,
      'religion': _religionTextController.text,
      'nationality': _nationalityTextController.text,
      'gender': _genderTextController.text,
      'dateOfBirth': _dateOfBirthTextController.text,
      'country': _countryTextController.text,
    };
    // * Listen to text changes
    _listenToTextChanges();
  }

  @override
  void dispose() {
    super.dispose();
    // * Dispose Text Controllers
    _fullNameTextController.dispose();
    _currentUniversityTextController.dispose();
    _phoneNumberTextController.dispose();
    _dateOfBirthTextController.dispose();
    _countryTextController.dispose();
    _genderTextController.dispose();
    _majorTextController.dispose();
    _highSchoolNameTextController.dispose();
    _highSchoolGradeTextController.dispose();
    _highSchoolGraduationYearTextController.dispose();
    _universityGraduationYearTextController.dispose();
    _religionTextController.dispose();
    _nationalityTextController.dispose();
    _addressTextController.dispose();
  }

  // * Get User Info
  void _getUserInfo() {
    // * Init User Info
    _userId = AppPreference.getUser?.id ?? 0;
    _fullNameTextController.text = AppPreference.getUser?.name ?? '';
    _currentUniversityTextController.text = AppPreference.getUser?.universityName ?? '';
    _universityGraduationYearTextController.text = AppPreference.getUser?.universityGraduationYear != null
        ? AppPreference.getUser!.universityGraduationYear.toString()
        : '';
    _highSchoolNameTextController.text = AppPreference.getUser?.highSchoolName ?? '';
    _majorTextController.text = AppPreference.getUser?.universityMajor ?? '';
    _highSchoolGradeTextController.text = AppPreference.getUser?.highSchoolGrade ?? '';
    _highSchoolGraduationYearTextController.text = AppPreference.getUser?.highSchoolGraduationYear != null
        ? AppPreference.getUser!.highSchoolGraduationYear.toString()
        : '';
    _addressTextController.text = AppPreference.getUser?.address ?? '';
    _phoneNumberTextController.text = AppPreference.getUser?.phoneNumber ?? '';
    _religionTextController.text = AppPreference.getUser?.religion ?? '';
    _nationalityTextController.text = AppPreference.getUser?.nationality ?? '';
    _genderTextController.text = AppPreference.getUser?.gender ?? '';
    _dateOfBirthTextController.text = AppPreference.getUser?.birthday ?? '';
    _countryTextController.text = AppPreference.getUser?.country ?? '';
    // * Init Default Value
    _photoPath = null;
  }

  // * Check for changes in the text fields
  void _checkForChanges() {
    setState(() {});
  }

  // * Check if any field has changed
  bool _hasChanges() {
    return _initialValues['fullName'] != _fullNameTextController.text ||
        _initialValues['currentUniversity'] != _currentUniversityTextController.text ||
        _initialValues['universityGraduationYear'] != _universityGraduationYearTextController.text ||
        _initialValues['highSchoolName'] != _highSchoolNameTextController.text ||
        _initialValues['major'] != _majorTextController.text ||
        _initialValues['highSchoolGrade'] != _highSchoolGradeTextController.text ||
        _initialValues['highSchoolGraduationYear'] != _highSchoolGraduationYearTextController.text ||
        _initialValues['address'] != _addressTextController.text ||
        _initialValues['phoneNumber'] != _phoneNumberTextController.text ||
        _initialValues['religion'] != _religionTextController.text ||
        _initialValues['nationality'] != _nationalityTextController.text ||
        _initialValues['gender'] != _genderTextController.text ||
        _initialValues['dateOfBirth'] != _dateOfBirthTextController.text ||
        _initialValues['country'] != _countryTextController.text ||
        _photoPath != null;
  }

  // * Listen to text changes
  void _listenToTextChanges() {
    _fullNameTextController.addListener(_checkForChanges);
    _currentUniversityTextController.addListener(_checkForChanges);
    _universityGraduationYearTextController.addListener(_checkForChanges);
    _highSchoolNameTextController.addListener(_checkForChanges);
    _majorTextController.addListener(_checkForChanges);
    _highSchoolGradeTextController.addListener(_checkForChanges);
    _highSchoolGraduationYearTextController.addListener(_checkForChanges);
    _addressTextController.addListener(_checkForChanges);
    _phoneNumberTextController.addListener(_checkForChanges);
    _religionTextController.addListener(_checkForChanges);
    _nationalityTextController.addListener(_checkForChanges);
    _genderTextController.addListener(_checkForChanges);
    _dateOfBirthTextController.addListener(_checkForChanges);
    _countryTextController.addListener(_checkForChanges);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        // * Dismiss Progress Dialog If Showing
        if (_progressDialog.isShowing) _progressDialog.dismiss();
        // * Request Update Profile Success
        if (state is RequestUpdateProfileSuccessState) {
          // * Request User Profile
          context.read<AuthBloc>().add(RequestProfileEvent(id: _userId));
          // * Return
          return;
        }
        // * Request User Profile Success
        if (state is RequestProfileSuccessState) {
          // * Get User Info
          _getUserInfo();
          // * Show Success Snack Bar
          context.showSuccessSnackBar(msg: tr(LocaleKeys.your_profile_has_been_updated));
          // * Push Replacement to Profile Page
          context.pushReplaceTo(destination: const ProfilePage()).then((value) {
            setState(() {});
          });
          // * Return
          return;
        }
        // ! Request Update Profile Error
        if (state is RequestUpdateProfileErrorState) {
          // ! Show Snack Bar
          context.showInfoSnackBar(msg: state.message);
          // * Return
          return;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () => context.pushReplaceTo(destination: const ProfilePage()),
            child: const Icon(Icons.arrow_back),
          ),
          centerTitle: true,
          elevation: 0,
          title: Text(
            tr(LocaleKeys.edit_profile),
          ),
          actions: [
            // * Save Button
            Visibility(
              visible: _hasChanges(),
              child: TextButton(
                onPressed: () => _onUpdateProfile(),
                child: Text(
                  tr(LocaleKeys.save),
                  style: CustomTextStyle.buttonTextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(Dimen.contentPadding),
              child: Column(
                children: [
                  // * Profile & Image Picker
                  Align(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        // * Profile
                        CustomCachedNetworkImage(
                          imageUrl: AppPreference.getUser!.imageProfile ?? '',
                          config: CustomCachedNetworkImageConfig(
                            imageProvider: _photoPath != null ? FileImage(File(_photoPath!)) : null,
                            width: 125,
                            height: 125,
                            boxFit: BoxFit.cover,
                            border: Border.all(color: primaryColor, width: 2),
                            borderRadius: BorderRadius.circular(75),
                            isProfile: true,
                          ),
                        ),
                        // * Image Picker
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: GestureDetector(
                            onTap: () => ImagePickerBottomSheet().show(
                              onCameraPicked: () => _onImagePickedTap(source: ImageSource.camera),
                              onGalleryPicked: () => _onImagePickedTap(source: ImageSource.gallery),
                            ),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: primaryColor),
                              ),
                              child: const Icon(Icons.camera_alt_outlined, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // * Full Name Text Field
                  IsRequiredTitle(
                    title: Text(tr(LocaleKeys.fullname)),
                    required: true,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: Dimen.smallSpace),
                    child: TextFormField(
                      controller: _fullNameTextController,
                      keyboardType: TextInputType.name,
                      onChanged: (v) => setState(() {}),
                      validator: (v) => Validator.validateEmptyField(v),
                      decoration: InputDecoration(
                        isDense: true,
                        border: const OutlineInputBorder(),
                        hintText: tr(LocaleKeys.enter_full_name),
                      ),
                    ),
                  ),
                  // * University Section
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(top: Dimen.largeSpace),
                    child: Text(
                      tr(LocaleKeys.university),
                      style: CustomTextStyle.titleTextStyle(color: primaryColor, bold: true),
                    ),
                  ),
                  // * Current University Text Field
                  IsRequiredTitle(
                    margin: const EdgeInsets.only(top: Dimen.largeSpace),
                    title: Text(tr(LocaleKeys.current_university)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: Dimen.smallSpace),
                    child: TextFormField(
                      controller: _currentUniversityTextController,
                      keyboardType: TextInputType.name,
                      onChanged: (v) => setState(() {}),
                      decoration: InputDecoration(
                        isDense: true,
                        border: const OutlineInputBorder(),
                        hintText: tr(LocaleKeys.enter_current_university),
                      ),
                    ),
                  ),
                  // * University Graduation Year Text Field
                  IsRequiredTitle(
                    margin: const EdgeInsets.only(top: Dimen.largeSpace),
                    title: Text(tr(LocaleKeys.university_graduation_year)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: Dimen.smallSpace),
                    child: TextFormField(
                      controller: _universityGraduationYearTextController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (v) => setState(() {}),
                      decoration: InputDecoration(
                        isDense: true,
                        border: const OutlineInputBorder(),
                        hintText: tr(LocaleKeys.enter_university_graduation_year),
                      ),
                    ),
                  ),
                  // * Major Text Field
                  IsRequiredTitle(
                    margin: const EdgeInsets.only(top: Dimen.largeSpace),
                    title: Text(tr(LocaleKeys.major)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: Dimen.smallSpace),
                    child: TextFormField(
                      controller: _majorTextController,
                      keyboardType: TextInputType.name,
                      onChanged: (v) => setState(() {}),
                      decoration: InputDecoration(
                        isDense: true,
                        border: const OutlineInputBorder(),
                        hintText: tr(LocaleKeys.enter_major),
                      ),
                    ),
                  ),
                  // *High School Section
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(top: Dimen.largeSpace),
                    child: Text(
                      tr(LocaleKeys.highschool),
                      style: CustomTextStyle.titleTextStyle(color: primaryColor, bold: true),
                    ),
                  ),
                  // * High School Name Text Field
                  IsRequiredTitle(
                    margin: const EdgeInsets.only(top: Dimen.largeSpace),
                    title: Text(tr(LocaleKeys.highschool)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: Dimen.smallSpace),
                    child: TextFormField(
                      controller: _highSchoolNameTextController,
                      keyboardType: TextInputType.name,
                      onChanged: (v) => setState(() {}),
                      decoration: InputDecoration(
                        isDense: true,
                        border: const OutlineInputBorder(),
                        hintText: tr(LocaleKeys.enter_high_school_name),
                      ),
                    ),
                  ),
                  // * High School Graduation Year Text Field
                  IsRequiredTitle(
                    margin: const EdgeInsets.only(top: Dimen.largeSpace),
                    title: Text(tr(LocaleKeys.high_school_graduation_year)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: Dimen.smallSpace),
                    child: TextFormField(
                      controller: _highSchoolGraduationYearTextController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (v) => setState(() {}),
                      decoration: InputDecoration(
                        isDense: true,
                        border: const OutlineInputBorder(),
                        hintText: tr(LocaleKeys.enter_high_school_graduation_year),
                      ),
                    ),
                  ),
                  // * High School Grade Text Field
                  IsRequiredTitle(
                    margin: const EdgeInsets.only(top: Dimen.largeSpace),
                    title: Text(tr(LocaleKeys.high_school_grade)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: Dimen.smallSpace),
                    child: TextFormField(
                      controller: _highSchoolGradeTextController,
                      keyboardType: TextInputType.name,
                      onChanged: (v) => setState(() {}),
                      decoration: InputDecoration(
                        isDense: true,
                        border: const OutlineInputBorder(),
                        hintText: tr(LocaleKeys.enter_high_school_grade),
                      ),
                    ),
                  ),
                  // * Personal Information Section
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(top: Dimen.largeSpace),
                    child: Text(
                      tr(LocaleKeys.personal_information),
                      style: CustomTextStyle.titleTextStyle(color: primaryColor, bold: true),
                    ),
                  ),
                  // * Gender Text Field
                  IsRequiredTitle(
                    margin: const EdgeInsets.only(top: Dimen.largeSpace),
                    title: Text(
                      tr(LocaleKeys.gender),
                    ),
                    required: true,
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: Dimen.defaultSpace),
                      child: TextFormField(
                        readOnly: true,
                        validator: (value) => Validator.validateEmptyField(value),
                        controller: _genderTextController,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: tr(LocaleKeys.select_gender),
                          suffixIcon: PopupMenuButton(
                            icon: const Icon(Icons.arrow_drop_down),
                            onSelected: (value) => {_genderTextController.text = value},
                            itemBuilder: (context) => Gender.values
                                .map(
                                  (e) => PopupMenuItem<String>(
                                    value: getGender(value: e),
                                    child: Row(
                                      children: [
                                        Icon(getIcon(value: e)),
                                        Text(
                                          getGender(value: e),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      )),
                  // * Date of Birth Text Field
                  IsRequiredTitle(
                    margin: const EdgeInsets.only(top: Dimen.largeSpace),
                    title: Text(tr(LocaleKeys.birthday)),
                    required: true,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: Dimen.smallSpace),
                    child: TextFormField(
                      controller: _dateOfBirthTextController,
                      keyboardType: TextInputType.datetime,
                      readOnly: true,
                      onTap: () => _onSelectDateOfBirthTap(),
                      validator: (value) => Validator.validateEmptyField(value),
                      onChanged: (v) => setState(() {}),
                      decoration: InputDecoration(
                        isDense: true,
                        border: const OutlineInputBorder(),
                        hintText: tr(LocaleKeys.select_birthday),
                        suffixIcon: const Icon(Icons.date_range_outlined, size: 24),
                      ),
                    ),
                  ),
                  // * Religion Text Field
                  IsRequiredTitle(
                    margin: const EdgeInsets.only(top: Dimen.largeSpace),
                    title: Text(tr(LocaleKeys.religion)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: Dimen.smallSpace),
                    child: TextFormField(
                      controller: _religionTextController,
                      keyboardType: TextInputType.text,
                      onChanged: (v) => setState(() {}),
                      decoration: InputDecoration(
                        isDense: true,
                        border: const OutlineInputBorder(),
                        hintText: tr(LocaleKeys.enter_religion),
                      ),
                    ),
                  ),
                  // * Nationality Text Field
                  IsRequiredTitle(
                    margin: const EdgeInsets.only(top: Dimen.largeSpace),
                    title: Text(
                      tr(LocaleKeys.nationality),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: Dimen.smallSpace),
                    child: TextFormField(
                      controller: _nationalityTextController,
                      keyboardType: TextInputType.text,
                      onChanged: (v) => setState(() {}),
                      decoration: InputDecoration(
                        isDense: true,
                        border: const OutlineInputBorder(),
                        hintText: tr(LocaleKeys.enter_nationality),
                      ),
                    ),
                  ),
                  // * Contact Information Section
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(top: Dimen.largeSpace),
                    child: Text(
                      tr(LocaleKeys.contact_info),
                      style: CustomTextStyle.titleTextStyle(color: primaryColor, bold: true),
                    ),
                  ),

                  // * Country Text Field
                  IsRequiredTitle(
                    margin: const EdgeInsets.only(top: Dimen.largeSpace),
                    title: Text(tr(LocaleKeys.country)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: Dimen.smallSpace),
                    child: TextFormField(
                      controller: _countryTextController,
                      keyboardType: TextInputType.text,
                      readOnly: true,
                      onTap: () => _onSelectCountryTap(),
                      onChanged: (v) => setState(() {}),
                      decoration: InputDecoration(
                        isDense: true,
                        border: const OutlineInputBorder(),
                        hintText: tr(LocaleKeys.select_country),
                        suffixIcon: const Icon(Icons.arrow_drop_down_outlined, size: 24),
                      ),
                    ),
                  ),

                  // * Phone Number Text Field
                  IsRequiredTitle(
                    margin: const EdgeInsets.only(top: Dimen.largeSpace),
                    title: Text(tr(LocaleKeys.phone_number)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: Dimen.smallSpace),
                    child: TextFormField(
                      controller: _phoneNumberTextController,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
                      onChanged: (v) => setState(() {}),
                      decoration: InputDecoration(
                        isDense: true,
                        border: const OutlineInputBorder(),
                        hintText: tr(LocaleKeys.enter_phone_number),
                      ),
                    ),
                  ),
                  // * Address Text Field
                  IsRequiredTitle(
                    margin: const EdgeInsets.only(top: Dimen.largeSpace),
                    title: Text(tr(LocaleKeys.address)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: Dimen.smallSpace),
                    child: TextFormField(
                      controller: _addressTextController,
                      keyboardType: TextInputType.text,
                      onChanged: (v) => setState(() {}),
                      decoration: InputDecoration(
                        isDense: true,
                        border: const OutlineInputBorder(),
                        hintText: tr(LocaleKeys.enter_address),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onSelectCountryTap() {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      favorite: ['KH'],
      countryListTheme: CountryListThemeData(
        bottomSheetHeight: 400,
        inputDecoration: InputDecoration(
          hintText: tr(LocaleKeys.search),
          prefixIcon: const Icon(Icons.search),
          border: const OutlineInputBorder(),
        ),
      ),
      onSelect: (country) {
        // * Set Country
        _country = country;
        // * Set Country Text
        _countryTextController.text = country.name;
      },
    );
  }

  Future<void> _onSelectDateOfBirthTap() async {
    // * Await Show Date Picker
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _savedPickedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    // * If Picked Date Not Equal Null
    if (pickedDate != null) {
      // * Save Picked Date
      _savedPickedDate = pickedDate;
      // * Set Picked Date
      _dateOfBirthTextController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
  }

  Future<void> _onImagePickedTap({
    required ImageSource source,
  }) async {
    // * Await Pick Image
    final photo = await ImagePicker().pickImage(source: source);
    // * If Photo Not Null
    if (photo != null) {
      // * Await Crop Image
      _photoPath = await cropImage(sourcePath: photo.path);
      // * Convert the cropped image to base64
      Uint8List bytes = await File(_photoPath!).readAsBytes();
      final base64 = base64Encode(bytes);
      // * Cropped Image Extension
      final photoPathextension = p.extension(_photoPath!).replaceAll('.', '');
      // * Set Image Profile
      _imageProfile = 'data:image/$photoPathextension;base64,$base64';
      // * Notify
      setState(() {});
    }
  }

  void _onUpdateProfile() {
    // * If Validate Fail [Return]
    if (!_formKey.currentState!.validate()) return;
    // * Show Progress Dialog
    _progressDialog.show();
    // * Init Profile Update Request
    final profileUpdateRequest = ProfileUpdateRequest(
      name: _fullNameTextController.text,
      universityName: _currentUniversityTextController.text,
      universityMajor: _majorTextController.text,
      universityGraduationYear: int.parse(_universityGraduationYearTextController.text),
      highSchoolName: _highSchoolNameTextController.text,
      highSchoolGrade: _highSchoolGradeTextController.text,
      highSchoolGraduationYear: int.parse(_highSchoolGraduationYearTextController.text),
      birthday: _dateOfBirthTextController.text,
      gender: _genderTextController.text,
      country: _countryTextController.text,
      religion: _religionTextController.text,
      nationality: _nationalityTextController.text,
      address: _addressTextController.text,
      phoneNumber: _phoneNumberTextController.text,
      imageProfile: _imageProfile ?? AppPreference.getUser!.imageProfile,
    );
    // * Request Update Profile
    context
        .read<AuthBloc>()
        .add(RequestUpdateProfileEvent(id: _userId, profileUpdateRequest: profileUpdateRequest));
  }
}
