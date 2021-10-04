// To parse this JSON data, do
//
//     final coinDetailsResponse = coinDetailsResponseFromJson(jsonString);

import 'dart:convert';

CoinDetailsResponse coinDetailsResponseFromJson(String str) => CoinDetailsResponse.fromJson(json.decode(str));

String coinDetailsResponseToJson(CoinDetailsResponse data) => json.encode(data.toJson());

class CoinDetailsResponse {
    CoinDetailsResponse({
        this.response,
        this.message,
        this.hasWarning,
        this.type,
        this.rateLimit,
        this.data,
    });

    String? response;
    String? message;
    bool? hasWarning;
    int? type;
    RateLimit? rateLimit;
    Data? data;

    factory CoinDetailsResponse.fromJson(Map<String, dynamic> json) => CoinDetailsResponse(
        response: json["Response"] == null ? null : json["Response"],
        message: json["Message"] == null ? null : json["Message"],
        hasWarning: json["HasWarning"] == null ? null : json["HasWarning"],
        type: json["Type"] == null ? null : json["Type"],
        rateLimit: json["RateLimit"] == null ? null : RateLimit.fromJson(json["RateLimit"]),
        data: json["Data"] == null ? null : Data.fromJson(json["Data"]),
    );

    Map<String, dynamic> toJson() => {
        "Response": response == null ? null : response,
        "Message": message == null ? null : message,
        "HasWarning": hasWarning == null ? null : hasWarning,
        "Type": type == null ? null : type,
        "RateLimit": rateLimit == null ? null : rateLimit!.toJson(),
        "Data": data == null ? null : data!.toJson(),
    };
}

class Data {
    Data({
        this.aggregated,
        this.timeFrom,
        this.timeTo,
        this.data,
    });

    bool? aggregated;
    int? timeFrom;
    int? timeTo;
    List<Datum>? data;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        aggregated: json["Aggregated"] == null ? null : json["Aggregated"],
        timeFrom: json["TimeFrom"] == null ? null : json["TimeFrom"],
        timeTo: json["TimeTo"] == null ? null : json["TimeTo"],
        data: json["Data"] == null ? null : List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Aggregated": aggregated == null ? null : aggregated,
        "TimeFrom": timeFrom == null ? null : timeFrom,
        "TimeTo": timeTo == null ? null : timeTo,
        "Data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.time,
        this.high,
        this.low,
        this.open,
        this.volumefrom,
        this.volumeto,
        this.close,
        this.conversionType,
        this.conversionSymbol,
    });

    int? time;
    double? high;
    double? low;
    double? open;
    double? volumefrom;
    double? volumeto;
    double? close;
    ConversionType? conversionType;
    String? conversionSymbol;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        time: json["time"] == null ? null : json["time"],
        high: json["high"] == null ? null : json["high"].toDouble(),
        low: json["low"] == null ? null : json["low"].toDouble(),
        open: json["open"] == null ? null : json["open"].toDouble(),
        volumefrom: json["volumefrom"] == null ? null : json["volumefrom"].toDouble(),
        volumeto: json["volumeto"] == null ? null : json["volumeto"].toDouble(),
        close: json["close"] == null ? null : json["close"].toDouble(),
        conversionType: json["conversionType"] == null ? null : conversionTypeValues.map[json["conversionType"]],
        conversionSymbol: json["conversionSymbol"] == null ? null : json["conversionSymbol"],
    );

    Map<String, dynamic> toJson() => {
        "time": time == null ? null : time,
        "high": high == null ? null : high,
        "low": low == null ? null : low,
        "open": open == null ? null : open,
        "volumefrom": volumefrom == null ? null : volumefrom,
        "volumeto": volumeto == null ? null : volumeto,
        "close": close == null ? null : close,
        "conversionType": conversionType == null ? null : conversionTypeValues.reverse[conversionType],
        "conversionSymbol": conversionSymbol == null ? null : conversionSymbol,
    };
}

enum ConversionType { DIRECT }

final conversionTypeValues = EnumValues({
    "direct": ConversionType.DIRECT
});

class RateLimit {
    RateLimit();

    factory RateLimit.fromJson(Map<String, dynamic> json) => RateLimit(
    );

    Map<String, dynamic> toJson() => {
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap ?? {};
    }
}
