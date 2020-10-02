import 'package:ceulp.exitus/app/shared/models/perfil_model.dart';
import 'package:dio/dio.dart';

class PerfilRepository {
  final Dio dio;

  PerfilRepository(this.dio);

  // Future<List> getAll() sync {}

  Future<dynamic> create(String name) async {
    var response = await dio.post('/api/perfil');
    print(response.data);

    return response.data;
  }
}
