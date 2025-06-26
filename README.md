# Google Sign-In Demo App

This Flutter application demonstrates the integration of Google Sign-In using Firebase Authentication. Users can sign in with their Google accounts, view their profile details, and sign out with ease.

## Features

- **Google Sign-In**: A streamlined login process using Google Authentication.
- **User Profile Display**: Shows the user's name, email, and profile picture after successful login.
- **Sign Out Option**: Users can securely log out from their accounts.

## Setup Instructions

1. **Firebase Setup**:
   - Create a Firebase project at [Firebase Console](https://console.firebase.google.com/).
   - Add your Flutter app to the Firebase project.
   - Download the `google-services.json` file and place it in the `android/app` directory of your project.

2. **Dependencies**:
   - Add the required Firebase and Sign-In Button packages in `pubspec.yaml`.

3. **Configure Project**:
   - Ensure Firebase is initialized in your `main.dart` file.
   - Add necessary configurations in `build.gradle` files for Firebase.

4. **Run the App**:
   - Use `flutter run` to start the application.
  
## Screenshots:
![image](https://github.com/user-attachments/assets/1b30e0ad-17f7-4524-ab48-6c22b2f80576)
![image](https://github.com/user-attachments/assets/692b7902-9986-459b-91a9-af8c6d8ec897)
![image](https://github.com/user-attachments/assets/c97706df-995e-4cb2-85e9-c907c8cec8e0)
![image](https://github.com/user-attachments/assets/868cff23-1d8d-452d-a566-7aaa9d044090)

## Dependencies Used

- **firebase_auth**: For authenticating users via Firebase.
- **sign_in_button**: For rendering Google Sign-In buttons with custom styles.

## Screens

- **Login Screen**: Users can sign in using their Google accounts.
- **Profile Screen**: Displays user information and provides an option to sign out.
