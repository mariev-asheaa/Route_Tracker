import 'package:location/location.dart';

class LocationService{
  Location location=Location();

  Future<void> checkAndRequestLocationService() async
  {
    var isLocationServiceEnabled=await location.serviceEnabled();
    if(!isLocationServiceEnabled){
      isLocationServiceEnabled= await location.requestService();
      checkAndRequestLocationPermission();
      if (!isLocationServiceEnabled) {
       throw LocationServiceException();
      }
    }
    checkAndRequestLocationPermission();
  }

  Future<void> checkAndRequestLocationPermission() async
  {
    var permissionStatus=await location.hasPermission();
    if(permissionStatus==PermissionStatus.deniedForever)
    {
      throw LocationPermissionException();
    }
    if(permissionStatus==PermissionStatus.denied){
      permissionStatus=await location.requestPermission();
      if(permissionStatus!=PermissionStatus.granted){
        throw LocationPermissionException();
      }
    }
  }
  void getRealTimeLocationData(void Function(LocationData)? onData) async {
    await checkAndRequestLocationService();
    await checkAndRequestLocationPermission();
    location.onLocationChanged.listen(onData);
  }

  Future<LocationData>getLocation()async
  {
    await checkAndRequestLocationService();
    await checkAndRequestLocationPermission();
    return await Location.instance.getLocation();
  }
}

class LocationServiceException implements Exception{}
class LocationPermissionException implements Exception{}
