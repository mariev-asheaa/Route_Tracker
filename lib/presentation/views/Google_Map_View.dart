import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:route_tracking/core/Custom_Button.dart';
import 'package:route_tracking/core/Text_Field.dart';
import 'package:route_tracking/models/Info_Window_Model.dart';
import 'package:route_tracking/models/Routes_Post_Body_Model.dart';
import 'package:route_tracking/presentation/widgets/Place_Info_Window.dart';
import 'package:route_tracking/presentation/widgets/Results_ListView.dart';
import 'package:uuid/uuid.dart';
import '../../Services/Location_Service.dart';
import '../../Services/Places_Service.dart';
import '../../Services/Routes_Service.dart';
import '../../models/Places_Autocomplete_Model.dart';

class GoogleMapView extends StatefulWidget {
  const GoogleMapView({super.key});

  @override
  State<GoogleMapView> createState() => _GoogleMapViewState();
}

class _GoogleMapViewState extends State<GoogleMapView> {
  late CameraPosition cameraPosition;
  late LocationService locationService;
  late GoogleMapController googleMapController;
  late TextEditingController textEditingController;
  late PlacesService googleMapsPlaceService;
  late Uuid uuid;
  late RoutesService routesService;
  late LatLng destination;
  late LatLng curruntLocation;
  String? sessiontoken;
  Timer?debounce;
  Set<Marker>markers={};
  Set<Polyline>polylines={};
  List<PlacesAutocompleteModel>places=[];

  @override
  void initState() {
    routesService=RoutesService();
    uuid=Uuid();
    textEditingController=TextEditingController();
    googleMapsPlaceService=PlacesService();
    locationService=LocationService();
    cameraPosition=CameraPosition(target: LatLng(0, 0));

    fetchPredictions();
    super.initState();
  }
  @override
  void dispose() {
   textEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: cameraPosition,
          markers: markers,
          polylines: polylines,
          onMapCreated: (controller)
          {
            googleMapController=controller;
            updateCurrentLocation();
          },
          zoomControlsEnabled: false,
        ),
        Positioned(
            left: 16,
            right: 16,
            top: 16,
            child: Column(
              children: [
                CustomTextField(textEditingController: textEditingController,),
               Divider(height: 0,),
                ResultsListview(
                  places: places,
                  googleMapsPlaceService: googleMapsPlaceService,

                  onPlaceSelected: (placeDetails) async {
                  textEditingController.clear(); //clear text field
                  places.clear();                //clear the list
                  setState(() {});
                   sessiontoken=null;
                   destination=LatLng(
                       placeDetails.geometry!.location!.lat!.toDouble(),
                       placeDetails.geometry!.location!.lng!.toDouble()
                   );
                  var points= await getRouteData();
                  displayRoute(points);
                   var distinationMarker=Marker (
                     onTap: (){
                       showDialog(
                         context: context,
                         builder: (context) => Center(
                           child: Dialog(
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(12),
                             ),
                             child: SizedBox(
                               width: MediaQuery.of(context).size.width * 0.8,
                               height: MediaQuery.of(context).size.width * 0.9,
                               child: SingleChildScrollView(
                                 padding: EdgeInsets.all(16),
                                 child: PlaceInfoWindow(
                                   infoWindowModel: InfoWindowModel(
                                     placeDetails.photos?.first.photoReference ?? '',
                                     placeDetails.name!,
                                     placeDetails.editorialSummary?.overview ?? '',
                                     placeDetails.rating ?? 0,
                                   ),
                                 ),
                               ),
                             ),
                           ),
                         ),
                       );
                     },
                       markerId: MarkerId('destnation'),
                   position: destination,
                   icon:await BitmapDescriptor.asset(ImageConfiguration(),'assets/location.png')
                   );
                   markers.add(distinationMarker);
                   setState(() {});
                  },
                ),
              ],
            )),
        Positioned(
          bottom: 70,
            left: 30,
            right: 30,
            child: CustomButton(
              onPressed: () {
                getDirections();
              }
              ,)
        ),
      ],
    );
  }


  void fetchPredictions() {
    textEditingController.addListener((){
      if(debounce?.isActive??false){
        debounce?.cancel();
      }
      debounce=Timer(Duration(milliseconds: 100), () async {//indicates the time to make a new request
        sessiontoken ??= uuid.v4();
        if(textEditingController.text.isNotEmpty)
        {
          var result=await googleMapsPlaceService.getPredictions(
              input: textEditingController.text,
              sessionToken: sessiontoken!
          );
          places.clear();
          places.addAll(result);
          setState(() {});
        }
        else{
          places.clear();
          setState(() {});
        }
      });
    });
  }

  void updateCurrentLocation() async{
   try
       {
          var locationData=await locationService.getLocation();
          curruntLocation=LatLng(locationData.latitude!, locationData.longitude!);
          CameraPosition newPosition=
          CameraPosition(target: curruntLocation,zoom: 12);
          googleMapController.animateCamera(CameraUpdate.newCameraPosition(newPosition));

          Marker currentLocation=Marker(markerId: MarkerId('currentLocation'),
              position: curruntLocation);
          markers.add(currentLocation);
          setState(() {});
       }
       on LocationServiceException catch(e){}
       on LocationPermissionException catch(e){}
         catch(e){}
  }

  Future<List<LatLng>> getRouteData() async{ //this function returns the points of the polyline
    RoutesPostBodyModel routesPostBodyModel=RoutesPostBodyModel(
      origin: Origin(
        location: Location(
         latLng: LatLngModel(
         latitude: curruntLocation.latitude,
           longitude: curruntLocation.longitude
         )
        )
      ),
      destination: Destination(
          location: Location(
              latLng: LatLngModel(
               latitude: destination.latitude,
                  longitude: destination.longitude
              )
          )
      )
    );
var routes=await routesService.fetchRoutes(routesPostBodyModel:routesPostBodyModel);
    PolylinePoints polylinePoints = PolylinePoints();
    List<PointLatLng> result = polylinePoints.decodePolyline(
        routes.routes!.first.polyline!.encodedPolyline!);

   List<LatLng>points=result.map((e)=>LatLng(e.latitude, e.longitude)).toList();
   return points;
  }

  void displayRoute(List<LatLng> points)
  {
Polyline route=Polyline(
    polylineId: PolylineId('route'),
    points: points,
    color: Colors.blue,
    width: 5
);
polylines.add(route);
setState(() {});
LatLngBounds latLngBounds=getLatlngBounds(points);
googleMapController.animateCamera(CameraUpdate.newLatLngBounds(latLngBounds, 32));
  }

  LatLngBounds getLatlngBounds(List<LatLng> points) {
    //southwest is the min latlng , northeast is the max latlng

var southwestlat=points.first.latitude;
var southwestlng=points.first.longitude;
var northeastlat=points.first.latitude;
var northeastlng=points.first.longitude;
for(var point in points){
  southwestlat=min(southwestlat, point.latitude);
  southwestlng=min(southwestlng, point.longitude);
  northeastlat=max(northeastlat, point.latitude);
  northeastlng=max(northeastlng, point.longitude);
}
return LatLngBounds(southwest: LatLng(southwestlat, southwestlng),
    northeast: LatLng(northeastlat, northeastlng));
  }

  Future<void> getDirections() async {
    locationService.getRealTimeLocationData((locationData){
      curruntLocation=LatLng(locationData.latitude!, locationData.longitude!);
      CameraPosition newPosition=
      CameraPosition(target: curruntLocation,zoom: 20);
      googleMapController.animateCamera(CameraUpdate.newCameraPosition(newPosition));
    });
  }
}