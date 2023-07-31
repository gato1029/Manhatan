
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
  

  Future<String> insertar(GenericoMongo mongoData) async {    
    //verifica siempre si la conexion esta vigente, si no vuelve a realizar una conexion
    if(!db.isConnected)
    {
      await conectar();
    }

    try {      
        var dbColeccion = db.collection(mongoData.coleccion);     
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
}