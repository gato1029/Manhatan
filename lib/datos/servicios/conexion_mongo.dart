
import 'package:manhatan/utils/constantes_db.dart';
import 'package:manhatan/datos/servicios/conexion_db.dart';
import 'package:manhatan/dominio/entidades/mongo/generico_mongo.dart';
import 'package:mongo_dart/mongo_dart.dart';

class ConexionMongo extends ConexionDB
{  
   late Db db; 

  @override
  Future<dynamic> conectar () async {
    db = await Db.create(MONGO_CONEXION_URL);
    await db.open();      
    }

  @override
  Future cerrar() async {
    await db.close();    
  }
  

  Future<String> insertar(String coleccion, GenericoMongo mongoData) async {    
    //verifica siempre si la conexion esta vigente, si no vuelve a realizar una conexion
    if(!db.isConnected)
    {
      await conectar();
    }

    try {      
        var dbColeccion = db.collection(coleccion);     
          var resultado = await dbColeccion.insertOne(mongoData.objetoABson());         
        if (resultado.isSuccess)
        {      
          return "OK";
        }
        print("Error: A ocurrido un error en la inserccion"); // cambiarlo por interrupciones widgets

        return "Error: A ocurrido un error en la inserccion";
    } catch (e) {
      print("catch"+e.toString()); // cambiarlo por interrupciones widgets
      return e.toString();
    }  
  }

  Future<dynamic> buscarConsulta(String coleccion,dynamic consulta)  async
  {            
      if(!db.isConnected)
      {
        await conectar();
      }
      try {      
          var dbColeccion = db.collection(coleccion);     
          var resultado = await dbColeccion.find(consulta);         
          if (resultado == null)
          {
            print("Error: Documento no encontrado");
            return null;
          }                
          return resultado;
      } catch (e) {
        print("Error: Buscar Uno "+e.toString()); // cambiarlo por interrupciones widgets
          return null;
      }  
  }

  Future<dynamic> buscarUno(String coleccion,String codigo)  async
  {            
      if(!db.isConnected)
      {
        await conectar();
      }
      try {      
          var dbColeccion = db.collection(coleccion);     
          var resultado = await dbColeccion.findOne(where.eq('_id', ObjectId.fromHexString(codigo)));         
          if (resultado == null)
          {
            print("Error: Documento no encontrado");
            return null;
          }                
          return resultado;
      } catch (e) {
        print("Error: Buscar Uno "+e.toString()); // cambiarlo por interrupciones widgets
          return null;
      }  
  }                        
}