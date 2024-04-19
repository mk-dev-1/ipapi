library ipapi;

import 'dart:convert';

import 'package:http/http.dart';

import 'models/geo_data.dart';

/// [IpApi] encapsules functions that query endpoints at IP-API.com,
/// specifically [getData], which retrieves geo data for a given [ip].
class IpApi {
  /// Get geo data from IP-API.com as GeoData object.
  ///
  /// To query a different than the current IP, specify it using [ip]. API
  /// response is provided in English unless a different language is specified
  /// using [lang]. To receive only specific fields from the API specify them
  /// using [fields]. Finally, if IP-API.com's pro version should be used,
  /// specify a valid API key using [apiKey]. Note that the free version uses
  /// HTTP while the pro version uses HTTPS.
  static Future<GeoData?> getData({
    String? ip,
    String? lang,
    List<String> fields = const [],
    String? apiKey,
  }) async =>
      getRawData(
        ip: ip,
        lang: lang,
        fields: fields,
        apiKey: apiKey,
      ).then((data) => data != null ? GeoData.fromJson(data) : null);

  /// Get geo data from IP-API.com as json.
  ///
  /// To query a different than the current IP, specify it using [ip]. API
  /// response is provided in English unless a different language is specified
  /// using [lang]. To receive only specific fields from the API specify them
  /// using [fields]. Finally, if IP-API.com's pro version should be used,
  /// specify a valid API key using [apiKey]. Note that the free version uses
  /// HTTP while the pro version uses HTTPS.
  static Future<Map<String, dynamic>?> getRawData({
    String? ip,
    String? lang,
    List<String> fields = const [],
    String? apiKey,
  }) async {
    return get(Uri(
      scheme: apiKey != null ? 'https' : 'http',
      host: apiKey != null ? 'pro.ip-api.com' : "ip-api.com",
      path: '/json/${ip ?? ''}',
      queryParameters: {
        if (apiKey != null) 'key': apiKey,
        if (lang != null) 'lang': lang,
        if (fields.isNotEmpty) 'fields': fields.join(',')
      },
    )).then((response) =>
        response.statusCode == 200 ? jsonDecode(response.body) : null);
  }
}
