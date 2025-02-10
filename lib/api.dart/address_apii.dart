import 'package:aula_923/domain/address.dart';
import 'package:dio/dio.dart';

class AddressApi {
  final domain = 'https://brasilapi.com.br/api/cptec/v1/cidade';
  final dio = Dio();

  Future<Address> findAddressByCep(String cep) async {
    final response = await dio.get('$domain/cptec/v2/$cptec');
    Address address = Address.fromJson(response.data);

    print(response);
    return address;
  }
}