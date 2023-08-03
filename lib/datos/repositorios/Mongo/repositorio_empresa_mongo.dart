import 'package:get_it/get_it.dart';
import 'package:manhatan/datos/servicios/conexion_mongo.dart';
import 'package:manhatan/dominio/entidades/mongo/empresa_mongo.dart';
import 'package:manhatan/dominio/repositorios/repositorio_empresa.dart';

import '../../../dominio/entidades/locales/empresa.dart';
import '../../servicios/conexion_db.dart';

class RepositorioEmpresaMongo extends RepositorioEmpresa
{
      ConexionDB db =  GetIt.instance.get<ConexionDB>();
      String coleccion ="Empresa";
      @override
      Future<dynamic> insertar (Empresa dato) async 
      {
          ConexionMongo conexion = db as ConexionMongo;   
          var dataFormateada = EmpresaMongo.Empresa(dato);
          dato.codigo =   dataFormateada.id.$oid;
          await conexion.insertar(coleccion,dataFormateada);     
      }
      
        @override
        Future<List<Empresa>> buscarConsulta(String consulta, int limite) {
          // TODO: implement buscarConsulta
          throw UnimplementedError();
        }
      
        @override
        Future<Empresa> buscarUno(String codigo)  async
        {
           ConexionMongo conexion = db as ConexionMongo;        
           var dataMongo = await conexion.buscarUno(coleccion, codigo);
           EmpresaMongo dataCruda = EmpresaMongo.fromJson(dataMongo);
           return dataCruda.entidadBase();
        }                        
}