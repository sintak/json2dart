import 'package:owl/annotation/json.dart';

@JsonClass()
class Coordinates {
  List<num> coordinates;

  String type;

  Coordinates({this.coordinates, this.type});
}

@JsonClass()
class Geo {
  List<num> coordinates;

  String type;

  Geo({this.coordinates, this.type});
}

@JsonClass()
class Attributes {
  Attributes();
}

@JsonClass()
class BoundingBox {
  List<List<List<num>>> coordinates;

  String type;

  BoundingBox({this.coordinates, this.type});
}

@JsonClass()
class Place {
  Attributes attributes;

  @JsonKey(key: 'bounding_box')
  BoundingBox boundingBox;

  String country;

  @JsonKey(key: 'country_code')
  String countryCode;

  @JsonKey(key: 'full_name')
  String fullName;

  String id;

  String name;

  @JsonKey(key: 'place_type')
  String placeType;

  String url;

  Place(
      {this.attributes,
      this.boundingBox,
      this.country,
      this.countryCode,
      this.fullName,
      this.id,
      this.name,
      this.placeType,
      this.url});
}

@JsonClass()
class Status {
  dynamic contributors;

  Coordinates coordinates;

  @JsonKey(key: 'created_at')
  String createdAt;

  bool favorited;

  Geo geo;

  int id;

  @JsonKey(key: 'id_str')
  String idStr;

  @JsonKey(key: 'in_reply_to_screen_name')
  String inReplyToScreenName;

  @JsonKey(key: 'in_reply_to_status_id')
  int inReplyToStatusId;

  @JsonKey(key: 'in_reply_to_status_id_str')
  String inReplyToStatusIdStr;

  @JsonKey(key: 'in_reply_to_user_id')
  int inReplyToUserId;

  @JsonKey(key: 'in_reply_to_user_id_str')
  String inReplyToUserIdStr;

  Place place;

  @JsonKey(key: 'retweet_count')
  int retweetCount;

  bool retweeted;

  String source;

  String text;

  bool truncated;

  Status(
      {this.contributors,
      this.coordinates,
      this.createdAt,
      this.favorited,
      this.geo,
      this.id,
      this.idStr,
      this.inReplyToScreenName,
      this.inReplyToStatusId,
      this.inReplyToStatusIdStr,
      this.inReplyToUserId,
      this.inReplyToUserIdStr,
      this.place,
      this.retweetCount,
      this.retweeted,
      this.source,
      this.text,
      this.truncated});
}

@JsonClass()
class TwitterUser {
  @JsonKey(key: 'contributors_enabled')
  bool contributorsEnabled;

  @JsonKey(key: 'created_at')
  String createdAt;

  @JsonKey(key: 'default_profile')
  bool defaultProfile;

  @JsonKey(key: 'default_profile_image')
  bool defaultProfileImage;

  String description;

  @JsonKey(key: 'favourites_count')
  int favouritesCount;

  @JsonKey(key: 'follow_request_sent')
  dynamic followRequestSent;

  @JsonKey(key: 'followers_count')
  int followersCount;

  dynamic following;

  @JsonKey(key: 'friends_count')
  int friendsCount;

  @JsonKey(key: 'geo_enabled')
  bool geoEnabled;

  int id;

  @JsonKey(key: 'id_str')
  String idStr;

  @JsonKey(key: 'is_translator')
  bool isTranslator;

  String lang;

  @JsonKey(key: 'listed_count')
  int listedCount;

  String location;

  String name;

  dynamic notifications;

  @JsonKey(key: 'profile_background_color')
  String profileBackgroundColor;

  @JsonKey(key: 'profile_background_image_url')
  String profileBackgroundImageUrl;

  @JsonKey(key: 'profile_background_image_url_https')
  String profileBackgroundImageUrlHttps;

  @JsonKey(key: 'profile_background_tile')
  bool profileBackgroundTile;

  @JsonKey(key: 'profile_image_url')
  String profileImageUrl;

  @JsonKey(key: 'profile_image_url_https')
  String profileImageUrlHttps;

  @JsonKey(key: 'profile_link_color')
  String profileLinkColor;

  @JsonKey(key: 'profile_sidebar_border_color')
  String profileSidebarBorderColor;

  @JsonKey(key: 'profile_sidebar_fill_color')
  String profileSidebarFillColor;

  @JsonKey(key: 'profile_text_color')
  String profileTextColor;

  @JsonKey(key: 'profile_use_background_image')
  bool profileUseBackgroundImage;

  bool protected;

  @JsonKey(key: 'screen_name')
  String screenName;

  @JsonKey(key: 'show_all_inline_media')
  bool showAllInlineMedia;

  Status status;

  @JsonKey(key: 'statuses_count')
  int statusesCount;

  @JsonKey(key: 'time_zone')
  String timeZone;

  dynamic url;

  @JsonKey(key: 'utc_offset')
  int utcOffset;

  bool verified;

  TwitterUser(
      {this.contributorsEnabled,
      this.createdAt,
      this.defaultProfile,
      this.defaultProfileImage,
      this.description,
      this.favouritesCount,
      this.followRequestSent,
      this.followersCount,
      this.following,
      this.friendsCount,
      this.geoEnabled,
      this.id,
      this.idStr,
      this.isTranslator,
      this.lang,
      this.listedCount,
      this.location,
      this.name,
      this.notifications,
      this.profileBackgroundColor,
      this.profileBackgroundImageUrl,
      this.profileBackgroundImageUrlHttps,
      this.profileBackgroundTile,
      this.profileImageUrl,
      this.profileImageUrlHttps,
      this.profileLinkColor,
      this.profileSidebarBorderColor,
      this.profileSidebarFillColor,
      this.profileTextColor,
      this.profileUseBackgroundImage,
      this.protected,
      this.screenName,
      this.showAllInlineMedia,
      this.status,
      this.statusesCount,
      this.timeZone,
      this.url,
      this.utcOffset,
      this.verified});
}

