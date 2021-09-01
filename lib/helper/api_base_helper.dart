import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:fire_pay/eceptions/exceptions.dart';
import 'package:http/http.dart' as http;




class ApiBaseHelper {
  //final String _baseUrl = Uri.parse(_baseUrl)).path;
  final String _baseUrl = 'https://mytnbapp.tnb.com.my/v6/mytnbappws.asmx';

  Uri getBaseApi( String path) {
    String _path = Uri.parse(_baseUrl).path;
    if (!_path.endsWith('/')) {
      _path += '/';
    }

    Uri.parse('uri').path;

    Uri uri = Uri(
        scheme:  Uri.parse(_baseUrl).scheme,
        host: Uri.parse(_baseUrl).host,
        port: Uri.parse(_baseUrl).port,
        path: _path + path);

    return uri;
  }

  Future<dynamic> get(String url, {Map<String, dynamic> queryParams, bool isRawData = false}) async {
    //String endPoint = _baseUrl + url;
    Uri uri = url.contains('http') ? Uri.parse(url) : getBaseApi(url);
    if(queryParams != null){
      uri = uri.replace(queryParameters: queryParams);
    }

    //String finalUrl = !isRawData ? uri.toString() : url;
    print('xx GET endPoint, url $uri');

    var responseJson;
    try {
      final response = await http.get(uri);
      if(isRawData)
        return response;
      else
        responseJson = _returnResponse(response);

    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api get recieved!');
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body) async {
    String endPoint = _baseUrl + url;
    print('xx POST endPoint, url $endPoint');
    print('xx params '+jsonEncode(body));
    var responseJson;
    try {
      //Map<String,String> headers = sm.getHeader();

      //final response = await http.post(_baseUrl + url, body: body);
      var response = await http.post(Uri.parse(endPoint),
          headers: {'Content-Type':'application/json'},
          body: jsonEncode(body));

      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api post.');
    return responseJson;
  }

  Future<dynamic> uploadFile(String url, filename) async {
    //print('Api uploadFile, url $url');

    try {
      var endPoint = Uri.parse(_baseUrl + url);
      print('xx POST MultipartFile endPoint, url $endPoint');

      var request = http.MultipartRequest('POST', endPoint);
      request.files.add(await http.MultipartFile.fromPath('ImagePath', filename));

      http.Response response = await http.Response.fromStream(await request.send());
      return _returnResponse(response);

      // http.Response.fromStream(await request.send()).then((res){
      //
      //   return _returnResponse(res);
      // });


    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> put(String url, dynamic body) async {
    print('Api Put, url $url');
    var responseJson;
    try {
      final response = await http.put(Uri.parse(_baseUrl + url), body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api put.');
    print(responseJson.toString());
    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    print('Api delete, url $url');
    var apiResponse;
    try {
      final response = await http.delete(Uri.parse(_baseUrl + url));
      apiResponse = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api delete.');
    return apiResponse;
  }

}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = response.body.toString().length == 0? jsonDecode('{"Status": "true"}') : json.decode(response.body.toString());
      print('xx response '+responseJson.toString());
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(response.body.toString());
  }
}