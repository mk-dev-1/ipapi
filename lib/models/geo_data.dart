import 'package:json_annotation/json_annotation.dart';

part 'geo_data.g.dart';

@JsonSerializable()
class GeoData {
  String? lang;
  String? query;
  String? status;
  String? continent;
  String? continentCode;
  String? country;
  String? countryCode;
  String? region;
  String? regionName;
  String? city;
  String? district;
  String? zip;
  double? lat;
  double? long;
  String? timezone;
  int? offset;
  String? currency;
  String? isp;
  String? org;
  @JsonKey(name: 'as')
  String? asno;
  String? asname;
  bool? mobile;
  bool? proxy;
  bool? hosting;

  GeoData({
    this.lang,
    this.query,
    this.status,
    this.continent,
    this.continentCode,
    this.country,
    this.countryCode,
    this.region,
    this.regionName,
    this.city,
    this.district,
    this.zip,
    this.lat,
    this.long,
    this.timezone,
    this.offset,
    this.currency,
    this.isp,
    this.org,
    this.asno,
    this.asname,
    this.mobile,
    this.proxy,
    this.hosting,
  });
  factory GeoData.fromJson(Map<String, dynamic> json) =>
      _$GeoDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GeoDataToJson(this);
}
