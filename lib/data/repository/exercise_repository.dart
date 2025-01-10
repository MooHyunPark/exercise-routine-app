
import 'package:dio/dio.dart';
import 'package:projectsampledata/_core/utils/http_util.dart';

class ExerciseRepository{
  const ExerciseRepository();

  Future<Map<String,dynamic>> findByFitnessId(int id) async{
    Response response = await dio.get("/fitness/${id}");
    Map<String,dynamic> body = response.data;
    return body;
  }
  
  Future<Map<String,dynamic>> saveExercise(int id, Map<String,dynamic> data) async{
    print("작동은 하는중");
    Response response = await dio.post("/api/plan/${id}", data: data);
    Map<String,dynamic> body = response.data;
    return body;
  }
}