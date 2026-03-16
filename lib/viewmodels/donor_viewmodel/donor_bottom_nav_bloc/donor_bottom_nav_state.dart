import 'package:equatable/equatable.dart';

class DonorBottomNavState extends Equatable {
  final int selectedIndex;

  const DonorBottomNavState({required this.selectedIndex});

  @override
  List<Object> get props => [selectedIndex];
}
