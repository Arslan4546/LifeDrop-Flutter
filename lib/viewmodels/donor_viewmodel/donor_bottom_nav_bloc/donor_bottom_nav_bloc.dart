import 'package:life_drop/viewmodels/donor_viewmodel/donor_bottom_nav_bloc/donor_bottom_nav_event.dart';
import 'package:life_drop/viewmodels/donor_viewmodel/donor_bottom_nav_bloc/donor_bottom_nav_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DonorBottomNavBloc
    extends Bloc<DonorBottomNavEvent, DonorBottomNavState> {
  DonorBottomNavBloc() : super(const DonorBottomNavState(selectedIndex: 0)) {
    on<DonorBottomNavChanged>(donorBottomNavChanged);
  }
  void donorBottomNavChanged(
    DonorBottomNavEvent event,
    Emitter<DonorBottomNavState> emit,
  ) {
    if (event is DonorBottomNavChanged) {
      emit(state.copyWith(selectedIndex: event.index));
    }
  }
}
