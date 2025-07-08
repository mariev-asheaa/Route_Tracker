class PlaceDetailsModel {
  PlaceDetailsModel({
      this.addressComponents, 
      this.businessStatus, 
      this.editorialSummary, 
      this.formattedAddress, 
      this.geometry, 
      this.icon, 
      this.iconBackgroundColor, 
      this.iconMaskBaseUri, 
      this.name, 
      this.photos, 
      this.placeId, 
      this.plusCode, 
      this.rating, 
      this.reference, 
      this.reviews, 
      this.types, 
      this.url, 
      this.userRatingsTotal, 
      this.utcOffset, 
      this.vicinity, 
      this.website, 
      this.wheelchairAccessibleEntrance,});

  PlaceDetailsModel.fromJson(dynamic json) {
    if (json['address_components'] != null) {
      addressComponents = [];
      json['address_components'].forEach((v) {
        addressComponents?.add(AddressComponents.fromJson(v));
      });
    }
    businessStatus = json['business_status'];
    editorialSummary = json['editorial_summary'] != null ? EditorialSummary.fromJson(json['editorial_summary']) : null;
    formattedAddress = json['formatted_address'];
    geometry = json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null;
    icon = json['icon'];
    iconBackgroundColor = json['icon_background_color'];
    iconMaskBaseUri = json['icon_mask_base_uri'];
    name = json['name'];
    if (json['photos'] != null) {
      photos = [];
      json['photos'].forEach((v) {
        photos?.add(Photos.fromJson(v));
      });
    }
    placeId = json['place_id'];
    plusCode = json['plus_code'] != null ? PlusCode.fromJson(json['plus_code']) : null;
    rating = json['rating'];
    reference = json['reference'];
    if (json['reviews'] != null) {
      reviews = [];
      json['reviews'].forEach((v) {
        reviews?.add(Reviews.fromJson(v));
      });
    }
    types = json['types'] != null ? json['types'].cast<String>() : [];
    url = json['url'];
    userRatingsTotal = json['user_ratings_total'];
    utcOffset = json['utc_offset'];
    vicinity = json['vicinity'];
    website = json['website'];
    wheelchairAccessibleEntrance = json['wheelchair_accessible_entrance'];
  }
  List<AddressComponents>? addressComponents;
  String? businessStatus;
  EditorialSummary? editorialSummary;
  String? formattedAddress;
  Geometry? geometry;
  String? icon;
  String? iconBackgroundColor;
  String? iconMaskBaseUri;
  String? name;
  List<Photos>? photos;
  String? placeId;
  PlusCode? plusCode;
  num? rating;
  String? reference;
  List<Reviews>? reviews;
  List<String>? types;
  String? url;
  num? userRatingsTotal;
  num? utcOffset;
  String? vicinity;
  String? website;
  bool? wheelchairAccessibleEntrance;
PlaceDetailsModel copyWith({  List<AddressComponents>? addressComponents,
  String? businessStatus,
  EditorialSummary? editorialSummary,
  String? formattedAddress,
  Geometry? geometry,
  String? icon,
  String? iconBackgroundColor,
  String? iconMaskBaseUri,
  String? name,
  List<Photos>? photos,
  String? placeId,
  PlusCode? plusCode,
  num? rating,
  String? reference,
  List<Reviews>? reviews,
  List<String>? types,
  String? url,
  num? userRatingsTotal,
  num? utcOffset,
  String? vicinity,
  String? website,
  bool? wheelchairAccessibleEntrance,
}) => PlaceDetailsModel(  addressComponents: addressComponents ?? this.addressComponents,
  businessStatus: businessStatus ?? this.businessStatus,
  editorialSummary: editorialSummary ?? this.editorialSummary,
  formattedAddress: formattedAddress ?? this.formattedAddress,
  geometry: geometry ?? this.geometry,
  icon: icon ?? this.icon,
  iconBackgroundColor: iconBackgroundColor ?? this.iconBackgroundColor,
  iconMaskBaseUri: iconMaskBaseUri ?? this.iconMaskBaseUri,
  name: name ?? this.name,
  photos: photos ?? this.photos,
  placeId: placeId ?? this.placeId,
  plusCode: plusCode ?? this.plusCode,
  rating: rating ?? this.rating,
  reference: reference ?? this.reference,
  reviews: reviews ?? this.reviews,
  types: types ?? this.types,
  url: url ?? this.url,
  userRatingsTotal: userRatingsTotal ?? this.userRatingsTotal,
  utcOffset: utcOffset ?? this.utcOffset,
  vicinity: vicinity ?? this.vicinity,
  website: website ?? this.website,
  wheelchairAccessibleEntrance: wheelchairAccessibleEntrance ?? this.wheelchairAccessibleEntrance,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (addressComponents != null) {
      map['address_components'] = addressComponents?.map((v) => v.toJson()).toList();
    }
    map['business_status'] = businessStatus;
    if (editorialSummary != null) {
      map['editorial_summary'] = editorialSummary?.toJson();
    }
    map['formatted_address'] = formattedAddress;
    if (geometry != null) {
      map['geometry'] = geometry?.toJson();
    }
    map['icon'] = icon;
    map['icon_background_color'] = iconBackgroundColor;
    map['icon_mask_base_uri'] = iconMaskBaseUri;
    map['name'] = name;
    if (photos != null) {
      map['photos'] = photos?.map((v) => v.toJson()).toList();
    }
    map['place_id'] = placeId;
    if (plusCode != null) {
      map['plus_code'] = plusCode?.toJson();
    }
    map['rating'] = rating;
    map['reference'] = reference;
    if (reviews != null) {
      map['reviews'] = reviews?.map((v) => v.toJson()).toList();
    }
    map['types'] = types;
    map['url'] = url;
    map['user_ratings_total'] = userRatingsTotal;
    map['utc_offset'] = utcOffset;
    map['vicinity'] = vicinity;
    map['website'] = website;
    map['wheelchair_accessible_entrance'] = wheelchairAccessibleEntrance;
    return map;
  }

}

class Reviews {
  Reviews({
      this.authorName, 
      this.authorUrl, 
      this.language, 
      this.originalLanguage, 
      this.profilePhotoUrl, 
      this.rating, 
      this.relativeTimeDescription, 
      this.text, 
      this.time, 
      this.translated,});

  Reviews.fromJson(dynamic json) {
    authorName = json['author_name'];
    authorUrl = json['author_url'];
    language = json['language'];
    originalLanguage = json['original_language'];
    profilePhotoUrl = json['profile_photo_url'];
    rating = json['rating'];
    relativeTimeDescription = json['relative_time_description'];
    text = json['text'];
    time = json['time'];
    translated = json['translated'];
  }
  String? authorName;
  String? authorUrl;
  String? language;
  String? originalLanguage;
  String? profilePhotoUrl;
  num? rating;
  String? relativeTimeDescription;
  String? text;
  num? time;
  bool? translated;
Reviews copyWith({  String? authorName,
  String? authorUrl,
  String? language,
  String? originalLanguage,
  String? profilePhotoUrl,
  num? rating,
  String? relativeTimeDescription,
  String? text,
  num? time,
  bool? translated,
}) => Reviews(  authorName: authorName ?? this.authorName,
  authorUrl: authorUrl ?? this.authorUrl,
  language: language ?? this.language,
  originalLanguage: originalLanguage ?? this.originalLanguage,
  profilePhotoUrl: profilePhotoUrl ?? this.profilePhotoUrl,
  rating: rating ?? this.rating,
  relativeTimeDescription: relativeTimeDescription ?? this.relativeTimeDescription,
  text: text ?? this.text,
  time: time ?? this.time,
  translated: translated ?? this.translated,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['author_name'] = authorName;
    map['author_url'] = authorUrl;
    map['language'] = language;
    map['original_language'] = originalLanguage;
    map['profile_photo_url'] = profilePhotoUrl;
    map['rating'] = rating;
    map['relative_time_description'] = relativeTimeDescription;
    map['text'] = text;
    map['time'] = time;
    map['translated'] = translated;
    return map;
  }

}

class PlusCode {
  PlusCode({
      this.compoundCode, 
      this.globalCode,});

  PlusCode.fromJson(dynamic json) {
    compoundCode = json['compound_code'];
    globalCode = json['global_code'];
  }
  String? compoundCode;
  String? globalCode;
PlusCode copyWith({  String? compoundCode,
  String? globalCode,
}) => PlusCode(  compoundCode: compoundCode ?? this.compoundCode,
  globalCode: globalCode ?? this.globalCode,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['compound_code'] = compoundCode;
    map['global_code'] = globalCode;
    return map;
  }

}

class Photos {
  Photos({
      this.height,
      this.htmlAttributions,
      this.photoReference,
      this.width,});

  Photos.fromJson(dynamic json) {
    height = json['height'];
    if (json['html_attributions'] != null) {
      htmlAttributions = [];
      json['html_attributions'].forEach((v) {
        htmlAttributions?.add(v.toString());
      });
    }
    photoReference = json['photo_reference'];
    width = json['width'];
  }
  num? height;
  List<dynamic>? htmlAttributions;
  String? photoReference;
  num? width;
Photos copyWith({  num? height,
  List<dynamic>? htmlAttributions,
  String? photoReference,
  num? width,
}) => Photos(  height: height ?? this.height,
  htmlAttributions: htmlAttributions ?? this.htmlAttributions,
  photoReference: photoReference ?? this.photoReference,
  width: width ?? this.width,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['height'] = height;
    if (htmlAttributions != null) {
      map['html_attributions'] = htmlAttributions?.map((v) => v.toJson()).toList();
    }
    map['photo_reference'] = photoReference;
    map['width'] = width;
    return map;
  }

}

class Geometry {
  Geometry({
      this.location, 
      this.viewport,});

  Geometry.fromJson(dynamic json) {
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
    viewport = json['viewport'] != null ? Viewport.fromJson(json['viewport']) : null;
  }
  Location? location;
  Viewport? viewport;
Geometry copyWith({  Location? location,
  Viewport? viewport,
}) => Geometry(  location: location ?? this.location,
  viewport: viewport ?? this.viewport,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (location != null) {
      map['location'] = location?.toJson();
    }
    if (viewport != null) {
      map['viewport'] = viewport?.toJson();
    }
    return map;
  }

}

class Viewport {
  Viewport({
      this.northeast, 
      this.southwest,});

  Viewport.fromJson(dynamic json) {
    northeast = json['northeast'] != null ? Northeast.fromJson(json['northeast']) : null;
    southwest = json['southwest'] != null ? Southwest.fromJson(json['southwest']) : null;
  }
  Northeast? northeast;
  Southwest? southwest;
Viewport copyWith({  Northeast? northeast,
  Southwest? southwest,
}) => Viewport(  northeast: northeast ?? this.northeast,
  southwest: southwest ?? this.southwest,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (northeast != null) {
      map['northeast'] = northeast?.toJson();
    }
    if (southwest != null) {
      map['southwest'] = southwest?.toJson();
    }
    return map;
  }

}

class Southwest {
  Southwest({
      this.lat, 
      this.lng,});

  Southwest.fromJson(dynamic json) {
    lat = json['lat'];
    lng = json['lng'];
  }
  num? lat;
  num? lng;
Southwest copyWith({  num? lat,
  num? lng,
}) => Southwest(  lat: lat ?? this.lat,
  lng: lng ?? this.lng,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lng'] = lng;
    return map;
  }

}

class Northeast {
  Northeast({
      this.lat, 
      this.lng,});

  Northeast.fromJson(dynamic json) {
    lat = json['lat'];
    lng = json['lng'];
  }
  num? lat;
  num? lng;
Northeast copyWith({  num? lat,
  num? lng,
}) => Northeast(  lat: lat ?? this.lat,
  lng: lng ?? this.lng,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lng'] = lng;
    return map;
  }

}

class Location {
  Location({
      this.lat, 
      this.lng,});

  Location.fromJson(dynamic json) {
    lat = json['lat'];
    lng = json['lng'];
  }
  num? lat;
  num? lng;
Location copyWith({  num? lat,
  num? lng,
}) => Location(  lat: lat ?? this.lat,
  lng: lng ?? this.lng,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lng'] = lng;
    return map;
  }

}

class EditorialSummary {
  EditorialSummary({
      this.language, 
      this.overview,});

  EditorialSummary.fromJson(dynamic json) {
    language = json['language'];
    overview = json['overview'];
  }
  String? language;
  String? overview;
EditorialSummary copyWith({  String? language,
  String? overview,
}) => EditorialSummary(  language: language ?? this.language,
  overview: overview ?? this.overview,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['language'] = language;
    map['overview'] = overview;
    return map;
  }

}

class AddressComponents {
  AddressComponents({
      this.longName, 
      this.shortName, 
      this.types,});

  AddressComponents.fromJson(dynamic json) {
    longName = json['long_name'];
    shortName = json['short_name'];
    types = json['types'] != null ? json['types'].cast<String>() : [];
  }
  String? longName;
  String? shortName;
  List<String>? types;
AddressComponents copyWith({  String? longName,
  String? shortName,
  List<String>? types,
}) => AddressComponents(  longName: longName ?? this.longName,
  shortName: shortName ?? this.shortName,
  types: types ?? this.types,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['long_name'] = longName;
    map['short_name'] = shortName;
    map['types'] = types;
    return map;
  }

}