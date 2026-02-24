import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/constants.dart';
import '../logic/device_logic.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DeviceLogic>(
      builder: (context, logic, child) {
        return Scaffold(
          backgroundColor: AppColors.deepBlack,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              'HOME GUARD AI',
              style: TextStyle(
                color: AppColors.royalGold,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.cloud_sync, color: AppColors.royalGold),
                onPressed: () {},
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(AppConstants.paddingMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStatusCard(logic.devices.length),
                const SizedBox(height: 24),
                const Text(
                  'THIẾT BỊ CỦA BẠN',
                  style: TextStyle(
                    color: AppColors.royalGold,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(child: _buildDeviceList(logic.devices)),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.royalGold,
            onPressed: () {},
            child: const Icon(Icons.add, color: AppColors.deepBlack),
          ),
        );
      },
    );
  }

  Widget _buildStatusCard(int deviceCount) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      decoration: BoxDecoration(
        color: AppColors.goldOpacity10,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        border: Border.all(color: AppColors.royalGold.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          const Icon(Icons.shield, color: AppColors.royalGold, size: 48),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                deviceCount > 0 ? 'Hệ thống ổn định' : 'Chưa có thiết bị',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$deviceCount thiết bị đang được bảo vệ',
                style: const TextStyle(color: AppColors.white70),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDeviceList(List<dynamic> devices) {
    if (devices.isEmpty) {
      return const Center(
        child: Text('Nhấn + để thêm thiết bị đầu tiên', style: TextStyle(color: AppColors.white30)),
      );
    }
    return ListView.builder(
      itemCount: devices.length,
      itemBuilder: (context, index) {
        final device = devices[index];
        return Card(
          color: Colors.white.withOpacity(0.05),
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: const Icon(Icons.settings_remote, color: AppColors.royalGold),
            title: Text(device.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            subtitle: Text('${device.brand} - ${device.modelNumber}', style: const TextStyle(color: AppColors.white70)),
            trailing: const Icon(Icons.chevron_right, color: AppColors.white30),
            onTap: () {
              // Navigate to detail
            },
          ),
        );
      },
    );
  }
}

