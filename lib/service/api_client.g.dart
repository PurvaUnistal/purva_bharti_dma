// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://citygas.hpcl.co.in/uat/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<OfflineResponse> login(map) async {
    ArgumentError.checkNotNull(map, 'map');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/api/saveCustomerRegistrationOffline',
        queryParameters: queryParameters,options: Options(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
          //  baseUrl:baseUrl
        ),
        data: _data);
    final value = OfflineResponse.fromJson(_result.data);
    return value;
  }
}
