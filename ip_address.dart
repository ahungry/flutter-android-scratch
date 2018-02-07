library ip_address;

import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'dart:core';

class IPAddress {
  var url = 'https://httpbin.org/ip';
  var httpClient = new HttpClient();

  Future<String> get() async {
    String result;

    try {
      // var uri = new Uri.http(
      //     'example.com', '/path1/path2', {'param1': 42, 'param2': 'foo' });
      var request = await this.httpClient.getUrl(Uri.parse(this.url));
      var response = await request.close();

      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(UTF8.decoder).join();
        // Map<String, dynamic> data = JSON.decode(json) as Map<String, dynamic>;
        Map<String, String> data = JSON.decode(json) as Map<String, String>;
        result = data['origin'];
      } else {
        result =
          'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }

    return result;
  }
}
