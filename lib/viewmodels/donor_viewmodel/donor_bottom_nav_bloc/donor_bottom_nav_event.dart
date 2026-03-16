import 'package:equatable/equatable.dart';

abstract class DonorBottomNavEvent extends Equatable {
  const DonorBottomNavEvent();

  @override
  List<Object> get props => [];
}

class DonorBottomNavChanged extends DonorBottomNavEvent {
  final int index;

  const DonorBottomNavChanged(this.index);

  @override
  List<Object> get props => [index];
}
