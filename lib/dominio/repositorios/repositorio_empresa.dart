
import 'package:manhatan/dominio/entidades/locales/empresa.dart';

abstract class RepositorioEmpresa 
{    
      Future<dynamic> insertar (Empresa dato);    
      Future<Empresa> buscarUno (String codigo);
// no lo implemento por que la consulta en concreto debe ser por cada repositorio de acuerdo a sus necesidades
      Future<List<Empresa>> buscarConsulta (String consulta, int limite);  

}