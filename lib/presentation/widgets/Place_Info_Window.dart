import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:route_tracking/models/Info_Window_Model.dart';

class PlaceInfoWindow extends StatelessWidget {
  const PlaceInfoWindow({super.key, required this.infoWindowModel});
final InfoWindowModel infoWindowModel;
  @override
  Widget build(BuildContext context) {
    String getPhotoUrl(String photoReference) {
      String apiKey = dotenv.env['GOOGLE_MAPS_API_KEY'] ?? '';
      return 'https://maps.googleapis.com/maps/api/place/photo'
          '?maxwidth=400'
          '&photoreference=$photoReference'
          '&key=$apiKey';
    }
    final String imageUrl = getPhotoUrl(infoWindowModel.image);
    return Container(
      color: Colors.white,
      child: Column(
          mainAxisSize: MainAxisSize.min,
        children: [
         Image.network(imageUrl),
          Text(infoWindowModel.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22)
            ,),

          Text(infoWindowModel.overview,style: TextStyle(fontSize: 16),),
          Row(
            children: [
              Icon(Icons.star,color: Colors.yellow,),
              Text(infoWindowModel.rating.toString(),
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)
                ,),
            ],
          )
        ],
      ),
    );
  }
}
