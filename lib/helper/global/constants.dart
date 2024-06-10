// * Onesignal App ID

const oneSignalAppId = '9381dfbb-c5fa-400d-9fa6-1c9a2e3eacc3';

// * ABA Payment
const abaOpenCheckOut = 'abamobilebank://ababank.com?type=payway&qrcode';
const abaCloseCheckOut = 'closecheckout://ababank.com';

// // * Privacy Policy
// final privacyPolicyURL = getWebViewURL(data: 'privacy-policy-en');
// final privacyPolicyURLKh = getWebViewURL(data: 'privacy-policy-kh');
// final  privacyPolicyURLCn = getWebViewURL(data: 'privacy-policy-cn');

// // * Terms and Conditions
// final termsAndConditionsURL = getWebViewURL(data: 'terms-and-conditions-en');
// final termsAndConditionsURLKh = getWebViewURL(data: 'terms-and-conditions-kh');
// final termsAndConditionsURLCn = getWebViewURL(data: 'terms-and-conditions-cn');

// * Authentication Type
enum AuthType { forget, signup }

// * Customer Service Type
enum CustomerServiceType { none, text, telephone, email, website }

// * Payment Method
enum PaymentMethod { none, aba, card }

// * Gender
enum Gender { male, female }

// * Menu
enum Menu { university, career, forum, events, guides, collegeQuiz, scholarships, financialAid, compareColleges }

// * University Filter Menu
enum UniversityFilterMenu { major, type, degree, location }

// * Event Filter Menu
enum EventFilterMenu {
  upcoming,
  past,
  favorite,
  // Add more filters as needed
}

// * Others
const pageSize = 10;
