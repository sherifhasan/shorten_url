# Shorty
Application used for shorten web links 

<img src="https://img.shields.io/badge/made%20with-dart-blue.svg" alt="made with dart">

## Screenshots 

![Alt text](/design/1_start_screen.png?raw=true )
![Alt text](/design/2_benefits_screen.png?raw=true )
![Alt text](/design/3.1_main_screen_empty.png?raw=true )
![Alt text](/design/3.2_main_screen_empty_missing_link.png?raw=true )
![Alt text](/design/3.3_main_screen_link_history.png?raw=true )
## Folder Structure
```bash
.
├── core
│   ├── models
│   ├── providers
│   └── services
└── ui
    ├── base
    ├── shared
    └── views
```

## Folder Structure explanation
The lib folder is divided into two folders. Core and ui. Core contains all the files associated with the logic. ui contains all the files associated with the ui. 

- Core is divided into five folders:
1. models: Contains shorten api response model 
2. providers: Contains the LinksHistoryProvider that extend ChangeProvider that will handle actual business logic
3. services: Contains shorten url api and navigation service 

- UI is divided into three folders:
1. Base : Contain base view and base model that will be used in all app views and view models 
1. Shared: Contains files used in multiple other UI files. Usually contains global widgets.
2. Views: Contains the files for the app screens

## High Level Architecture Overview
**Please read before adding any code**
- Each view will have its own view model
- Notify listeners for a view will only be called when the View's state changes.
- Each view only has 2 states. Idle and Busy. Any other piece of UI contained in a view, that requires logic and state / UI updates will have its own model associated with it. This way the main view only paints when the main view state changes.
- Providers will NOT be passed in through app level global provider, unless it's required by more than 1 view in the app architecture (Users information).
- Models will ONLY request data from providers and reduce state from that data.
Providers will perform all the actual work. Api class will request and serialize data. The model will just call the function to do that. Authentication provider will use the Api to get the user details and track it. The model just calls the function and passes values to it.
- All our Models will work the same. We have a state property that tells us what UI layout to show in the view and when it's updated we want to call notifyListeners so we moved that into a BaseModel. It contains all the state related code.
Most of the views require their own model, they need to have a root widget Provider and a child Consumer that takes a build method. We added a BaseView that is generic that will do all this for us. 
- We want the architecture setup to easily support calling functions when a new view is shown without having to convert everything to a stateful widget. To achieve this we converted our BaseView into a stateful widget to use the onInit to pass our model back to use in a callback function that we can execute on. We'll store the model locally in the state and in the initState call we'll check if we have a callback.

### Testing
- Add a unit test at `test/models/<YOUR_MODEL>.dart`

## Building ##
  - Run `flutter packages get` first to download the dependencies.
  - Run `flutter test` to execute tests.
  - Run `flutter run` to try it live on running emulator or usb connected device.
  - Run `flutter build apk` to generate APK file.
  - Run `flutter build ios` to package iOS app.
