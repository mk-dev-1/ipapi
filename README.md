# ipapi

Geolocation plugin for Flutter using IP-API.com's IP Geolocation API.

## Features

- Supports all platforms
- Supports both free & pro access to IP-API.com
- Free access does not require an API key.

## Usage

To use this plugin, add `ipapi` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/platform-integration/platform-channels).

### Examples

Here are small examples that show you how to use the API.

```dart
// Obtain all available information for the current IP using the free API
final GeoData? geoData = await IpApi.getData();
print(geoData?.toJson());
/* Prints
{
    "query": "172.217.0.0",
    "status": "success",
    "continent": "North America",
    "continentCode": "NA",
    "country": "United States",
    "countryCode": "US",
    "region": "OH",
    "regionName": "Ohio",
    "city": "Columbus",
    "district": "",
    "zip": "43212",
    "lat": 39.9881,
    "lon": -83.0479,
    "timezone": "America/New_York",
    "offset": -14400,
    "currency": "USD",
    "isp": "Google LLC",
    "org": "Google LLC",
    "as": "AS15169 Google LLC",
    "asname": "GOOGLE",
    "mobile": false,
    "proxy": false,
    "hosting": true
}
*/

// Obtain all available information for an IP different to the current IP using the free API, using German language and querying selected fields only
final GeoData? geoData = await IpApi.getData({
    ip: '172.217.0.0',
    lang: 'de',
    fields: ['country'],
});
print(geoData?.country); // prints 'Vereinigte Staaten'
print(geoData?.city); // prints 'null' since field is not part of query

// Usage with API key automatically queries PRO API endpoint 'pro.ip-api.com'
final GeoData? geoData = await IpApi.getData({
    apiKey: 'xxxxxxxxxxxxxxx'
});
```

## List of fields

| name          | description                                                                                                  | example             | type    |
| ------------- | ------------------------------------------------------------------------------------------------------------ | ------------------- | ------- |
| status        | success or fail                                                                                              | success             | string? |
| message       | Included only when status is fail. Can be one of the following: private range, reserved range, invalid query | invalid query       | string? |
| continent     | Continent name                                                                                               | North America       | string? |
| continentCode | Two-letter continent code                                                                                    | NA                  | string? |
| country       | Country name                                                                                                 | United States       | string? |
| countryCode   | Two-letter country code ISO 3166-1 alpha-2                                                                   | US                  | string? |
| region        | Region/state short code (FIPS or ISO)                                                                        | CA or 10            | string? |
| regionName    | Region/state                                                                                                 | California          | string? |
| city          | City                                                                                                         | Mountain View       | string? |
| district      | District (subdivision of city)                                                                               | Old Farm District   | string? |
| zip           | Zip code                                                                                                     | 94043               | string? |
| lat           | Latitude                                                                                                     | 37.4192             | double? |
| lon           | Longitude                                                                                                    | -122.0574           | double? |
| timezone      | Timezone (tz)                                                                                                | America/Los_Angeles | string? |
| offset        | Timezone UTC DST offset in seconds                                                                           | -25200              | int?    |
| currency      | National currency                                                                                            | USD                 | string? |
| isp           | ISP name                                                                                                     | Google              | string? |
| org           | Organization name                                                                                            | Google              | string? |
| as            | AS number and organization, separated by space (RIR). Empty for IP blocks not being announced in BGP tables. | AS15169 Google Inc. | string? |
| asname        | AS name (RIR). Empty for IP blocks not being announced in BGP tables.                                        | GOOGLE              | string? |
| reverse       | Reverse DNS of the IP (can delay response)                                                                   | wi-in-f94.1e100.net | string? |
| mobile        | Mobile (cellular) connection                                                                                 | true                | bool?   |
| proxy         | Proxy, VPN or Tor exit address                                                                               | true                | bool?   |
| hosting       | Hosting, colocated or data center                                                                            | true                | bool?   |
| query         | IP used for the query                                                                                        | 173.194.67.94       | string? |

## Additional information

**Please note the following important information**

- We are not associated with IP-API.com in any way. This plugin is simply a wrapper around the API provided by IP-API.com. We do not assume any liability that may arise from using this plugin or the IP-API.com.
- Please note that the free version of IP-API.com's IP Geolocation API is limited to 45 requests per IP and hour and uses HTTP (**not** HTTP**S**) and may not be used for commercial purposes. Usage for commercial purposes requires a pro license.
- Please make sure to read up on the full terms of use and up-2-date API specifications directly at https://ip-api.com.
