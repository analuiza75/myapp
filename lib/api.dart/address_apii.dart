import 'package:dio/dio.dart';
import 'package:myapp/domain/address.dart';

class AddressApi {
  final domain = 'https://brasilapi.com.br/api/cptec/v1/cidade';
  final dio = Dio();

  Future<Address> findAddressByCep(String cptec) async {
    final response = await dio.get('$domain/cptec/v2/$cptec');
    Address address = Address.fromJson(response.data);

    print(response);
    return address;
  }
}