# Boom Burger 🍔

A modern Flutter app for ordering delicious burgers and extras, built with clean architecture and MobX state management.

## Features

### 🍔🍟 Menu Screen
- **Get Menu**: to see what burgers and extras are on the menu

### 🛒 Cart Screen
- **Quantity Management**: Increase/decrease quantities with intuitive controls
- **Remove Items**: Easy removal of individual items
- **Total Calculation**: Real-time display of total value with discount

### 🎯 Technical Features
- **Discount**: 20%, 15% and 10% off burger options and extras
- **State Management**: MobX for reactive state management
- **Clean Architecture**: Organized into domain, data, and presentation layers
- **Local Storage**: Cart persistence using sqLite
- **Custom Widgets**: Reusable MenuDailog component
- **Responsive Design**: Modern, responsive UI with Material Design 3

## Architecture

The app follows Clean Architecture principles with the following structure:

```
lib/
├── core/
│   ├── data/
│   │   └── local_data.dart
│   └── dependency_injection/
│       └──di.dart  
├── good_burger/
│    ├── data/
│    │   ├── data_source/
│    │   │   ├── item_local_data_source.dart
│    │   │   └── order_local_data_source.dart
│    │   ├── models/
│    │   │   ├── item_model.dart
│    │   │   └── order_model.dart
│    │   └── repositories/
│    │       ├── items_repository_impl.dart
│    │       └── order_repository_impl.dart
│    ├── domain/
│    │   ├── enums/
│    │   │   └── order_item_type_enum.dart
│    │   ├── repositories/
│    │   │   ├── item_repository.dart
│    │   │   └── order_repository.dart
│    │   └── use_cases/
│    │       ├── add_item_to_cart_use_case.dart
│    │       ├── add_order_use_case.dart
│    │       ├── calcule_order_total_use_case.dart
│    │       ├── clear_cart_items_use_case.dart
│    │       ├── delete_cart_item_use_case.dart
│    │       ├── get_all_items_use_case.dart
│    │       └── get_cart_items_use_case.dart
│    └── presentation/
│        ├── pages/
│        │   ├── cart_page.dart
│        │   ├── home_page.dart
│        │   └── splash_page.dart
│        ├── store/
│        │   ├── cart_store.dart
│        │   ├── cart_store.g.dart
│        │   ├── menu_store.dart
│        │   └── menu_store.g.dart
│        ├── view_model/
│        │    ├── item_view_model.dart
│        │    └── order_view_model.dart
│        └── widget/
│            └── menu_dialog.dart
└── main.dart
```

### State Management with MobX

The app uses MobX for reactive state management:

- **MenuStore**: Manages menu data loading and filtering
- **CartStore**: Handles cart operations (add, remove, update, persist)

### Data Layer

- **MenuRepository**: Interface for menu data operations
- **CartRepository**: Interface for cart persistence
- **SqLite**: Local storage for cart data

## Getting Started

### Prerequisites

- Flutter SDK (>=3.8.1)
- Dart SDK (>=3.8.1)
- Android Studio / VS Code with Flutter extensions

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd good_burger
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate MobX code**
   ```bash
   flutter packages pub run build_runner build
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

### Development

To regenerate MobX code after changes:
```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

## Dependencies

### Core Dependencies
- **flutter**: The Flutter framework
- **mobx**: State management library
- **flutter_mobx**: Flutter bindings for MobX
- **sqflite**: Local storage for cart persistence

### Development Dependencies
- **build_runner**: Code generation
- **mobx_codegen**: MobX code generation
- **flutter_lints**: Linting rules

## Menu Items

### Burgers 🍔
- X Burger - $5.00
- X Egg - $4.50
- X Bacon - $7.00

### Extras 🍟
- Fries - $2.00
- Soft Drink - $2.50

## Features in Detail

### Custom Widgets
- **MenuDailog**: Reusable card component for displaying menu items with:
  - Item name
  - Price display
  - Add to Cart button

### State Management
- **Observable Properties**: Reactive data that automatically updates the UI
- **Computed Properties**: Derived state (total amount, item counts)
- **Actions**: Methods that modify state and trigger UI updates

### Local Storage
- Cart data persists between app sessions
- Automatic loading of saved cart on app startup
- Error handling for corrupted data

### UI/UX Features
- **Material Design 3**: Modern design system
- **Responsive Layout**: Works on different screen sizes
- **Loading States**: Visual feedback during operations
- **Error Handling**: User-friendly error messages
- **Success Feedback**: Confirmation messages for user actions

## Future Enhancements

- [ ] User authentication
- [ ] Order history
- [ ] Payment integration
- [ ] Push notifications
- [ ] Offline support
- [ ] Multi-language support
- [ ] Dark mode theme
- [ ] Image assets for menu items

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

---

**Boom Burger** - Delicious burgers, delivered to your fingertips! 🍔✨
