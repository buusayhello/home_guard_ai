import 'package:objectbox/objectbox.dart';

@Entity()
class HomeDevice {
  @Id()
  int id = 0;

  String name;
  String brand;
  String modelNumber;
  String serialNumber;
  
  @Property(type: PropertyType.date)
  DateTime? purchaseDate;
  
  @Property(type: PropertyType.date)
  DateTime? warrantyExpiry;

  String? roomLocation; // Phòng khách, Bếp, v.v.
  String? notes;
  String? imagePath;

  HomeDevice({
    required this.name,
    required this.brand,
    required this.modelNumber,
    required this.serialNumber,
    this.purchaseDate,
    this.warrantyExpiry,
    this.roomLocation,
    this.notes,
    this.imagePath,
  });
}

@Entity()
class MaintenanceRecord {
  @Id()
  int id = 0;

  final device = ToOne<HomeDevice>();

  String taskName; // Thay lõi lọc, Vệ sinh...
  
  @Property(type: PropertyType.date)
  DateTime serviceDate;
  
  String? technicianName;
  double? cost;
  String? description;

  MaintenanceRecord({
    required this.taskName,
    required this.serviceDate,
    this.technicianName,
    this.cost,
    this.description,
  });
}
