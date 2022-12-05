// To parse this JSON data, do
//
//     final mangaListResponseModel = mangaListResponseModelFromJson(jsonString);

import 'dart:convert';

import '../../../core/constants/manga_constants.dart';

class MangaListResponseModel {
    MangaListResponseModel({
        required this.result,
        required this.response,
        required this.data,
        required this.limit,
        required this.offset,
        required this.total,
    });

    String? result;
    String? response;
    List<Datum>? data;
    int? limit;
    int? offset;
    int? total;
    String? error;

    factory MangaListResponseModel.withError(String errorMessage) {
      return MangaListResponseModel.withError(errorMessage);
    }

    factory MangaListResponseModel.fromRawJson(String? str) => MangaListResponseModel.fromJson(json.decode(str!));

    String? toRawJson() => json.encode(toJson());

    factory MangaListResponseModel.fromJson(Map<String?, dynamic> json) => MangaListResponseModel(
        result: json["result"],
        response: json["response"],
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        limit: json["limit"],
        offset: json["offset"],
        total: json["total"],
    );

    Map<String?, dynamic> toJson() => {
        "result": result,
        "response": response,
        "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
        "limit": limit,
        "offset": offset,
        "total": total,
    };
}

class Datum {
    Datum({
        required this.id,
        required this.type,
        required this.attributes,
        required this.relationships,
    });

    String? id;
    RelationshipType? type;
    DatumAttributes? attributes;
    List<Relationship>? relationships;

    factory Datum.fromRawJson(String? str) => Datum.fromJson(json.decode(str!));

    String? toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String?, dynamic> json) => Datum(
        id: json["id"],
        type: json["type"] == null ? null : relationshipTypeValues.map[json["type"]],
        attributes: json["attributes"] == null ? null : DatumAttributes.fromJson(json["attributes"]),
        relationships: json["relationships"] == null ? null : List<Relationship>.from(json["relationships"].map((x) => Relationship.fromJson(x))),
    );

    Map<String?, dynamic> toJson() => {
        "id": id,
        "type": type == null ? null : relationshipTypeValues.reverse[type],
        "attributes": attributes == null ? null : attributes!.toJson(),
        "relationships": relationships == null ? null : List<dynamic>.from(relationships!.map((x) => x.toJson())),
    };
}

class DatumAttributes {
    DatumAttributes({
        required this.title,
        required this.altTitles,
        required this.description,
        required this.isLocked,
        required this.links,
        required this.originalLanguage,
        required this.lastVolume,
        required this.lastChapter,
        required this.publicationDemographic,
        required this.status,
        required this.year,
        required this.contentRating,
        required this.tags,
        required this.state,
        required this.chapterNumbersResetOnNewVolume,
        required this.createdAt,
        required this.updatedAt,
        required this.version,
        required this.availableTranslatedLanguages,
        required this.latestUploadedChapter,
    });

    Title? title;
    List<AltTitle>? altTitles;
    PurpleDescription? description;
    bool isLocked;
    dynamic links;
    String? originalLanguage;
    String? lastVolume;
    String? lastChapter;
    String? publicationDemographic;
    String? status;
    int? year;
    String? contentRating;
    List<Tag>? tags;
    String? state;
    bool chapterNumbersResetOnNewVolume;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? version;
    List<String>? availableTranslatedLanguages;
    String? latestUploadedChapter;

    factory DatumAttributes.fromRawJson(String? str) => DatumAttributes.fromJson(json.decode(str!));

    String? toRawJson() => json.encode(toJson());

    factory DatumAttributes.fromJson(Map<String?, dynamic> json) => DatumAttributes(
        title: json["title"] == null ? null : Title.fromJson(json["title"]),
        altTitles: json["altTitles"] == null ? null : List<AltTitle>.from(json["altTitles"].map((x) => AltTitle.fromJson(x))),
        description: json["description"] == null ? null : PurpleDescription.fromJson(json["description"]),
        isLocked: json["isLocked"],
        links: json["links"],
        originalLanguage: json["originalLanguage"],
        lastVolume: json["lastVolume"],
        lastChapter: json["lastChapter"],
        publicationDemographic: json["publicationDemographic"],
        status: json["status"],
        year: json["year"],
        contentRating: json["contentRating"],
        tags: json["tags"] == null ? null : List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
        state: json["state"],
        chapterNumbersResetOnNewVolume: json["chapterNumbersResetOnNewVolume"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        version: json["version"],
        availableTranslatedLanguages: json["availableTranslatedLanguages"] == null ? null : List<String>.from(json["availableTranslatedLanguages"].map((x) => x)),
        latestUploadedChapter: json["latestUploadedChapter"],
    );

    Map<String?, dynamic> toJson() => {
        "title": title == null ? null : title!.toJson(),
        "altTitles": altTitles == null ? null : List<dynamic>.from(altTitles!.map((x) => x.toJson())),
        "description": description == null ? null : description!.toJson(),
        "isLocked": isLocked,
        "links": links,
        "originalLanguage": originalLanguage,
        "lastVolume": lastVolume,
        "lastChapter": lastChapter,
        "publicationDemographic": publicationDemographic,
        "status": status,
        "year": year,
        "contentRating": contentRating,
        "tags": tags == null ? null : List<dynamic>.from(tags!.map((x) => x.toJson())),
        "state": state,
        "chapterNumbersResetOnNewVolume": chapterNumbersResetOnNewVolume,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "version": version,
        "availableTranslatedLanguages": availableTranslatedLanguages == null ? null : List<dynamic>.from(availableTranslatedLanguages!.map((x) => x)),
        "latestUploadedChapter": latestUploadedChapter,
    };
}

class AltTitle {
    AltTitle({
        required this.de,
        required this.jaRo,
        required this.ja,
        required this.en,
        required this.zh,
    });

    String? de;
    String? jaRo;
    String? ja;
    String? en;
    String? zh;

    factory AltTitle.fromRawJson(String? str) => AltTitle.fromJson(json.decode(str!));

    String? toRawJson() => json.encode(toJson());

    factory AltTitle.fromJson(Map<String?, dynamic> json) => AltTitle(
        de: json["de"],
        jaRo: json["ja-ro"],
        ja: json["ja"],
        en: json["en"],
        zh: json["zh"],
    );

    Map<String?, dynamic> toJson() => {
        "de": de,
        "ja-ro": jaRo,
        "ja": ja,
        "en": en,
        "zh": zh,
    };
}

class PurpleDescription {
    PurpleDescription({
        required this.de,
        required this.en,
        required this.ptBr,
    });

    String? de;
    String? en;
    String? ptBr;

    factory PurpleDescription.fromRawJson(String? str) => PurpleDescription.fromJson(json.decode(str!));

    String? toRawJson() => json.encode(toJson());

    factory PurpleDescription.fromJson(Map<String?, dynamic> json) => PurpleDescription(
        de: json["de"],
        en: json["en"],
        ptBr: json["pt-br"],
    );

    Map<String?, dynamic> toJson() => {
        "de": de,
        "en": en,
        "pt-br": ptBr,
    };
}

class LinksClass {
    LinksClass({
        required this.al,
        required this.ap,
        required this.bw,
        required this.kt,
        required this.mu,
        required this.amz,
        required this.ebj,
        required this.mal,
        required this.raw,
        required this.engtl,
    });

    String? al;
    String? ap;
    String? bw;
    String? kt;
    String? mu;
    String? amz;
    String? ebj;
    String? mal;
    String? raw;
    String? engtl;

    factory LinksClass.fromRawJson(String? str) => LinksClass.fromJson(json.decode(str!));

    String? toRawJson() => json.encode(toJson());

    factory LinksClass.fromJson(Map<String?, dynamic> json) => LinksClass(
        al: json["al"],
        ap: json["ap"],
        bw: json["bw"],
        kt: json["kt"],
        mu: json["mu"],
        amz: json["amz"],
        ebj: json["ebj"],
        mal: json["mal"],
        raw: json["raw"],
        engtl: json["engtl"],
    );

    Map<String?, dynamic> toJson() => {
        "al": al,
        "ap": ap,
        "bw": bw,
        "kt": kt,
        "mu": mu,
        "amz": amz,
        "ebj": ebj,
        "mal": mal,
        "raw": raw,
        "engtl": engtl,
    };
}

class Tag {
    Tag({
        required this.id,
        required this.type,
        required this.attributes,
        required this.relationships,
    });

    String? id;
    TagType? type;
    TagAttributes? attributes;
    List<dynamic>? relationships;

    factory Tag.fromRawJson(String? str) => Tag.fromJson(json.decode(str!));

    String? toRawJson() => json.encode(toJson());

    factory Tag.fromJson(Map<String?, dynamic> json) => Tag(
        id: json["id"],
        type: json["type"] == null ? null : tagTypeValues.map[json["type"]],
        attributes: json["attributes"] == null ? null : TagAttributes.fromJson(json["attributes"]),
        relationships: json["relationships"] == null ? null : List<dynamic>.from(json["relationships"].map((x) => x)),
    );

    Map<String?, dynamic> toJson() => {
        "id": id,
        "type": type == null ? null : tagTypeValues.reverse[type],
        "attributes": attributes == null ? null : attributes!.toJson(),
        "relationships": relationships == null ? null : List<dynamic>.from(relationships!.map((x) => x)),
    };
}

class TagAttributes {
    TagAttributes({
        required this.name,
        required this.description,
        required this.group,
        required this.version,
    });

    Title? name;
    FluffyDescription?description;
    Group? group;
    int? version;

    factory TagAttributes.fromRawJson(String? str) => TagAttributes.fromJson(json.decode(str!));

    String? toRawJson() => json.encode(toJson());

    factory TagAttributes.fromJson(Map<String?, dynamic> json) => TagAttributes(
        name: json["name"] == null ? null : Title.fromJson(json["name"]),
        description: json["description"] == null ? null : FluffyDescription.fromJson(json["description"]),
        group: json["group"] == null ? null : groupValues.map[json["group"]],
        version: json["version"],
    );

    Map<String?, dynamic> toJson() => {
        "name": name == null ? null : name!.toJson(),
        "description": description == null ? null : description!.toJson(),
        "group": group == null ? null : groupValues.reverse[group],
        "version": version,
    };
}

class FluffyDescription {
    FluffyDescription();

    factory FluffyDescription.fromRawJson(String? str) => FluffyDescription.fromJson(json.decode(str!));

    String? toRawJson() => json.encode(toJson());

    factory FluffyDescription.fromJson(Map<String?, dynamic> json) => FluffyDescription(
    );

    Map<String?, dynamic> toJson() => {
    };
}

final groupValues = EnumValues({
    "format": Group.FORMAT,
    "genre": Group.GENRE,
    "theme": Group.THEME
});

class Title {
    Title({
        required this.en,
    });

    String? en;

    factory Title.fromRawJson(String? str) => Title.fromJson(json.decode(str!));

    String? toRawJson() => json.encode(toJson());

    factory Title.fromJson(Map<String?, dynamic> json) => Title(
        en: json["en"],
    );

    Map<String?, dynamic> toJson() => {
        "en": en,
    };
}

final tagTypeValues = EnumValues({
    "tag": TagType.TAG
});

class Relationship {
    Relationship({
        required this.id,
        required this.type,
        required this.related,
    });

    String? id;
    RelationshipType? type;
    String? related;

    factory Relationship.fromRawJson(String? str) => Relationship.fromJson(json.decode(str!));

    String? toRawJson() => json.encode(toJson());

    factory Relationship.fromJson(Map<String?, dynamic> json) => Relationship(
        id: json["id"],
        type: json["type"] == null ? null : relationshipTypeValues.map[json["type"]],
        related: json["related"],
    );

    Map<String?, dynamic> toJson() => {
        "id": id,
        "type": type == null ? null : relationshipTypeValues.reverse[type],
        "related": related,
    };
}

final relationshipTypeValues = EnumValues({
    "artist": RelationshipType.ARTIST,
    "author": RelationshipType.AUTHOR,
    "cover_art": RelationshipType.COVER_ART,
    "manga": RelationshipType.MANGA
});

class EnumValues<T> {
    Map<String?, T> map;
    late Map<T, String?> reverseMap;

    EnumValues(this.map);

    Map<T, String?> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k!));
        }
        return reverseMap;
    }
}
