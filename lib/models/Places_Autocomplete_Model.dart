class PlacesAutocompleteModel {
  PlacesAutocompleteModel({
      this.description, 
      this.matchedSubstrings, 
      this.placeId, 
      this.reference, 
      this.structuredFormatting, 
      this.terms, 
      this.types,});

  PlacesAutocompleteModel.fromJson(dynamic json) {
    description = json['description'];
    if (json['matched_substrings'] != null) {
      matchedSubstrings = [];
      json['matched_substrings'].forEach((v) {
        matchedSubstrings?.add(MatchedSubstrings.fromJson(v));
      });
    }
    placeId = json['place_id'];
    reference = json['reference'];
    structuredFormatting = json['structured_formatting'] != null ? StructuredFormatting.fromJson(json['structured_formatting']) : null;
    if (json['terms'] != null) {
      terms = [];
      json['terms'].forEach((v) {
        terms?.add(Terms.fromJson(v));
      });
    }
    types = json['types'] != null ? json['types'].cast<String>() : [];
  }
  String? description;
  List<MatchedSubstrings>? matchedSubstrings;
  String? placeId;
  String? reference;
  StructuredFormatting? structuredFormatting;
  List<Terms>? terms;
  List<String>? types;
PlacesAutocompleteModel copyWith({  String? description,
  List<MatchedSubstrings>? matchedSubstrings,
  String? placeId,
  String? reference,
  StructuredFormatting? structuredFormatting,
  List<Terms>? terms,
  List<String>? types,
}) => PlacesAutocompleteModel(  description: description ?? this.description,
  matchedSubstrings: matchedSubstrings ?? this.matchedSubstrings,
  placeId: placeId ?? this.placeId,
  reference: reference ?? this.reference,
  structuredFormatting: structuredFormatting ?? this.structuredFormatting,
  terms: terms ?? this.terms,
  types: types ?? this.types,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['description'] = description;
    if (matchedSubstrings != null) {
      map['matched_substrings'] = matchedSubstrings?.map((v) => v.toJson()).toList();
    }
    map['place_id'] = placeId;
    map['reference'] = reference;
    if (structuredFormatting != null) {
      map['structured_formatting'] = structuredFormatting?.toJson();
    }
    if (terms != null) {
      map['terms'] = terms?.map((v) => v.toJson()).toList();
    }
    map['types'] = types;
    return map;
  }

}

class Terms {
  Terms({
      this.offset, 
      this.value,});

  Terms.fromJson(dynamic json) {
    offset = json['offset'];
    value = json['value'];
  }
  num? offset;
  String? value;
Terms copyWith({  num? offset,
  String? value,
}) => Terms(  offset: offset ?? this.offset,
  value: value ?? this.value,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['offset'] = offset;
    map['value'] = value;
    return map;
  }

}

class StructuredFormatting {
  StructuredFormatting({
      this.mainText, 
      this.mainTextMatchedSubstrings, 
      this.secondaryText,});

  StructuredFormatting.fromJson(dynamic json) {
    mainText = json['main_text'];
    if (json['main_text_matched_substrings'] != null) {
      mainTextMatchedSubstrings = [];
      json['main_text_matched_substrings'].forEach((v) {
        mainTextMatchedSubstrings?.add(MainTextMatchedSubstrings.fromJson(v));
      });
    }
    secondaryText = json['secondary_text'];
  }
  String? mainText;
  List<MainTextMatchedSubstrings>? mainTextMatchedSubstrings;
  String? secondaryText;
StructuredFormatting copyWith({  String? mainText,
  List<MainTextMatchedSubstrings>? mainTextMatchedSubstrings,
  String? secondaryText,
}) => StructuredFormatting(  mainText: mainText ?? this.mainText,
  mainTextMatchedSubstrings: mainTextMatchedSubstrings ?? this.mainTextMatchedSubstrings,
  secondaryText: secondaryText ?? this.secondaryText,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['main_text'] = mainText;
    if (mainTextMatchedSubstrings != null) {
      map['main_text_matched_substrings'] = mainTextMatchedSubstrings?.map((v) => v.toJson()).toList();
    }
    map['secondary_text'] = secondaryText;
    return map;
  }

}

class MainTextMatchedSubstrings {
  MainTextMatchedSubstrings({
      this.length, 
      this.offset,});

  MainTextMatchedSubstrings.fromJson(dynamic json) {
    length = json['length'];
    offset = json['offset'];
  }
  num? length;
  num? offset;
MainTextMatchedSubstrings copyWith({  num? length,
  num? offset,
}) => MainTextMatchedSubstrings(  length: length ?? this.length,
  offset: offset ?? this.offset,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['length'] = length;
    map['offset'] = offset;
    return map;
  }

}

class MatchedSubstrings {
  MatchedSubstrings({
      this.length, 
      this.offset,});

  MatchedSubstrings.fromJson(dynamic json) {
    length = json['length'];
    offset = json['offset'];
  }
  num? length;
  num? offset;
MatchedSubstrings copyWith({  num? length,
  num? offset,
}) => MatchedSubstrings(  length: length ?? this.length,
  offset: offset ?? this.offset,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['length'] = length;
    map['offset'] = offset;
    return map;
  }
}