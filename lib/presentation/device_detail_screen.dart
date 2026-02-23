import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../data/models.dart';

class DeviceDetailScreen extends StatelessWidget {
  final HomeDevice device;

  const DeviceDetailScreen({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepBlack,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          device.name.toUpperCase(),
          style: const TextStyle(color: AppColors.royalGold, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: AppColors.royalGold),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDeviceHeader(),
            const SizedBox(height: 24),
            _buildInfoSection('THÔNG TIN CHI TIẾT', [
              _buildInfoRow('Hãng', device.brand),
              _buildInfoRow('Model', device.modelNumber),
              _buildInfoRow('S/N', device.serialNumber),
              _buildInfoRow('Vị trí', device.roomLocation ?? 'Chưa xác định'),
            ]),
            const SizedBox(height: 24),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildDeviceHeader() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.goldOpacity10,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        border: Border.all(color: AppColors.royalGold.withOpacity(0.2)),
      ),
      child: const Icon(Icons.inventory_2, size: 80, color: AppColors.royalGold),
    );
  }

  Widget _buildInfoSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: AppColors.royalGold, fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: AppColors.white70)),
          Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.build),
            label: const Text('CHẨN ĐOÁN LỖI'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.royalGold,
              foregroundColor: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
