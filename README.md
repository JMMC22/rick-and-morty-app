# Rick And Morty iOS App

[![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/Platform-iOS-lightgrey.svg)](https://developer.apple.com/ios/)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)


Rick And Morty App is an application built with SwiftUI to display a list of characters. It follows **Clean Architecture** and **MVVM** pattern, ensuring proper separation of concerns and scalability.


## 🚀 Features

- Displays a list of characters with their image, name, origin, gender, and an icon indicating if they are a favorite.
- Gender filtering.
- Detailed view of each character with the option to mark them as a favorite.
- Favorite characters are persisted in a database and restored upon app launch.
- Supports deep links (`alkimiirickandmorty://character/{id}`).

## 🛠️ Technologies

- **Language**: Swift
- **Platform**: iOS
- **Dependency Manager**: Swift Package Manager
- **Networking**: URLSession
- **Data Persistence**: UserDefaults
- **User Interface**: SwiftUI
- **Dependency injection**: Swinject

## 📱 Screenshots

Here are some screenshots of the app in action:

| Lis View                             | Details View                           
|--------------------------------------|---------------------------------------|
| ![List View](https://github.com/user-attachments/assets/bd60111b-b55c-4bc3-848b-80e3c0a53045) | ![Details View](https://github.com/user-attachments/assets/b788f8a9-8198-41af-83ba-2c3698fee440) |


## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.
