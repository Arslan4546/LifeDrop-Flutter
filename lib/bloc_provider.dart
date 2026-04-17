import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_drop/data/repositries/auth_repo.dart/auth_repo.dart';
import 'package:life_drop/viewmodels/auth_viewmodel/auth_bloc/auth_bloc.dart';
import 'package:life_drop/viewmodels/donor_viewmodel/donor_bottom_nav_bloc/donor_bottom_nav_bloc.dart';
import 'package:life_drop/viewmodels/recipient_viewmodel/recipient_bottom_nav_bloc/recipient_bottom_nav_bloc.dart';

class BlocProviders {
  static List<BlocProvider> providers = [
    BlocProvider<DonorBottomNavBloc>(create: (context) => DonorBottomNavBloc()),
    BlocProvider<RecipientBottomNavBloc>(
      create: (context) => RecipientBottomNavBloc(),
    ),
    BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(authRepository: AuthRepository()),
    ),
  ];
}
