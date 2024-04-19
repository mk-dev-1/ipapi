import 'package:json_annotation/json_annotation.dart';

part 'geo_data.g.dart';

/// [GeoData] will be returned as a result from [getData] and provides
/// structured access to the geo data returned from IP-API.com as json
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
  double? lon;
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
    this.lon,
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

  /// Factory method to transform json data returned by IP-API.com to [GeoData]
  factory GeoData.fromJson(Map<String, dynamic> json) =>
      _$GeoDataFromJson(json);

  /// Helper method to transform [GeoData] back into json format
  Map<String, dynamic> toJson() => _$GeoDataToJson(this);
}
