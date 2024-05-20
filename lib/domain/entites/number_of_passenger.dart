import 'package:equatable/equatable.dart';

class NumberOfPassenger extends Equatable{
  final String numberOfPassenger;
  NumberOfPassenger({required this.numberOfPassenger});
  @override
  // TODO: implement props
  List<Object?> get props =>[numberOfPassenger];

}