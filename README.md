# Users App

A Flutter application that demonstrates clean architecture, state management with Riverpod, and modern Flutter development practices.

## Features

- User listing and details view
- Clean Architecture implementation
- State management with Riverpod
- Navigation service
- Error handling
- Network connectivity handling
- Shared preferences integration
- Loading state handling with Skeletonizer

## Tech Stack

- Flutter SDK: ^3.6.0
- Dart: Latest stable version
- State Management: flutter_riverpod ^2.6.1
- Network: dio ^5.8.0+1
- JSON Serialization: json_serializable ^6.8.0
- Dependency Injection: injectable ^2.5.0
- Code Generation: build_runner ^2.4.13
- Functional Programming: dartz ^0.10.1
- Local Storage: shared_preferences ^2.5.2
- Network Connectivity: connectivity_plus ^6.1.3
- Loading States: skeletonizer ^1.4.3
- Testing: mockito ^5.4.5

## Project Structure

```
lib/
├── core/
│   ├── router/
│   │   ├── app_router.dart
│   │   └── navigation_service.dart
│   └── shared_preferences_provider.dart
├── features/
│   └── users/
│       ├── data/
│       ├── domain/
│       └── presentation/
└── main.dart
```

## Getting Started

### Prerequisites

- Flutter SDK (^3.6.0)
- Dart SDK (latest stable)
- Android Studio / VS Code
- iOS Simulator / Android Emulator

### Installation

1. Clone the repository:
```bash
git clone [repository-url]
```

2. Navigate to project directory:
```bash
cd assignment
```

3. Install dependencies:
```bash
flutter pub get
```

4. Run code generation:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

5. Run the app:
```bash
flutter run
```

## Architecture

This project follows Clean Architecture principles with the following layers:

- **Presentation**: Contains UI components and view models
- **Domain**: Contains business logic and use cases
- **Data**: Contains repositories and data sources

## State Management

The app uses Riverpod for state management, offering:
- Dependency injection
- State management
- Family providers for parameterized state
- Auto-disposal of providers

## Navigation

Custom navigation service using Navigator 2.0 principles:
- Centralized routing
- Type-safe navigation
- Deep linking support
- Navigation state management

## Testing

To run tests:
```bash
flutter test
```

## Building for Production

### Android

```bash
flutter build apk --release
```

### iOS

```bash
flutter build ios --release
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details

## Acknowledgments

- Flutter team for the amazing framework
- Riverpod for state management solutions
- All other open-source packages used in this project
