
import 'package:manhatan/dominio/entidades/locales/empresa.dart';

abstract class RepositorioEmpresa 
{    
      Future<dynamic> insertar (Empresa dato);    
      Future<Empresa> buscarUno (String codigo);
      Future<List<Empresa>> buscarConsulta (String consulta, int limite);  
}