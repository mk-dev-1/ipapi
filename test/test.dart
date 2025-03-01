import 'package:collection/collection.dart';
import 'package:ipapi/ipapi.dart';
import 'package:ipapi/models/geo_data.dart';
import 'package:test/test.dart';

void main() {
  String ip = '172.217.0.0';

  List<String> standardFields = [
    'status',
    'country',
    'countryCode',
    'region',
    'regionName',
    'city',
    'zip',
    'lat',
    'lon',
    'timezone',
    'isp',
    'org',
    'as',
    'query',
  ];

  List<String> optionalFields = [
    'continent',
    'continentCode',
    'district',
    'offset',
    'currency',
    'asname',
    'reverse',
    'mobile',
    'proxy',
    'hosting',
  ];

  Map<String, String> languageCheck = {
    'en': 'United States',
    'de': 'Vereinigte Staaten von Amerika',
    'es': 'Estados Unidos de América (los)',
    'pt-BR': 'Estados Unidos',
    'fr': 'États-Unis',
    'ja': 'アメリカ合衆国',
    'zh-CN': '美国',
    'ru': 'США',
  };

  test('FREE API - Test response contains expected keys only', () async {
    Map<String, dynamic>? result = await IpApi.getRawData(ip: ip);
    final bool equal = const ListEquality().equals(
      result?.keys.toList() ?? [],
      standardFields,
    );
    expect(equal, true);
  });

  test('FREE Api - Test response mapping to GeoData model', () async {
    GeoData? result = await IpApi.getData(ip: ip);

    expect(result?.query, equals(ip));
    expect(result?.status, equals('success'));
    expect(result?.country, equals('United States'));
    expect(result?.countryCode, equals('US'));
    expect(result?.region, equals('IL'));
    expect(result?.regionName, equals('Illinois'));
    expect(result?.city, equals('Chicago'));
    expect(result?.zip, equals('60666'));
    expect(result?.lat, equals(41.8781));
    expect(result?.lon, equals(-87.6298));
    expect(result?.timezone, equals('America/Chicago'));
    expect(result?.isp, equals('Google LLC'));
    expect(result?.org, equals('Google LLC'));
    expect(result?.asno, equals('AS15169 Google LLC'));
  });

  test('FREE API - Test optional fields only', () async {
    Map<String, dynamic>? result = await IpApi.getRawData(
      ip: ip,
      fields: optionalFields,
    );
    final bool equal = const ListEquality().equals(
      result?.keys.toList() ?? [],
      optionalFields,
    );
    expect(equal, true);
  });

  test('FREE Api - Test optional fields response mapping to GeoData model',
      () async {
    GeoData? result = await IpApi.getData(ip: ip, fields: optionalFields);

    expect(result?.query, equals(null));
    expect(result?.status, equals(null));
    expect(result?.country, equals(null));
    expect(result?.countryCode, equals(null));
    expect(result?.region, equals(null));
    expect(result?.regionName, equals(null));
    expect(result?.city, equals(null));
    expect(result?.zip, equals(null));
    expect(result?.lat, equals(null));
    expect(result?.lon, equals(null));
    expect(result?.timezone, equals(null));
    expect(result?.isp, equals(null));
    expect(result?.org, equals(null));
    expect(result?.asno, equals(null));

    expect(result?.continent, equals('North America'));
    expect(result?.continentCode, equals('NA'));
    expect(result?.district, equals(''));
    expect(result?.offset, equals(-21600));
    expect(result?.currency, equals('USD'));
    expect(result?.asname, equals('GOOGLE'));
    expect(result?.reverse, equals('ord38s04-in-f0.1e100.net'));
    expect(result?.mobile, equals(false));
    expect(result?.proxy, equals(false));
    expect(result?.hosting, equals(true));
  });

  for (MapEntry<String, String> l in languageCheck.entries) {
    test('FREE Api - Test country name localization (${l.key})', () async {
      GeoData? result =
          await IpApi.getData(ip: ip, lang: l.key, fields: ['country']);

      expect(result?.country, equals(l.value));
    });
  }
}
