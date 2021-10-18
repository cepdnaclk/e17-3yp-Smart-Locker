// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LocationsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationsModel _$LocationsModelFromJson(Map<String, dynamic> json) {
  return LocationsModel(
    LocationID: json['LocationID'] as String?,
    Longitude: json['Longitude'] as String?,
    Latitude: json['Latitude'] as String?,
    LocationDescription: json['LocationDescription'] as String?,
    LocationUrl: json['LocationUrl'] as String?,
  );
}

Map<String, dynamic> _$LocationsModelToJson(LocationsModel instance) =>
    <String, dynamic>{
      'LocationID': instance.LocationID,
      'Longitude': instance.Longitude,
      'Latitude': instance.Latitude,
      'LocationDescription': instance.LocationDescription,
      'LocationUrl': instance.LocationUrl,
    };
