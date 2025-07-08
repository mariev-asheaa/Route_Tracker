import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:route_tracking/models/Place_Details_Model.dart';
import 'package:route_tracking/models/Places_Autocomplete_Model.dart';

class PlacesService
{
  Dio dio=Dio();
  String baseUrl='https://maps.googleapis.com/maps/api/place';
  String apiKey = dotenv.env['GOOGLE_MAPS_API_KEY'] ?? '';

  Future<List<PlacesAutocompleteModel>> getPredictions({required String input,required String sessionToken}) async {
    try {
      Response response = await dio.get("$baseUrl/autocomplete/json?key=$apiKey&input=$input&sessiontoken=$sessionToken");

      var data = response.data['predictions'];

      List<PlacesAutocompleteModel>places=[];
      for(var item in data)
        {
          places.add(PlacesAutocompleteModel.fromJson(item));
        }
      return places;

    } on DioException catch (e) {
      print("Dio error: ${e.message}");
      throw Exception(e);
    }
  }

  Future<PlaceDetailsModel> getPlaceDetails({required String placeId}) async {
    try {
      Response response = await dio.get("$baseUrl/details/json?key=$apiKey&place_id=$placeId");
      return PlaceDetailsModel.fromJson(response.data['result']);

    } on DioException catch (e) {
      print("Dio error: ${e.message}");
      throw Exception(e);
    }
  }
}