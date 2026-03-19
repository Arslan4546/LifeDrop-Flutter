import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_drop/viewmodels/donor_viewmodel/donor_bottom_nav_bloc/donor_bottom_nav_bloc.dart';
import 'package:life_drop/viewmodels/recipient_viewmodel/recipient_bottom_nav_bloc/recipient_bottom_nav_bloc.dart';

class BlocProviders {
  static List<BlocProvider> providers = [
    BlocProvider<DonorBottomNavBloc>(create: (context) => DonorBottomNavBloc()),
    BlocProvider<RecipientBottomNavBloc>(
      create: (context) => RecipientBottomNavBloc(),
    ),
  ];
}
