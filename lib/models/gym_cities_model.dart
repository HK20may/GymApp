class GymCitiesModel {
  bool? status;
  List<GymCitiesData>? data;

  GymCitiesModel({this.status, this.data});

  GymCitiesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <GymCitiesData>[];
      json['data'].forEach((v) {
        data!.add(GymCitiesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GymCitiesData {
  String? id;
  String? uid;
  String? city;
  String? dateAdded;
  String? status;
  List<PopularLocations>? popularLocations;
  String? image;
  String? lastUpdated;

  GymCitiesData(
      {this.id,
      this.uid,
      this.city,
      this.dateAdded,
      this.status,
      this.popularLocations,
      this.image,
      this.lastUpdated});

  GymCitiesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    city = json['city'];
    dateAdded = json['date_added'];
    status = json['status'];
    if (json['popular_locations'] != null) {
      popularLocations = <PopularLocations>[];
      json['popular_locations'].forEach((v) {
        popularLocations!.add(PopularLocations.fromJson(v));
      });
    }
    image = json['image'];
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uid'] = uid;
    data['city'] = city;
    data['date_added'] = dateAdded;
    data['status'] = status;
    if (popularLocations != null) {
      data['popular_locations'] =
          popularLocations!.map((v) => v.toJson()).toList();
    }
    data['image'] = image;
    data['last_updated'] = lastUpdated;
    return data;
  }
}

class PopularLocations {
  String? location;
  String? address2;
  String? pin;
  String? country;

  PopularLocations({this.location, this.address2, this.pin, this.country});

  PopularLocations.fromJson(Map<String, dynamic> json) {
    location = json['location'];
    address2 = json['address2'];
    pin = json['pin'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['location'] = location;
    data['address2'] = address2;
    data['pin'] = pin;
    data['country'] = country;
    return data;
  }
}
