class NearestGymLocationModel {
  bool? status;
  String? message;
  List<NearestGymLocation>? data;
  List<Terms>? terms;

  NearestGymLocationModel({this.status, this.message, this.data, this.terms});

  NearestGymLocationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <NearestGymLocation>[];
      json['data'].forEach((v) {
        data!.add(NearestGymLocation.fromJson(v));
      });
    }
    if (json['terms'] != null) {
      terms = <Terms>[];
      json['terms'].forEach((v) {
        terms!.add(Terms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (terms != null) {
      data['terms'] = terms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NearestGymLocation {
  String? userId;
  String? gymName;
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? latitude;
  String? longitude;
  String? pin;
  String? country;
  String? name;
  int? freeTrial;
  String? distance;
  String? addonCategory;
  String? distanceText;
  String? durationText;
  String? duration;
  num? rating;
  String? text1;
  String? text2;
  String? planName;
  String? planDuration;
  String? planPrice;
  String? planDescription;
  String? coverImage;
  List<Gallery>? gallery;
  String? type;
  String? description;
  String? status;
  String? slug;
  String? categoryId;
  List<Offer>? offer;
  List<Benefits>? benefits;
  List<String>? addons;
  int? totalRating;
  String? isPartial;
  int? isCash;
  String? categoryName;
  String? addonFront;
  num? wtfShare;
  int? isDiscount;

  NearestGymLocation(
      {this.userId,
      this.gymName,
      this.address1,
      this.address2,
      this.city,
      this.state,
      this.latitude,
      this.longitude,
      this.pin,
      this.country,
      this.name,
      this.freeTrial,
      this.distance,
      this.addonCategory,
      this.distanceText,
      this.durationText,
      this.duration,
      this.rating,
      this.text1,
      this.text2,
      this.planName,
      this.planDuration,
      this.planPrice,
      this.planDescription,
      this.coverImage,
      this.gallery,
      this.type,
      this.description,
      this.status,
      this.slug,
      this.categoryId,
      this.offer,
      this.benefits,
      this.addons,
      this.totalRating,
      this.isPartial,
      this.isCash,
      this.categoryName,
      this.addonFront,
      this.wtfShare,
      this.isDiscount});

  NearestGymLocation.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    gymName = json['gym_name'];
    address1 = json['address1'];
    address2 = json['address2'];
    city = json['city'];
    state = json['state'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    pin = json['pin'];
    country = json['country'];
    name = json['name'];
    freeTrial = json['free_trial'];
    distance = json['distance'];
    addonCategory = json['addon_category'];
    distanceText = json['distance_text'];
    durationText = json['duration_text'];
    duration = json['duration'];
    rating = json['rating'];
    text1 = json['text1'];
    text2 = json['text2'];
    planName = json['plan_name'];
    planDuration = json['plan_duration'];
    planPrice = json['plan_price'];
    planDescription = json['plan_description'];
    coverImage = json['cover_image'];
    if (json['gallery'] != null) {
      gallery = <Gallery>[];
      json['gallery'].forEach((v) {
        gallery!.add(Gallery.fromJson(v));
      });
    }
    type = json['type'];
    description = json['description'];
    status = json['status'];
    slug = json['slug'];
    categoryId = json['category_id'];
    if (json['offer'] != null) {
      offer = <Offer>[];
      json['offer'].forEach((v) {
        offer!.add(Offer.fromJson(v));
      });
    }
    if (json['benefits'] != null) {
      benefits = <Benefits>[];
      json['benefits'].forEach((v) {
        benefits!.add(Benefits.fromJson(v));
      });
    }
    addons = json['addons'].cast<String>();
    totalRating = json['total_rating'];
    isPartial = json['is_partial'];
    isCash = json['is_cash'];
    categoryName = json['category_name'];
    addonFront = json['addon_front'];
    wtfShare = json['wtf_share'];
    isDiscount = json['is_discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['gym_name'] = gymName;
    data['address1'] = address1;
    data['address2'] = address2;
    data['city'] = city;
    data['state'] = state;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['pin'] = pin;
    data['country'] = country;
    data['name'] = name;
    data['free_trial'] = freeTrial;
    data['distance'] = distance;
    data['addon_category'] = addonCategory;
    data['distance_text'] = distanceText;
    data['duration_text'] = durationText;
    data['duration'] = duration;
    data['rating'] = rating;
    data['text1'] = text1;
    data['text2'] = text2;
    data['plan_name'] = planName;
    data['plan_duration'] = planDuration;
    data['plan_price'] = planPrice;
    data['plan_description'] = planDescription;
    data['cover_image'] = coverImage;
    if (gallery != null) {
      data['gallery'] = gallery!.map((v) => v.toJson()).toList();
    }
    data['type'] = type;
    data['description'] = description;
    data['status'] = status;
    data['slug'] = slug;
    data['category_id'] = categoryId;
    if (offer != null) {
      data['offer'] = offer!.map((v) => v.toJson()).toList();
    }
    if (benefits != null) {
      data['benefits'] = benefits!.map((v) => v.toJson()).toList();
    }
    data['addons'] = addons;
    data['total_rating'] = totalRating;
    data['is_partial'] = isPartial;
    data['is_cash'] = isCash;
    data['category_name'] = categoryName;
    data['addon_front'] = addonFront;
    data['wtf_share'] = wtfShare;
    data['is_discount'] = isDiscount;
    return data;
  }
}

class Gallery {
  int? id;
  String? uid;
  String? gymId;
  String? categoryId;
  String? images;
  String? status;
  String? dateAdded;
  String? lastUpdated;
  String? type;

  Gallery(
      {this.id,
      this.uid,
      this.gymId,
      this.categoryId,
      this.images,
      this.status,
      this.dateAdded,
      this.lastUpdated,
      this.type});

  Gallery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    gymId = json['gym_id'];
    categoryId = json['category_id'];
    images = json['images'];
    status = json['status'];
    dateAdded = json['date_added'];
    lastUpdated = json['last_updated'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uid'] = uid;
    data['gym_id'] = gymId;
    data['category_id'] = categoryId;
    data['images'] = images;
    data['status'] = status;
    data['date_added'] = dateAdded;
    data['last_updated'] = lastUpdated;
    data['type'] = type;
    return data;
  }
}

class Offer {
  int? id;
  String? uid;
  String? gymId;
  String? name;
  String? code;
  String? validity;
  String? mode;
  String? type;
  String? value;
  String? status;
  String? dateAdded;
  String? lastUpdated;
  int? isTrigger;
  String? offerType;
  String? typeId;
  int? isPublic;
  int? isFront;
  String? addedBy;
  int? isGeneric;
  String? planName;
  String? duration;
  String? membershipName;

  Offer(
      {this.id,
      this.uid,
      this.gymId,
      this.name,
      this.code,
      this.validity,
      this.mode,
      this.type,
      this.value,
      this.status,
      this.dateAdded,
      this.lastUpdated,
      this.isTrigger,
      this.offerType,
      this.typeId,
      this.isPublic,
      this.isFront,
      this.addedBy,
      this.isGeneric,
      this.planName,
      this.duration,
      this.membershipName});

  Offer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    gymId = json['gym_id'];
    name = json['name'];
    code = json['code'];
    validity = json['validity'];
    mode = json['mode'];
    type = json['type'];
    value = json['value'];
    status = json['status'];
    dateAdded = json['date_added'];
    lastUpdated = json['last_updated'];
    isTrigger = json['is_trigger'];
    offerType = json['offer_type'];
    typeId = json['type_id'];
    isPublic = json['is_public'];
    isFront = json['is_front'];
    addedBy = json['added_by'];
    isGeneric = json['is_generic'];
    planName = json['plan_name'];
    duration = json['duration'];
    membershipName = json['membership_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uid'] = uid;
    data['gym_id'] = gymId;
    data['name'] = name;
    data['code'] = code;
    data['validity'] = validity;
    data['mode'] = mode;
    data['type'] = type;
    data['value'] = value;
    data['status'] = status;
    data['date_added'] = dateAdded;
    data['last_updated'] = lastUpdated;
    data['is_trigger'] = isTrigger;
    data['offer_type'] = offerType;
    data['type_id'] = typeId;
    data['is_public'] = isPublic;
    data['is_front'] = isFront;
    data['added_by'] = addedBy;
    data['is_generic'] = isGeneric;
    data['plan_name'] = planName;
    data['duration'] = duration;
    data['membership_name'] = membershipName;
    return data;
  }
}

class Benefits {
  int? id;
  String? uid;
  String? gymId;
  String? name;
  String? breif;
  String? image;
  String? status;
  String? dateAdded;
  String? lastUpdated;

  Benefits(
      {this.id,
      this.uid,
      this.gymId,
      this.name,
      this.breif,
      this.image,
      this.status,
      this.dateAdded,
      this.lastUpdated});

  Benefits.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    gymId = json['gym_id'];
    name = json['name'];
    breif = json['breif'];
    image = json['image'];
    status = json['status'];
    dateAdded = json['date_added'];
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uid'] = uid;
    data['gym_id'] = gymId;
    data['name'] = name;
    data['breif'] = breif;
    data['image'] = image;
    data['status'] = status;
    data['date_added'] = dateAdded;
    data['last_updated'] = lastUpdated;
    return data;
  }
}

class Terms {
  int? id;
  String? uid;
  String? name;
  String? icon;
  String? status;
  String? dateAdded;
  String? lastUpdated;

  Terms(
      {this.id,
      this.uid,
      this.name,
      this.icon,
      this.status,
      this.dateAdded,
      this.lastUpdated});

  Terms.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    name = json['name'];
    icon = json['icon'];
    status = json['status'];
    dateAdded = json['date_added'];
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uid'] = uid;
    data['name'] = name;
    data['icon'] = icon;
    data['status'] = status;
    data['date_added'] = dateAdded;
    data['last_updated'] = lastUpdated;
    return data;
  }
}
