import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// A stub implementation to avoid extra transitive dependencies
/// on non-Windows platforms including web.
class FlutterSecureStorageWindows extends FlutterSecureStoragePlatform {
  /// Cannot be instantiated.
  FlutterSecureStorageWindows() : assert(false, 'Cannot instantiate this class.');

  /// Registers this plugin.
  static void registerWith() {
    FlutterSecureStoragePlatform.instance = FlutterSecureStorageWindows();
  }

  @override
  Future<bool> containsKey({
    required String key,
    required Map<String, String> options,
  }) =>
      Future.value(false);

  @override
  Future<void> delete({
    required String key,
    required Map<String, String> options,
  }) =>
      Future.value();

  @override
  Future<void> deleteAll({required Map<String, String> options}) => Future.value();

  @override
  Future<String?> read({
    required String key,
    required Map<String, String> options,
  }) =>
      Future.value();

  @override
  Future<Map<String, String>> readAll({required Map<String, String> options}) => Future.value({});

  @override
  Future<void> write({
    required String key,
    required String value,
    required Map<String, String> options,
  }) =>
      Future.value();

  // @override
  // Future<bool> isCupertinoProtectedDataAvailable() => Future.value(true);
  //
  // @override
  // Stream<bool> get onCupertinoProtectedDataAvailabilityChanged =>
  //     Stream.value(true);
}

abstract class FlutterSecureStoragePlatform extends PlatformInterface {
  FlutterSecureStoragePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterSecureStoragePlatform _instance = FlutterSecureStorageWindows();

  static FlutterSecureStoragePlatform get instance => _instance;

  static set instance(FlutterSecureStoragePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> write({
    required String key,
    required String value,
    required Map<String, String> options,
  });

  Future<String?> read({
    required String key,
    required Map<String, String> options,
  });

  Future<bool> containsKey({
    required String key,
    required Map<String, String> options,
  });

  Future<void> delete({
    required String key,
    required Map<String, String> options,
  });

  Future<Map<String, String>> readAll({
    required Map<String, String> options,
  });

  Future<void> deleteAll({
    required Map<String, String> options,
  });
}
