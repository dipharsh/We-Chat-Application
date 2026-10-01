# WeChat Application

A feature-rich real-time chat application built with Flutter and Firebase.

## Features

- **Authentication**: Secure Google Sign-In via Firebase Authentication.
- **Real-time Messaging**: Instant messaging powered by Cloud Firestore.
- **User Profiles**: View and manage user profile details and avatars.
- **Media Support**: Image picking and cached network image loading for profile pictures and chat media.
- **Cross-Platform**: Designed to run smoothly on Android, iOS, Web, macOS, Linux, and Windows.

## Tech Stack

- **Frontend**: Flutter (Dart ^3.7.0)
- **Backend & Database**: Firebase (Firebase Auth, Cloud Firestore, Firebase Core)
- **Packages & Dependencies**:
  - `firebase_core`: ^3.12.1
  - `firebase_auth`: ^5.5.1
  - `google_sign_in`: ^6.3.0
  - `cloud_firestore`: ^5.6.5
  - `cached_network_image`: ^3.4.1
  - `image_picker`: ^0.8.6
  - `flutter_launcher_icons`: ^0.14.3

## Project Structure

```text
lib/
├── Screens/
│   ├── auth/
│   │   ├── login_screen.dart
│   │   └── splash_screen.dart
│   ├── home_screen.dart
│   └── profile_screen.dart
├── api/
│   └── apis.dart
├── helper/
│   └── dialogs.dart
├── models/
│   └── chat_user.dart
├── widgets/
│   └── chat_user_card.dart
├── firebase_options.dart
└── main.dart
```

## Getting Started

### Prerequisites

- Flutter SDK (^3.7.0) installed.
- Firebase project configured with Authentication and Cloud Firestore enabled.

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/dipharsh/We-Chat-Application.git
   ```
2. Navigate to the project directory:
   ```bash
   cd we_chat
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the application:
   ```bash
   flutter run
   ```
