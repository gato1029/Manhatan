import 'package:manhatan/dominio/entidades/locales/empresa.dart';
import 'package:manhatan/dominio/entidades/mongo/generico_mongo.dart';



import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'dart:convert';

class EmpresaMongo extends GenericoMongo {
     
    @override
    String coleccion = "Empresa"; // nombre de la coleccion en mongo
    
    late mongo.ObjectId id;
    late String nombre;
    late String correo;

    EmpresaMongo.Empresa(Empresa empresa)
    {
        this.id = mongo.ObjectId();      
        
        this.correo = empresa.correo;
        this.nombre = empresa.nombre;      
    }

    EmpresaMongo( String nombre, String correo)
    {
      this.id = mongo.ObjectId();      
      this.correo = correo;
      this.nombre = nombre;
      
    }

    EmpresaMongo.json(mongo.ObjectId id, String nombre, String correo)
    {
      id = id;      
      this.correo = correo;
      this.nombre = nombre;
    }

    factory EmpresaMongo.fromRawJson(String str) {
      return EmpresaMongo.fromJson(json.decode(str));
    }

    String toRawJson() {
      return json.encode(objetoABson());
    }

    factory EmpresaMongo.fromJson(Map<String, dynamic> json) 
    {
      var data = EmpresaMongo.json(json["_id"], json["nombre"], json["correo"]);
      return data;
    }


      @override
      Map<String, dynamic> objetoABson() => {
       "_id": id.toJson(),
        "nombre": nombre,
        "correo": correo,
      };
    
  
}