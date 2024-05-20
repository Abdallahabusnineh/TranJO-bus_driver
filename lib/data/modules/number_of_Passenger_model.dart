import '../../domain/entites/number_of_passenger.dart';

class NumberOfPassengerModel extends NumberOfPassenger{
  NumberOfPassengerModel({required super.numberOfPassenger});

  factory NumberOfPassengerModel.fromJson( json) =>
      NumberOfPassengerModel(
   numberOfPassenger: json);
}