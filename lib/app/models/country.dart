import 'package:equatable/equatable.dart';

class Country extends Equatable {
  final int countryId;
  final String countryName;

  const Country({required this.countryId, required this.countryName});

  factory Country.fromJson(Map<String, dynamic> map) {
    return Country(
      countryId: map['id'],
      countryName: map['name'],
    );
  }

  @override
  List<Object?> get props => [countryId, countryName];

  static const empty = Country(countryId: 0, countryName: 'Select your Country');
}
