# capstone_ii

Please read and follow the rule if you are able to help me.

### Project Setup
run this command after clone the project

```cmd
    flutter pub get
```

### Coding Rules
+ **Rule 1**: Please Comment when you are coding. the comment must shortly describe your code. For Example:
```dart
   // * Caculate Sum Value
   void caculateSum(){
    // * Code
   }
```
*Note**: 
    + For success code, success message or general code use comment like this // * Caculate Sum value
    + For fail message or error message use comment like this // ! Failed messages

+ **Rule 2**: When adding a package or library please do not add it with command. Rather, please go to copy the package name instead.

+ **Rule 3**: When pasting the library name please also comment and also arrange it in alphabetical order.

+ **Rule 4**: In the export files, please arrange the exported path in alphabetical order. this also apply when declaring variable.

+ **Rule 5**: For file naming convienence, please naming follow how I  naming other file

+ **Rule 6**: Follow the folder structure. :smile:

### Project Folder Structure

+ Data Folder
```
- api: Contain all API endpoint.
- models: Contain all models. Note: Please create folder for every model.
- repositories: Contain all API call.
- response: Contain all API response. Note: Please create folder for every response.
- request: Contain all API request. Note: Please create create folder for every request.
```
+ Helper Folder
```
- flavor: Contain all flavor for Local, QA, Production.
- global: Contain all general reusable function and constant.
- manager: Contain all theme manager, language manager...
- preference: Contain all small saved data.
- style: Contain all theme data, color, etc....
- utils: Contain all configuration, Navigator, etc... 
```
+ Logic Folder
```
- bloc: Contain all Complex Business Logic. Note: Please create folder for every bloc.
- cubit: Contain all Simple Business Logic. Note: Please create folder for every cubit.
```
+ Presentation Folder
```
- global(optional): Contain all reusable Page or UX/UI
- item: Contain all Widgets belong to ListView, GridView. Note: Please use this item with list type data only.
- modal: Contain all Modal like Dialog, Bottom Sheet, etc...
- page: Contain all Pages or UX/UI.
- widget: Contain all reusable Widget Component
```

 ### How to use Navigating Function 

 ```dart
    // * For pushing route to another page 
    context.push(destionation: anypage);

    // * For pushing replace 
    context.pushReplaceTo(destination: anypage);

    // * For pushing removeUtil
    context.go(destination: anypage);

    // * For popping screen 
    context.pop(); // * There is a parameter we can pass data to when popping the page 

    // * For dismiss or pop dialog
    dismiss();
 ```

### Command Generating API Function
```
  dart run build_runner build --delete-conflicting-outputs
```

### Command For Generating Translation Locale Keys
```
  dart run easy_localization:generate -S "assets/translations" -O "lib/helper/manager/language/translations" -o "locale_keys.g.dart" -f keys
```

A few resources to get you started if this is your first Flutter project:

- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

- [Learn BLoC](https://bloclibrary.dev/)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
