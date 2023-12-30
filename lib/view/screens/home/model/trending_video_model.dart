import 'dart:convert';

class TrendingVideoModel {
  Links? links;
  int? total;
  int? page;
  int? pageSize;
  List<Result>? results;

  TrendingVideoModel({
    this.links,
    this.total,
    this.page,
    this.pageSize,
    this.results,
  });

  factory TrendingVideoModel.fromRawJson(String str) => TrendingVideoModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TrendingVideoModel.fromJson(Map<String, dynamic> json) => TrendingVideoModel(
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
    total: json["total"],
    page: json["page"],
    pageSize: json["page_size"],
    results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "links": links?.toJson(),
    "total": total,
    "page": page,
    "page_size": pageSize,
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Links {
  dynamic next;
  dynamic previous;

  Links({
    this.next,
    this.previous,
  });

  factory Links.fromRawJson(String str) => Links.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    next: json["next"],
    previous: json["previous"],
  );

  Map<String, dynamic> toJson() => {
    "next": next,
    "previous": previous,
  };
}

class Result {
  String? thumbnail;
  int? id;
  String? title;
  DateTime? dateAndTime;
  String? slug;
  DateTime? createdAt;
  String? manifest;
  int? liveStatus;
  String? liveManifest;
  bool? isLive;
  String? channelImage;
  String? channelName;
  String? channelUsername;
  bool? isVerified;
  String? channelSlug;
  String? channelSubscriber;
  int? channelId;
  String? type;
  String? viewers;
  String? duration;
  ObjectType? objectType;

  Result({
    this.thumbnail,
    this.id,
    this.title,
    this.dateAndTime,
    this.slug,
    this.createdAt,
    this.manifest,
    this.liveStatus,
    this.liveManifest,
    this.isLive,
    this.channelImage,
    this.channelName,
    this.channelUsername,
    this.isVerified,
    this.channelSlug,
    this.channelSubscriber,
    this.channelId,
    this.type,
    this.viewers,
    this.duration,
    this.objectType,
  });

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    thumbnail: json["thumbnail"],
    id: json["id"],
    title: json["title"],
    dateAndTime: json["date_and_time"] == null ? null : DateTime.parse(json["date_and_time"]),
    slug: json["slug"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    manifest: json["manifest"],
    liveStatus: json["live_status"],
    liveManifest: json["live_manifest"],
    isLive: json["is_live"],
    channelImage: json["channel_image"],
    channelName: json["channel_name"],
    channelUsername: json["channel_username"],
    isVerified: json["is_verified"],
    channelSlug: json["channel_slug"],
    channelSubscriber: json["channel_subscriber"],
    channelId: json["channel_id"],
    type: json["type"],
    viewers: json["viewers"],
    duration: json["duration"],
    objectType: objectTypeValues.map[json["object_type"]]!,
  );

  Map<String, dynamic> toJson() => {
    "thumbnail": thumbnail,
    "id": id,
    "title": title,
    "date_and_time": dateAndTime?.toIso8601String(),
    "slug": slug,
    "created_at": createdAt?.toIso8601String(),
    "manifest": manifest,
    "live_status": liveStatus,
    "live_manifest": liveManifest,
    "is_live": isLive,
    "channel_image": channelImage,
    "channel_name": channelName,
    "channel_username": channelUsername,
    "is_verified": isVerified,
    "channel_slug": channelSlug,
    "channel_subscriber": channelSubscriber,
    "channel_id": channelId,
    "type": type,
    "viewers": viewers,
    "duration": duration,
    "object_type": objectTypeValues.reverse[objectType],
  };
}

enum ObjectType {
  VIDEO
}

final objectTypeValues = EnumValues({
  "video": ObjectType.VIDEO
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
