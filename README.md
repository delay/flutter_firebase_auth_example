# Flutter Auth with Firebase Example

![flutter firebase auth screenshots](https://github.com/delay/flutter_firebase_auth_example/blob/master/website_images/screenshot_auth.jpg)

## This project has been replaced with this [new flutter auth project](https://github.com/delay/flutter_firebase_auth_starter) I made.  Please use it instead.  It has more features and does things in a more flutter way.

There are numerous tutorials on using firebase auth with flutter. I went through many of these to work through making my own take on a Firebase Auth flutter project that worked the way I needed it to. Definitely check out these projects which provide much more in depth tutorials.

[Simple Recipe app made in flutter firebase and google sign in](https://medium.com/flutter-community/simple-recipes-app-made-in-flutter-firebase-and-google-sign-in-14d1535e9a59)

[Instaflutter](https://github.com/instaflutter/flutter-login-screen-firebase-auth-facebook-login)

[Flutter login UI](https://github.com/putraxor/flutter-login-ui)

[How to do user login with firebase](https://medium.com/flutterpub/flutter-how-to-do-user-login-with-firebase-a6af760b14d5)

I am still new to flutter so there are probably better ways to handle many of the options in this code.
I setup my project to combine firebase auth with saving my user info to shared preferences on the mobile device. When logging in it reads the info from local storage first. If it doesn’t exist, the user logs into firebase and the user and settings data is retrieved from firestore and stored locally. This minimizes the number of requests required from firestore. I wanted to login with an email and password as opposed to logging in with google sign in or facebook sign in.

I also use validation for text fields and handle and display error messages via a snackbar style notification [flushbar package](https://pub.dartlang.org/packages/flushbar). Finally I use global state to keep track of when the data changes.

## Overview of files...

**main.dart** - this file initializes the app and contains the routing as well as the global state setup and references the custom theme.

## /ui/

**theme.dart** - contains some custom theme info.

## /ui/screens/

**home.dart** - HomeScreen when the user is logged in, also redirects the user when he is not logged in to the SignInScreen.

**sign_in.dart** - SignInScreen . When signing in logs in with Firebase Auth, then retrieves data from the two collections in firestore and saves it locally, also calls the state_widget so the global state can be updated once logged in.

**sign_up.dart** - SignUpScreen sets up a new user in Firebase Auth and writes two new documents in Firestore, one to the users collection and one to the settings collection on firebase.

**forgot_password.dart** - ForgotPasswordScreen lets you send a firebase query to reset your password.

## /ui/widgets

**loading.dart** - LoadingScreen - small modification to the excellent package [modal_progress_hud](https://pub.dartlang.org/packages/modal_progress_hud) to wrap the circular progress indicator.

## /util/

**auth.dart** - The Auth class which controls authenticating and reading and storing info related to auth.

**state_widget.dart** - The state widget class which initializes the user and logs them in and out.

**validator.dart** - Validation class with some custom validations for email, password, etc.

## /models/

> Used [quicktype](https://app.quicktype.io/#l=dart) to setup the models but added one extra function for firebase.

**settings.dart** - model for settings. Eventually this will be used to hold the rest of the app settings.

**user.dart** - model for user.

**state.dart** - model for the state.

Anyway hopefully this little project will help someone. Feel free to use any of it, I didn't create all of this code as parts of it came from watching the tutorials and reviewing the projects mentioned above. Make sure you [setup firebase](https://firebase.google.com/docs/flutter/setup) with your project.
