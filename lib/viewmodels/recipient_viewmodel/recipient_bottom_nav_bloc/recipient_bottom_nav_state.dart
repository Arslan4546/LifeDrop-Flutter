import 'package:equatable/equatable.dart';

class RecipientBottomNavState extends Equatable {
  final int selectedIndex;

  const RecipientBottomNavState({required this.selectedIndex});

  @override
  List<Object> get props => [selectedIndex];

  RecipientBottomNavState copyWith({int? selectedIndex}) {
    return RecipientBottomNavState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
