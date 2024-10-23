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
- Supports deep links (`jmrickandmorty://character/{id}`).

## 🎯 Next Steps

- Implement caching for remote data by storing it in a local database (Core Data). Using reactive programming, first display the data from the local database, then update it with new data as it becomes available
- Implement searcher.
- Improve Unit Tests.
- Improve GraphQL requests.
- Implement UI and snapshots Tests.
- Implement loading state (Shimmer).

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

| List View                             | Details View                           
|--------------------------------------|---------------------------------------|
| ![Simulator Screenshot - iPhone 16 Pro - 2024-10-23 at 15 28 10](https://github.com/user-attachments/assets/17cde92b-e7b3-4974-bacd-cadac8877a3d) | ![Simulator Screenshot - iPhone 16 Pro - 2024-10-23 at 15 28 14](https://github.com/user-attachments/assets/208fb891-4b0c-493e-9657-ca6d556d5f3b) |


## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.
