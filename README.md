# Flutter Tab Scaffold Navigation System

This Flutter application is built around a custom `TabScaffold` widget for managing navigation tabs. The code is designed to provide a dynamic and flexible navigation system with the following features:

### ScreenShort
<img src="https://github.com/user-attachments/assets/581e47d0-eced-4454-9cd9-dc2280783a6d" alt="Screenshot_1734100157" width="200" height="400" style="margin-right: 100px;">

<img src="https://github.com/user-attachments/assets/a9bffec9-a4bc-4543-a704-63544b4593ea" alt="Screenshot_1734100327" width="200" height="400" style="margin-right: 100px;" >

<img src="https://github.com/user-attachments/assets/82166bb3-6e32-41f4-8763-aa95c4a9a621" alt="Screenshot_1734100166" width="200" height="400" style="margin-right: 100px;">

<img src="https://github.com/user-attachments/assets/44233dd2-73a0-40fe-a78d-cfeb239860d5" alt="Screenshot_1734100374" width="200" height="400" style="margin-right: 100px;">

<img src="https://github.com/user-attachments/assets/c79ea309-43a3-4190-9e5b-8c8b8ace2a8c" alt="Screenshot_1734100386" width="200" height="400" style="margin-right: 100px;">



## Key Features

### Customizable Navigation Tabs
- **Dynamic Tabs**: The `TabScaffold` allows for the dynamic creation of tabs, with each tab linked to its own navigation stack managed by `TabNavigator`.
- **Configurable Items**: Tabs are defined using `BottomNavItem`, which supports:
  - Icons for active and inactive states.
  - Labels for easy identification.
  - Optional properties like `activeIcon` and `backgroundColor` for enhanced customization.

### Flexible Page Navigation
- Pages such as `HomeScreen`, `HelpScreen`, and `SettingsScreen` demonstrate usage of the navigation system.
- **Custom Transitions**: `CustomPageRoute` provides:
  - Slide animations.
  - Bottom-sheet-like transitions.
  - Zoom-out effects.

### AppScaffold for Layout Management
- The `AppScaffold` widget centralizes the application’s layout, offering:
  - Background gradients or images.
  - Custom paddings for adaptable UI designs.
  - Floating action button integration.
  - Status bar style management for a polished look.

### Nested Navigation
- Independent navigators for each tab using `TabNavigator` with global keys to maintain state across tabs.
- Each tab can have its own stack of pages, ensuring seamless navigation.

## Code Highlights

### main Enter
```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TabScaffold(
      // marginNavButtonBar: EdgeInsets.only(left: 20, right: 20),
      // backgroundImage: "assets/Images/b.jpeg",
      // topNavButtonBar: true,
      nested: true,
      paddingValue: 10,
      numberTab: 3,
      pages: [HomeScreen(), HelpScreen(), SettingsScreen()],
      bottomNavItems: [
        BottomNavItem(icon: Icons.home, label: "Home"),
        BottomNavItem(icon: Icons.help, label: "Help"),
        BottomNavItem(icon: Icons.help, label: "Help"),
      ],
      navigationBarBg: Colors.amber[100],
    );
  }
}
```

### TabScaffold Widget
```dart
TabScaffold(
  bottomNavItems: [
    BottomNavItem(
      icon: Icons.home,
      label: 'Home',
      activeIcon: Icons.home_filled,
    ),
    BottomNavItem(
      icon: Icons.help_outline,
      label: 'Help',
    ),
    BottomNavItem(
      icon: Icons.settings,
      label: 'Settings',
    ),
  ],
  children: [
    HomeScreen(),
    HelpScreen(),
    SettingsScreen(),
  ],
)
```

### AppScaffold Widget
```dart
AppScaffold(
  body: Center(child: Text('Hello, World!')),
  gradient: LinearGradient(
    colors: [Colors.blue, Colors.purple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
  ),
)
```

## How to Use
1. **Setup Tabs**:
   Define `BottomNavItem` objects with icons, labels, and optional customizations.

2. **Add Screens**:
   Include child widgets for each tab in the `TabScaffold`.

3. **Implement Custom Transitions**:
   Use `CustomPageRoute` to wrap your routes for smooth transitions.

4. **Style the App**:
   Utilize `AppScaffold` for flexible layout and background options.

## Benefits
- Modular and reusable navigation system.
- Clear separation of concerns between layout, navigation, and transitions.
- Easy to extend with new tabs or custom behaviors.

## Example Output
A sample app with three tabs:
- **Home**: Displays a list of items.
- **Help**: Contains FAQs and support links.
- **Settings**: Allows customization of user preferences.

Customize and expand this framework to suit your specific application needs!


