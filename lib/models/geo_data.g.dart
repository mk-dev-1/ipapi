// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoData _$GeoDataFromJson(Map<String, dynamic> json) => GeoData(
      lang: json['lang'] as String?,
      query: json['query'] as String?,
      status: json['status'] as String?,
      continent: json['continent'] as String?,
      continentCode: json['continentCode'] as String?,
      country: json['country'] as String?,
      countryCode: json['countryCode'] as String?,
      region: json['region'] as String?,
      regionName: json['regionName'] as String?,
      city: json['city'] as String?,
      district: json['district'] as String?,
      zip: json['zip'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      long: (json['long'] as num?)?.toDouble(),
      timezone: json['timezone'] as String?,
      offset: json['offset'] as int?,
      currency: json['currency'] as String?,
      isp: json['isp'] as String?,
      org: json['org'] as String?,
      asno: json['as'] as String?,
      asname: json['asname'] as String?,
      mobile: json['mobile'] as bool?,
      proxy: json['proxy'] as bool?,
      hosting: json['hosting'] as bool?,
    );

Map<String, dynamic> _$GeoDataToJson(GeoData instance) => <String, dynamic>{
      'lang': instance.lang,
      'query': instance.query,
      'status': instance.status,
      'continent': instance.continent,
      'continentCode': instance.continentCode,
      'country': instance.country,
      'countryCode': instance.countryCode,
      'region': instance.region,
      'regionName': instance.regionName,
      'city': instance.city,
      'district': instance.district,
      'zip': instance.zip,
      'lat': instance.lat,
      'long': instance.long,
      'timezone': instance.timezone,
      'offset': instance.offset,
      'currency': instance.currency,
      'isp': instance.isp,
      'org': instance.org,
      'as': instance.asno,
      'asname': instance.asname,
      'mobile': instance.mobile,
      'proxy': instance.proxy,
      'hosting': instance.hosting,
    };
