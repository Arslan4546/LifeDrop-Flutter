import 'package:flutter/material.dart';
import 'package:life_drop/core/constants/app_colors.dart';
import 'package:life_drop/core/constants/app_fonts.dart';
import 'package:life_drop/views/donor_view/donor_bottom_nav_view/donor_alert_view/donor_alert_view_widgets.dart';

class DonorAlertView extends StatefulWidget {
  const DonorAlertView({super.key});

  @override
  State<DonorAlertView> createState() => _DonorAlertViewState();
}

class _DonorAlertViewState extends State<DonorAlertView> {
  int _activeTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back,
          color: AppColors.textPrimaryColor,
        ),
        title: Text("Alerts", style: AppFonts.headingSmall()),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: AppColors.textPrimaryColor,
            ),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AlertsTabSelector(
            activeIndex: _activeTabIndex,
            onTabSelected: (index) => setState(() => _activeTabIndex = index),
          ),
        ),
      ),
      // --- Dynamic Body based on active tab ---
      body: AlertsTabContent(activeTabIndex: _activeTabIndex),
    );
  }
}
