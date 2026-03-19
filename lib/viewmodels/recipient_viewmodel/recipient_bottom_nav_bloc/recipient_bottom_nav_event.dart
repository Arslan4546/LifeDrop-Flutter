import 'package:equatable/equatable.dart';

abstract class RecipientBottomNavEvent extends Equatable {
  const RecipientBottomNavEvent();

  @override
  List<Object> get props => [];
}

class RecipientBottomNavChanged extends RecipientBottomNavEvent {
  final int index;

  const RecipientBottomNavChanged(this.index);

  @override
  List<Object> get props => [index];
}
