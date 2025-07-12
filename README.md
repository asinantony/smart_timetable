Smart Timetable

A Flutter-based Smart Timetable app for admins and lecturers, designed to simplify class scheduling through automation and cloud-based management.

Features

- Role-based Login System (Admin & Lecturer access)
- Automated Timetable Generation using Genetic Algorithm
- Firebase Authentication for secure login
- Cloud Firestore integration for dynamic timetable data
- Cross-platform Support: Android, iOS, Web, Desktop
- Modern UI using Flutter and Dart

Tech Stack

Technology        - Usage
Flutter & Dart    - Frontend & UI logic
Firebase Auth     - Login & Role management
Cloud Firestore   - Database for timetable data
Genetic Algorithm - Smart, conflict-free scheduling
GitHub Actions    - CI/CD setup for Firebase hosting

Getting Started

To run the app locally:

git clone https://github.com/asinantony/smart_timetable.git
cd smart_timetable
flutter pub get
flutter run

Make sure to add your Firebase config files:
- android/app/google-services.json
- ios/Runner/GoogleService-Info.plist

Screenshots

<img width="963" height="624" alt="image" src="https://github.com/user-attachments/assets/32f59ba2-3e2e-4a6c-9d87-5afeea447df8" />
<img width="934" height="651" alt="image" src="https://github.com/user-attachments/assets/6ba16455-df02-475a-9f28-f81b47fb9ced" />
<img width="955" height="670" alt="image" src="https://github.com/user-attachments/assets/ab9713eb-9b30-452b-922f-7eb8a6dfe96e" />
<img width="955" height="549" alt="image" src="https://github.com/user-attachments/assets/56b39f91-b87d-449c-b974-178f411290ee" />
<img width="959" height="560" alt="image" src="https://github.com/user-attachments/assets/5e42f1b0-127b-414f-9323-c81a1051daf1" />
<img width="571" height="773" alt="image" src="https://github.com/user-attachments/assets/093afb68-dbbc-495e-b1bd-78779fdf1d5f" />
<img width="542" height="324" alt="image" src="https://github.com/user-attachments/assets/c794f061-e1eb-4641-8449-d89cf072091b" />
<img width="544" height="249" alt="image" src="https://github.com/user-attachments/assets/42fcb313-861a-429d-a80b-c5071e029fe7" />


Folder Structure Overview

smart_timetable/
├── android/           → Android-specific code
├── ios/               → iOS-specific code
├── lib/               → Main Flutter app code
├── functions/         → Optional: Firebase Cloud Functions
├── .github/workflows/ → GitHub Actions CI/CD workflow

Notes

- The Firebase deploy workflow was disabled due to missing secret credentials.
- You can re-enable it by adding your service account key to GitHub Secrets.

Author

Asin Fraisiya  
BCA in Data Analytics   
LinkedIn: www.linkedin.com/in/asin-fraisiya-v-a-36694427a 
Email: vasins2005@gmail.com
