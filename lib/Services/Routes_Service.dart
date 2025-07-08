import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:route_tracking/models/Routes_Model.dart';
import 'package:route_tracking/models/Routes_Post_Body_Model.dart';

class RoutesService
{
  String baseUrl='https://routes.googleapis.com/directions/v2:computeRoutes';
  String apiKey = dotenv.env['GOOGLE_MAPS_API_KEY'] ?? '';

  Dio dio=Dio();
  Future<RoutesModel>fetchRoutes({required RoutesPostBodyModel routesPostBodyModel})async
  {


   Map<String,String>headers=
       {
         'Content-Type': 'application/json',
         'X-Goog-Api-Key':apiKey,
         'X-Goog-FieldMask': 'routes.duration,routes.distanceMeters,routes.polyline.encodedPolyline'
       };
   Map<String,dynamic>body=routesPostBodyModel.toJson();

   try{
     Response response=await dio.post(
         baseUrl,
         data:body,
         options: Options(headers: headers)
     );
     return RoutesModel.fromJson(response.data);
   }
   on DioException catch(e){
     throw Exception(e.toString());
   }
  }

}