import 'package:flutter/material.dart';
import '../data/models.dart';
import '../objectbox.g.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class DeviceLogic extends ChangeNotifier {
  late final Store _store;
  late final Box<HomeDevice> _deviceBox;
  List<HomeDevice> _devices = [];
  bool _isInitialized = false;

  List<HomeDevice> get devices => _devices;
  bool get isInitialized => _isInitialized;

  Future<void> init() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final storeDir = p.join(docsDir.path, "home_guard_ob");
    _store = await openStore(directory: storeDir);
    _deviceBox = _store.box<HomeDevice>();
    _loadDevices();
    _isInitialized = true;
    notifyListeners();
  }

  void _loadDevices() {
    _devices = _deviceBox.getAll();
    notifyListeners();
  }

  Future<void> addDevice(HomeDevice device) async {
    _deviceBox.put(device);
    _loadDevices();
  }

  Future<void> deleteDevice(int id) async {
    _deviceBox.remove(id);
    _loadDevices();
  }

  @override
  void dispose() {
    _store.close();
    super.dispose();
  }
}
