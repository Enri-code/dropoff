# Thispatch

# Dev configuration

<!-- Flutter Channel stable, 3.22.1 -->
<!-- Xcode 14.2 -->

# Project Structure

Every feature is very well separated from each other and inside the feature, the UI code and business logic is separated as per 'Clean Architecture + Domain driven architecture' thereby providing the separation of concern.

     
        lib
        ├─- src
    │   │   ├── core
    │   │   │   ├── constants
    │   │   │   |   ├── app_color.dart
    │   │   │   ├── extensions
    │   │   │   |   └── string_extension.dart
    │   │   │   ├── ui
    │   │   │   |   └── app_button.dart
    │   │   │   ├── theme
    │   │   │   |   └── custom_text_styles.dart
    │   │   │   └── utils
    │   │   │       └── log_service.dart
    │   │   │       └── app_formatter.dart
    │   │   ├── features
    |   |   │   ├── <feature_name>
    |   |   │   │   ├── data
    |   |   │   |   |   ├── models
    |   |   │   |   |   |   └── feature_model.dart
    |   |   │   |   |   └── repository
    |   |   │   |   |       └── feature_repo_impl.dart
    |   |   │   |   ├── domain
    |   |   │   |   |   └── repository
    |   |   │   |   |       └── feature_repo.dart
    |   |   │   |   └── presentation
    |   |   │   |       ├── bloc
    |   |   │   |       |   └── feature_bloc.dart
    |   |   │   |       |   └── feature_event.dart
    |   |   │   |       |   └── feature_state.dart
    |   |   │   |       └── pages
    |   |   │   |           ├── feature_page.dart
                            |
    |   |   │   |       ├── widgets
    │   │   │   │       |   └── feature_widgets.dart       
    |   |   │   │               
    │   │   └── app.dart
    │   └── main.dart
    └── pubspec.yaml


## Naming conventions

# Dart Files: 
Dart files should use lowercase letters with words separated by underscores. For example: my_widget.dart, data_service.dart, user_model.dart.

# Widget Files:
Widget files should follow the same naming convention as Dart files. For example: my_widget.dart, custom_button.dart, profile_card.dart. The file name should be descriptive and indicate the purpose of the widget.

# Screen or Page Files: 
Screen or page files usually represent a full-screen or top-level view in your app. It is common to use the "screen" or "page" suffix to indicate this. For example: home_screen.dart, settings_page.dart, login_screen.dart.

# Utility or Helper Files: 
Utility or helper files that contain functions, extensions, or constants can be named using lowercase letters with words separated by underscores. For example: string_utils.dart, http_helper.dart, constants.dart.

# Test Files: 
Test files usually have the same name as the file they are testing but with the _test suffix. For example: my_widget_test.dart, data_service_test.dart.


Release
-------
 IMPORTANT
 ---------

 Update app/gradle buildTypes -> release before making appBundle for production

 - fvm flutter build apk --release
 - fvm flutter build appbundle --release


# DEV
------

 - fvm flutter build apk --release --flavor dev -t lib/main_dev.dart
   - Extract the file in the folder `build/app/outputs/flutter-apk/app-release.apk`

 - fvm flutter build ipa --flavor dev --release -t lib/main_dev.dart

# PROD

- fvm flutter build appbundle --release --flavor prod -t lib/main_prod.dart

- fvm flutter build ipa --flavor prod --release -t lib/main_prod.dart


Build
-----

 - fvm flutter run -d emulator
 - fvm flutter run --release -d <DeviceId>


This line is added to the gradle.property to fix this issue after flutter upgrade.

# Generate required files using Build_Runner

dart run build_runner build --delete-conflicting-outputs
