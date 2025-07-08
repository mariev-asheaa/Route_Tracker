class RoutesPostBodyModel {
  RoutesPostBodyModel({
      this.origin, 
      this.destination, 
      this.travelMode, 
      this.routingPreference, 
      this.computeAlternativeRoutes, 
      this.routeModifiers, 
      this.languageCode, 
      this.units,});

  RoutesPostBodyModel.fromJson(dynamic json) {
    origin = json['origin'] != null ? Origin.fromJson(json['origin']) : null;
    destination = json['destination'] != null ? Destination.fromJson(json['destination']) : null;
    travelMode = json['travelMode'];
    routingPreference = json['routingPreference'];
    computeAlternativeRoutes = json['computeAlternativeRoutes'];
    routeModifiers = json['routeModifiers'] != null ? RouteModifiers.fromJson(json['routeModifiers']) : null;
    languageCode = json['languageCode'];
    units = json['units'];
  }
  Origin? origin;
  Destination? destination;
  String? travelMode;
  String? routingPreference;
  bool? computeAlternativeRoutes;
  RouteModifiers? routeModifiers;
  String? languageCode;
  String? units;
RoutesPostBodyModel copyWith({  Origin? origin,
  Destination? destination,
  String? travelMode,
  String? routingPreference,
  bool? computeAlternativeRoutes,
  RouteModifiers? routeModifiers,
  String? languageCode,
  String? units,
}) => RoutesPostBodyModel(  origin: origin ?? this.origin,
  destination: destination ?? this.destination,
  travelMode: travelMode ?? this.travelMode,
  routingPreference: routingPreference ?? this.routingPreference,
  computeAlternativeRoutes: computeAlternativeRoutes ?? this.computeAlternativeRoutes,
  routeModifiers: routeModifiers ?? this.routeModifiers,
  languageCode: languageCode ?? this.languageCode,
  units: units ?? this.units,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (origin != null) {
      map['origin'] = origin?.toJson();
    }
    if (destination != null) {
      map['destination'] = destination?.toJson();
    }
    map['travelMode'] = travelMode;
    map['routingPreference'] = routingPreference;
    map['computeAlternativeRoutes'] = computeAlternativeRoutes;
    if (routeModifiers != null) {
      map['routeModifiers'] = routeModifiers?.toJson();
    }
    map['languageCode'] = languageCode;
    map['units'] = units;
    return map;
  }

}

class RouteModifiers {
  RouteModifiers({
      this.avoidTolls, 
      this.avoidHighways, 
      this.avoidFerries,});

  RouteModifiers.fromJson(dynamic json) {
    avoidTolls = json['avoidTolls'];
    avoidHighways = json['avoidHighways'];
    avoidFerries = json['avoidFerries'];
  }
  bool? avoidTolls;
  bool? avoidHighways;
  bool? avoidFerries;
RouteModifiers copyWith({  bool? avoidTolls,
  bool? avoidHighways,
  bool? avoidFerries,
}) => RouteModifiers(  avoidTolls: avoidTolls ?? this.avoidTolls,
  avoidHighways: avoidHighways ?? this.avoidHighways,
  avoidFerries: avoidFerries ?? this.avoidFerries,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['avoidTolls'] = avoidTolls;
    map['avoidHighways'] = avoidHighways;
    map['avoidFerries'] = avoidFerries;
    return map;
  }

}

class Destination {
  Destination({
      this.location,});

  Destination.fromJson(dynamic json) {
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
  }
  Location? location;
Destination copyWith({  Location? location,
}) => Destination(  location: location ?? this.location,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (location != null) {
      map['location'] = location?.toJson();
    }
    return map;
  }

}

class Location {
  Location({
      this.latLng,});

  Location.fromJson(dynamic json) {
    latLng = json['latLng'] != null ? LatLngModel.fromJson(json['latLng']) : null;
  }
  LatLngModel? latLng;
Location copyWith({  LatLngModel? latLng,
}) => Location(  latLng: latLng ?? this.latLng,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (latLng != null) {
      map['latLng'] = latLng?.toJson();
    }
    return map;
  }

}

class LatLngModel {
  LatLngModel({
      this.latitude, 
      this.longitude,});

  LatLngModel.fromJson(dynamic json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
  num? latitude;
  num? longitude;
LatLngModel copyWith({  num? latitude,
  num? longitude,
}) => LatLngModel(  latitude: latitude ?? this.latitude,
  longitude: longitude ?? this.longitude,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    return map;
  }

}

class Origin {
  Origin({
      this.location,});

  Origin.fromJson(dynamic json) {
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
  }
  Location? location;
Origin copyWith({  Location? location,
}) => Origin(  location: location ?? this.location,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (location != null) {
      map['location'] = location?.toJson();
    }
    return map;
  }

}