class RoutesModel {
  RoutesModel({
      this.routes,});
  List<RouteModel>? routes;

  RoutesModel.fromJson(dynamic json) {
    if (json['routes'] != null) {
      routes = [];
      json['routes'].forEach((v) {
        routes?.add(RouteModel.fromJson(v));
      });
    }
  }

RoutesModel copyWith({  List<RouteModel>? routes,
}) => RoutesModel(  routes: routes ?? this.routes,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (routes != null) {
      map['routes'] = routes?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class RouteModel {
  RouteModel({
      this.distanceMeters, 
      this.duration, 
      this.polyline,});

  RouteModel.fromJson(dynamic json) {
    distanceMeters = json['distanceMeters'];
    duration = json['duration'];
    polyline = json['polyline'] != null ? PolylineModel.fromJson(json['polyline']) : null;
  }
  num? distanceMeters;
  String? duration;
  PolylineModel? polyline;
RouteModel copyWith({  num? distanceMeters,
  String? duration,
  PolylineModel? polyline,
}) => RouteModel(  distanceMeters: distanceMeters ?? this.distanceMeters,
  duration: duration ?? this.duration,
  polyline: polyline ?? this.polyline,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['distanceMeters'] = distanceMeters;
    map['duration'] = duration;
    if (polyline != null) {
      map['polyline'] = polyline?.toJson();
    }
    return map;
  }

}

class PolylineModel {
  PolylineModel({
      this.encodedPolyline,});

  PolylineModel.fromJson(dynamic json) {
    encodedPolyline = json['encodedPolyline'];
  }
  String? encodedPolyline;
PolylineModel copyWith({  String? encodedPolyline,
}) => PolylineModel(  encodedPolyline: encodedPolyline ?? this.encodedPolyline,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['encodedPolyline'] = encodedPolyline;
    return map;
  }

}