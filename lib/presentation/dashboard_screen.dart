import 'package:flutter/material.dart';
import '../core/constants.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            _buildStatusCard(),
            const SizedBox(height: 24),
            const Text(
              'THIẾT BỊ CỦA BẠN',
              style: TextStyle(
                color: AppColors.royalGold,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(child: _buildDeviceList()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.royalGold,
        onPressed: () {},
        child: const Icon(Icons.add, color: AppColors.deepBlack),
      ),
    );
  }

  Widget _buildStatusCard() {
    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      decoration: BoxDecoration(
        color: AppColors.goldOpacity10,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        border: Border.all(color: AppColors.royalGold.withOpacity(0.3)),
      ),
      child: const Row(
        children: [
          Icon(Icons.shield, color: AppColors.royalGold, size: 48),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tất cả an toàn',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '0 thiết bị cần bảo trì',
                style: TextStyle(color: AppColors.white70),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDeviceList() {
    return ListView.builder(
      itemCount: 0,
      itemBuilder: (context, index) => const SizedBox(),
    );
  }
}
