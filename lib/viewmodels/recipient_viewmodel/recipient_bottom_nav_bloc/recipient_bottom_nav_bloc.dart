import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_drop/viewmodels/recipient_viewmodel/recipient_bottom_nav_bloc/recipient_bottom_nav_event.dart';
import 'package:life_drop/viewmodels/recipient_viewmodel/recipient_bottom_nav_bloc/recipient_bottom_nav_state.dart';

class RecipientBottomNavBloc
    extends Bloc<RecipientBottomNavEvent, RecipientBottomNavState> {
  RecipientBottomNavBloc()
    : super(const RecipientBottomNavState(selectedIndex: 0)) {
    on<RecipientBottomNavChanged>(recipientBottomNavChanged);
  }
  void recipientBottomNavChanged(
    RecipientBottomNavEvent event,
    Emitter<RecipientBottomNavState> emit,
  ) {
    if (event is RecipientBottomNavChanged) {
      emit(state.copyWith(selectedIndex: event.index));
    }
  }
}
