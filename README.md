# Barber Shop

# after clone or unzip

## manual:

### get dependencies

```bash
flutter pub get
```

### build setup config

```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

### clear the question mark

file path: ~/lib/setup.config.dart

clear the question mark '?' in the first lines Like this:

```dart
//before remove:
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
//after remove:
    {String environment, _i2.EnvironmentFilter environmentFilter}) {
```
