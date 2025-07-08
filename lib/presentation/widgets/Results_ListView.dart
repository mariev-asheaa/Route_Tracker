import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:route_tracking/models/Place_Details_Model.dart';
import 'package:route_tracking/models/Places_Autocomplete_Model.dart';

import '../../Services/Places_Service.dart';

class ResultsListview extends StatelessWidget {
  const ResultsListview({super.key,required this.places, required this.googleMapsPlaceService, required this.onPlaceSelected});
    final  List<PlacesAutocompleteModel>places;
    final PlacesService googleMapsPlaceService;

    final Function(PlaceDetailsModel) onPlaceSelected;
    //when we want an action to affect 2 separated widgets
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context,index)
          {
        return InkWell(
          onTap: ()async{
         var placeDetails=
         await googleMapsPlaceService.getPlaceDetails(placeId: places[index].placeId.toString());
         onPlaceSelected(placeDetails);
          },
          child: ListTile(
            leading: Icon(Icons.location_on_outlined),
            title: Text(places[index].description!),
            trailing: Icon(Icons.arrow_circle_right_outlined),
          ),
        );
          },
          separatorBuilder:(context,index)
          {
          return Divider(
            height: 0,
          );
          }, itemCount: places.length),
    );
  }
}
