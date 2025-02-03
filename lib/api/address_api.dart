import 'package:myapp/domain/address.dart';
import 'package:dio/dio.dart';

class AddressApi {
  final domain = 'https://brasilapi.com.br/api';
  final dio = Dio();

  Future<Address> findAddressByCep(String cep) async {
    final response = await dio.get('$domain/ddd/v1/{ddd}');
    Address address = Address.fromJson(response.data);

    print(response);
    return address;
  }
}