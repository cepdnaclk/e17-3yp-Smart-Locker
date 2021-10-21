import 'package:json_annotation/json_annotation.dart';

part 'LocationsModel.g.dart';

@JsonSerializable()
class LocationsModel {
  String? LocationID;
  String? Longitude;
  String? Latitude;
  String? LocationDescription;
  String? LocationUrl;
  LocationsModel(
      {this.LocationID,
      this.Longitude,
      this.Latitude,
      this.LocationDescription,
      this.LocationUrl});
  factory LocationsModel.fromJson(Map<String, dynamic> json) =>
      _$LocationsModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocationsModelToJson(this);
}
