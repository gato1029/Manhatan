import 'package:get_it/get_it.dart';
import 'package:manhatan/datos/repositorios/Mongo/repositorio_empresa_mongo.dart';

import 'package:manhatan/datos/servicios/conexion_db.dart';
import 'package:manhatan/datos/servicios/conexion_mongo.dart';

import 'package:manhatan/dominio/repositorios/repositorio_empresa.dart';

class RegistradorDependencias
{
  final getIt = GetIt.instance;

  RegistradorDependencias()
  {
    registrarConexion();
    registrarRepositorios();
  }
  void registrarConexion()
  {          
      getIt.registerSingleton<ConexionDB>(ConexionMongo());   
        
  }  
  void registrarRepositorios() {
    getIt.registerSingleton<RepositorioEmpresa>(RepositorioEmpresaMongo());
  }
}