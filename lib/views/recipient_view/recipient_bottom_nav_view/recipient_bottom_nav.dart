import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_drop/core/constants/app_colors.dart';
import 'package:life_drop/viewmodels/recipient_viewmodel/recipient_bottom_nav_bloc/recipient_bottom_nav_bloc.dart';
import 'package:life_drop/viewmodels/recipient_viewmodel/recipient_bottom_nav_bloc/recipient_bottom_nav_event.dart';
import 'package:life_drop/viewmodels/recipient_viewmodel/recipient_bottom_nav_bloc/recipient_bottom_nav_state.dart';
import 'package:life_drop/views/recipient_view/recipient_bottom_nav_view/recipient_create_request_view/recipient_create_request_view.dart';
import 'package:life_drop/views/recipient_view/recipient_bottom_nav_view/recipient_search_donor_view/recipient_search_donor_view.dart';
import 'package:life_drop/views/recipient_view/recipient_bottom_nav_view/recipient_profile_view/recipient_profile_view.dart';
import 'package:life_drop/views/recipient_view/recipient_home_view/recipient_home_view.dart';

class RecipientBottomNavView extends StatelessWidget {
  RecipientBottomNavView({super.key});

  final List<Widget> screens = [
    const RecipientHomeView(),
    const RecipientCreateRequestView(),
    const RecipientSearchDonorView(),
    const RecipientProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipientBottomNavBloc, RecipientBottomNavState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,

          /// Screen Switching
          body: IndexedStack(index: state.selectedIndex, children: screens),

          /// Bottom Navigation
          bottomNavigationBar:
              BlocBuilder<RecipientBottomNavBloc, RecipientBottomNavState>(
                builder: (context, state) {
                  return BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: AppColors.cardColor,
                    selectedItemColor: AppColors.primaryColor,
                    unselectedItemColor: AppColors.textSecondaryColor,
                    currentIndex: state.selectedIndex,

                    onTap: (index) {
                      context.read<RecipientBottomNavBloc>().add(
                        RecipientBottomNavChanged(index),
                      );
                    },

                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.list_alt),
                        label: 'Requests',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.group),
                        label: 'Donors',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: 'Profile',
                      ),
                    ],
                  );
                },
              ),
        );
      },
    );
  }
}
