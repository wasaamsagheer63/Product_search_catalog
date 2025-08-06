# Product Search & Catalog Management App

A comprehensive Flutter application that provides efficient product management with powerful search capabilities using Algolia.

## 🚀 Features

- **Smart Search**: Lightning-fast product search with Algolia integration
- **Advanced Filtering**: Filter products by brand, category, price, and more
- **Product Management**: Complete CRUD operations for product catalog
- **Real-time Updates**: Instant synchronization across the application
- **Responsive Design**: Clean and intuitive user interface
- **Typo Tolerance**: Search works even with spelling mistakes

## 📱 Screenshots

![WhatsApp Image 2025-08-06 at 13 48 03_58fb3edf](https://github.com/user-attachments/assets/0337b75a-2d81-4258-9928-2baf0e0ba270)
![IMG-20250806-WA0001 1](https://github.com/user-attachments/assets/cb0e8ac3-bc12-4df9-8a3e-30253d371a6e)
![WhatsApp Image 2025-08-06 at 13 48 04_0b2b11e9](https://github.com/user-attachments/assets/43854c54-00b6-46c6-a61a-27ffbabf5701)
![WhatsApp Image 2025-08-06 at 13 48 04_278c2c3b](https://github.com/user-attachments/assets/961f4a43-9f91-49b1-8c67-a30ac5f3d241)
![WhatsApp Image 2025-08-06 at 13 48 07_3dc25201](https://github.com/user-attachments/assets/65a16f90-37b0-457d-8283-393fd688c342)



## 🛠️ Tech Stack

- **Frontend**: Flutter, Dart
- **State Management**: GetX
- **Search Engine**: Algolia Search API
- **Backend**: RESTful API (MockAPI)
- **Architecture**: MVVM Pattern
- **HTTP Client**: http package

## 🏗️ Architecture

The app follows MVVM (Model-View-ViewModel) architecture pattern:

```
lib/
├── model/           # Data models
├── view/            # UI screens
├── viewmodel/       # Business logic
├── repository/      # Data layer
└── services/        # External services (Algolia)
```

## 📋 Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK (>=2.17.0)
- An Algolia account for search functionality

## ⚙️ Setup & Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/wasaamsagheer63/Product_search_catalog.git
   cd Product_search_catalog
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Algolia**
   - Create an Algolia account
   - Update your credentials in `lib/services/algolia_service.dart`
   ```dart
   String application_ID = "YOUR_APP_ID";
   String API_KEY = "YOUR_API_KEY";
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

## 🎯 Key Functionality

### Product Management
- Add new products with detailed information
- Edit existing product details
- Delete products from catalog
- View comprehensive product information

### Search & Discovery
- Real-time search as you type
- Filter by multiple attributes
- Faceted search results
- Search suggestions and auto-complete

### Data Synchronization
- Automatic sync with Algolia index
- Real-time updates across the app
- Error handling and retry mechanisms

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  get: ^4.6.5
  http: ^0.13.5
  algolia_helper_flutter: ^0.2.0
```

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Wasaam Sagheer**
- GitHub: @wasaamsagheer63](https://github.com/wasaamsagheer63
- LinkedIn: https://www.linkedin.com/in/wasaam-sagheer

## 🙏 Acknowledgments

- Algolia for providing excellent search capabilities
- Flutter team for the amazing framework
- MockAPI for backend services

---

⭐ Star this repository if you found it helpful!
