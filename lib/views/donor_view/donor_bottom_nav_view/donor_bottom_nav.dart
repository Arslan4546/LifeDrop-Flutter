import 'package:flutter/material.dart';
import 'package:life_drop/core/constants/app_colors.dart';
import 'package:life_drop/viewmodels/donor_viewmodel/donor_bottom_nav_bloc/donor_bottom_nav_bloc.dart';
import 'package:life_drop/viewmodels/donor_viewmodel/donor_bottom_nav_bloc/donor_bottom_nav_event.dart';
import 'package:life_drop/viewmodels/donor_viewmodel/donor_bottom_nav_bloc/donor_bottom_nav_state.dart';
import 'package:life_drop/views/donor_view/donor_bottom_nav_view/donor_alert_view/donor_alert_view.dart';
import 'package:life_drop/views/donor_view/donor_bottom_nav_view/donor_profile_view/donor_profile_view.dart';
import 'package:life_drop/views/donor_view/donor_bottom_nav_view/donor_request_view/donor_request_view.dart';
import 'package:life_drop/views/donor_view/donor_bottom_nav_view/donor_search_view/donor_search_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_drop/views/donor_view/donor_home_view/donor_home_view.dart';

class DonorNavView extends StatelessWidget {
  DonorNavView({super.key});

  final List<Widget> screens = [
    const DonorHomeView(),
    const DonorSearchView(),
    DonorRequestView(),
    const DonorAlertView(),
    const DonorProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DonorBottomNavBloc, DonorBottomNavState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,

          /// Screen Switching
          body: IndexedStack(index: state.selectedIndex, children: screens),

          /// Bottom Navigation
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.cardColor,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: AppColors.textSecondaryColor,
            currentIndex: state.selectedIndex,

            onTap: (index) {
              context.read<DonorBottomNavBloc>().add(
                DonorBottomNavChanged(index),
              );
            },

            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.volunteer_activism),
                label: 'Requests',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Alerts',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
