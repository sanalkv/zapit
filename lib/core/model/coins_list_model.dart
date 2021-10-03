// To parse this JSON data, do
//
//     final coinsListResponse = coinsListResponseFromJson(jsonString);

import 'dart:convert';

CoinsListResponse coinsListResponseFromJson(String str) => CoinsListResponse.fromJson(json.decode(str));

String coinsListResponseToJson(CoinsListResponse data) => json.encode(data.toJson());

class CoinsListResponse {
    CoinsListResponse({
        this.message,
        this.type,
        this.metaData,
        this.sponsoredData,
        this.data,
        this.rateLimit,
        this.hasWarning,
    });

    String? message;
    int? type;
    MetaData? metaData;
    List<SponsoredDatum>? sponsoredData;
    List<Datum>? data;
    RateLimit? rateLimit;
    bool? hasWarning;

    factory CoinsListResponse.fromJson(Map<String, dynamic> json) => CoinsListResponse(
        message: json["Message"] == null ? null : json["Message"],
        type: json["Type"] == null ? null : json["Type"],
        metaData: json["MetaData"] == null ? null : MetaData.fromJson(json["MetaData"]),
        sponsoredData: json["SponsoredData"] == null ? null : List<SponsoredDatum>.from(json["SponsoredData"].map((x) => SponsoredDatum.fromJson(x))),
        data: json["Data"] == null ? null : List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
        rateLimit: json["RateLimit"] == null ? null : RateLimit.fromJson(json["RateLimit"]),
        hasWarning: json["HasWarning"] == null ? null : json["HasWarning"],
    );

    Map<String, dynamic> toJson() => {
        "Message": message == null ? null : message,
        "Type": type == null ? null : type,
        "MetaData": metaData == null ? null : metaData!.toJson(),
        "SponsoredData": sponsoredData == null ? null : List<dynamic>.from(sponsoredData!.map((x) => x.toJson())),
        "Data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
        "RateLimit": rateLimit == null ? null : rateLimit!.toJson(),
        "HasWarning": hasWarning == null ? null : hasWarning,
    };
}

class Datum {
    Datum({
        this.coinInfo,
        this.raw,
        this.display,
    });

    CoinInfo? coinInfo;
    Raw? raw;
    Display? display;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        coinInfo: json["CoinInfo"] == null ? null : CoinInfo.fromJson(json["CoinInfo"]),
        raw: json["RAW"] == null ? null : Raw.fromJson(json["RAW"]),
        display: json["DISPLAY"] == null ? null : Display.fromJson(json["DISPLAY"]),
    );

    Map<String, dynamic> toJson() => {
        "CoinInfo": coinInfo == null ? null : coinInfo!.toJson(),
        "RAW": raw == null ? null : raw!.toJson(),
        "DISPLAY": display == null ? null : display!.toJson(),
    };
}

class CoinInfo {
    CoinInfo({
        this.id,
        this.name,
        this.fullName,
        this.internal,
        this.imageUrl,
        this.url,
        this.algorithm,
        this.proofType,
        this.rating,
        this.netHashesPerSecond,
        this.blockNumber,
        this.blockTime,
        this.blockReward,
        this.assetLaunchDate,
        this.maxSupply,
        this.type,
        this.documentType,
    });

    String? id;
    String? name;
    String? fullName;
    String? internal;
    String? imageUrl;
    String? url;
    String? algorithm;
    String? proofType;
    Rating? rating;
    double? netHashesPerSecond;
    int? blockNumber;
    double? blockTime;
    double? blockReward;
    String? assetLaunchDate;
    double? maxSupply;
    int? type;
    DocumentType? documentType;

    factory CoinInfo.fromJson(Map<String, dynamic> json) => CoinInfo(
        id: json["Id"] == null ? null : json["Id"],
        name: json["Name"] == null ? null : json["Name"],
        fullName: json["FullName"] == null ? null : json["FullName"],
        internal: json["Internal"] == null ? null : json["Internal"],
        imageUrl: json["ImageUrl"] == null ? null : json["ImageUrl"],
        url: json["Url"] == null ? null : json["Url"],
        algorithm: json["Algorithm"] == null ? null : json["Algorithm"],
        proofType: json["ProofType"] == null ? null : json["ProofType"],
        rating: json["Rating"] == null ? null : Rating.fromJson(json["Rating"]),
        netHashesPerSecond: json["NetHashesPerSecond"] == null ? null : json["NetHashesPerSecond"].toDouble(),
        blockNumber: json["BlockNumber"] == null ? null : json["BlockNumber"],
        blockTime: json["BlockTime"] == null ? null : json["BlockTime"].toDouble(),
        blockReward: json["BlockReward"] == null ? null : json["BlockReward"].toDouble(),
        assetLaunchDate: json["AssetLaunchDate"] == null ? null : json["AssetLaunchDate"],
        maxSupply: json["MaxSupply"] == null ? null : json["MaxSupply"].toDouble(),
        type: json["Type"] == null ? null : json["Type"],
        documentType: json["DocumentType"] == null ? null : documentTypeValues.map[json["DocumentType"]],
    );

    Map<String, dynamic> toJson() => {
        "Id": id == null ? null : id,
        "Name": name == null ? null : name,
        "FullName": fullName == null ? null : fullName,
        "Internal": internal == null ? null : internal,
        "ImageUrl": imageUrl == null ? null : imageUrl,
        "Url": url == null ? null : url,
        "Algorithm": algorithm == null ? null : algorithm,
        "ProofType": proofType == null ? null : proofType,
        "Rating": rating == null ? null : rating!.toJson(),
        "NetHashesPerSecond": netHashesPerSecond == null ? null : netHashesPerSecond,
        "BlockNumber": blockNumber == null ? null : blockNumber,
        "BlockTime": blockTime == null ? null : blockTime,
        "BlockReward": blockReward == null ? null : blockReward,
        "AssetLaunchDate": assetLaunchDate == null ? null : assetLaunchDate,
        "MaxSupply": maxSupply == null ? null : maxSupply,
        "Type": type == null ? null : type,
        "DocumentType": documentType == null ? null : documentTypeValues.reverse[documentType],
    };
}

enum DocumentType { WEBPAGECOINP }

final documentTypeValues = EnumValues({
    "Webpagecoinp": DocumentType.WEBPAGECOINP
});

class Rating {
    Rating({
        this.weiss,
    });

    Weiss? weiss;

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        weiss: json["Weiss"] == null ? null : Weiss.fromJson(json["Weiss"]),
    );

    Map<String, dynamic> toJson() => {
        "Weiss": weiss == null ? null : weiss!.toJson(),
    };
}

class Weiss {
    Weiss({
        this.rating,
        this.technologyAdoptionRating,
        this.marketPerformanceRating,
    });

    String? rating;
    String? technologyAdoptionRating;
    String? marketPerformanceRating;

    factory Weiss.fromJson(Map<String, dynamic> json) => Weiss(
        rating: json["Rating"] == null ? null : json["Rating"],
        technologyAdoptionRating: json["TechnologyAdoptionRating"] == null ? null : json["TechnologyAdoptionRating"],
        marketPerformanceRating: json["MarketPerformanceRating"] == null ? null : json["MarketPerformanceRating"],
    );

    Map<String, dynamic> toJson() => {
        "Rating": rating == null ? null : rating,
        "TechnologyAdoptionRating": technologyAdoptionRating == null ? null : technologyAdoptionRating,
        "MarketPerformanceRating": marketPerformanceRating == null ? null : marketPerformanceRating,
    };
}

class Display {
    Display({
        this.usd,
    });

    DisplayUsd? usd;

    factory Display.fromJson(Map<String, dynamic> json) => Display(
        usd: json["USD"] == null ? null : DisplayUsd.fromJson(json["USD"]),
    );

    Map<String, dynamic> toJson() => {
        "USD": usd == null ? null : usd?.toJson(),
    };
}

class DisplayUsd {
    DisplayUsd({
        this.fromsymbol,
        this.tosymbol,
        this.market,
        this.price,
        this.lastupdate,
        this.lastvolume,
        this.lastvolumeto,
        this.lasttradeid,
        this.volumeday,
        this.volumedayto,
        this.volume24Hour,
        this.volume24Hourto,
        this.openday,
        this.highday,
        this.lowday,
        this.open24Hour,
        this.high24Hour,
        this.low24Hour,
        this.lastmarket,
        this.volumehour,
        this.volumehourto,
        this.openhour,
        this.highhour,
        this.lowhour,
        this.toptiervolume24Hour,
        this.toptiervolume24Hourto,
        this.change24Hour,
        this.changepct24Hour,
        this.changeday,
        this.changepctday,
        this.changehour,
        this.changepcthour,
        this.conversiontype,
        this.conversionsymbol,
        this.supply,
        this.mktcap,
        this.mktcappenalty,
        this.circulatingsupply,
        this.circulatingsupplymktcap,
        this.totalvolume24H,
        this.totalvolume24Hto,
        this.totaltoptiervolume24H,
        this.totaltoptiervolume24Hto,
        this.imageurl,
    });

    String? fromsymbol;
    PurpleTosymbol? tosymbol;
    PurpleMarket? market;
    String? price;
    Lastupdate? lastupdate;
    String? lastvolume;
    String? lastvolumeto;
    String? lasttradeid;
    String? volumeday;
    String? volumedayto;
    String? volume24Hour;
    String? volume24Hourto;
    String? openday;
    String? highday;
    String? lowday;
    String? open24Hour;
    String? high24Hour;
    String? low24Hour;
    String? lastmarket;
    String? volumehour;
    String? volumehourto;
    String? openhour;
    String? highhour;
    String? lowhour;
    String? toptiervolume24Hour;
    String? toptiervolume24Hourto;
    String? change24Hour;
    String? changepct24Hour;
    String? changeday;
    String? changepctday;
    String? changehour;
    String? changepcthour;
    Conversiontype? conversiontype;
    String? conversionsymbol;
    String? supply;
    String? mktcap;
    Mktcappenalty? mktcappenalty;
    String? circulatingsupply;
    String? circulatingsupplymktcap;
    String? totalvolume24H;
    String? totalvolume24Hto;
    String? totaltoptiervolume24H;
    String? totaltoptiervolume24Hto;
    String? imageurl;

    factory DisplayUsd.fromJson(Map<String, dynamic> json) => DisplayUsd(
        fromsymbol: json["FROMSYMBOL"] == null ? null : json["FROMSYMBOL"],
        tosymbol: json["TOSYMBOL"] == null ? null : purpleTosymbolValues.map[json["TOSYMBOL"]],
        market: json["MARKET"] == null ? null : purpleMarketValues.map[json["MARKET"]],
        price: json["PRICE"] == null ? null : json["PRICE"],
        lastupdate: json["LASTUPDATE"] == null ? null : lastupdateValues.map[json["LASTUPDATE"]],
        lastvolume: json["LASTVOLUME"] == null ? null : json["LASTVOLUME"],
        lastvolumeto: json["LASTVOLUMETO"] == null ? null : json["LASTVOLUMETO"],
        lasttradeid: json["LASTTRADEID"] == null ? null : json["LASTTRADEID"],
        volumeday: json["VOLUMEDAY"] == null ? null : json["VOLUMEDAY"],
        volumedayto: json["VOLUMEDAYTO"] == null ? null : json["VOLUMEDAYTO"],
        volume24Hour: json["VOLUME24HOUR"] == null ? null : json["VOLUME24HOUR"],
        volume24Hourto: json["VOLUME24HOURTO"] == null ? null : json["VOLUME24HOURTO"],
        openday: json["OPENDAY"] == null ? null : json["OPENDAY"],
        highday: json["HIGHDAY"] == null ? null : json["HIGHDAY"],
        lowday: json["LOWDAY"] == null ? null : json["LOWDAY"],
        open24Hour: json["OPEN24HOUR"] == null ? null : json["OPEN24HOUR"],
        high24Hour: json["HIGH24HOUR"] == null ? null : json["HIGH24HOUR"],
        low24Hour: json["LOW24HOUR"] == null ? null : json["LOW24HOUR"],
        lastmarket: json["LASTMARKET"] == null ? null : json["LASTMARKET"],
        volumehour: json["VOLUMEHOUR"] == null ? null : json["VOLUMEHOUR"],
        volumehourto: json["VOLUMEHOURTO"] == null ? null : json["VOLUMEHOURTO"],
        openhour: json["OPENHOUR"] == null ? null : json["OPENHOUR"],
        highhour: json["HIGHHOUR"] == null ? null : json["HIGHHOUR"],
        lowhour: json["LOWHOUR"] == null ? null : json["LOWHOUR"],
        toptiervolume24Hour: json["TOPTIERVOLUME24HOUR"] == null ? null : json["TOPTIERVOLUME24HOUR"],
        toptiervolume24Hourto: json["TOPTIERVOLUME24HOURTO"] == null ? null : json["TOPTIERVOLUME24HOURTO"],
        change24Hour: json["CHANGE24HOUR"] == null ? null : json["CHANGE24HOUR"],
        changepct24Hour: json["CHANGEPCT24HOUR"] == null ? null : json["CHANGEPCT24HOUR"],
        changeday: json["CHANGEDAY"] == null ? null : json["CHANGEDAY"],
        changepctday: json["CHANGEPCTDAY"] == null ? null : json["CHANGEPCTDAY"],
        changehour: json["CHANGEHOUR"] == null ? null : json["CHANGEHOUR"],
        changepcthour: json["CHANGEPCTHOUR"] == null ? null : json["CHANGEPCTHOUR"],
        conversiontype: json["CONVERSIONTYPE"] == null ? null : conversiontypeValues.map[json["CONVERSIONTYPE"]],
        conversionsymbol: json["CONVERSIONSYMBOL"] == null ? null : json["CONVERSIONSYMBOL"],
        supply: json["SUPPLY"] == null ? null : json["SUPPLY"],
        mktcap: json["MKTCAP"] == null ? null : json["MKTCAP"],
        mktcappenalty: json["MKTCAPPENALTY"] == null ? null : mktcappenaltyValues.map[json["MKTCAPPENALTY"]],
        circulatingsupply: json["CIRCULATINGSUPPLY"] == null ? null : json["CIRCULATINGSUPPLY"],
        circulatingsupplymktcap: json["CIRCULATINGSUPPLYMKTCAP"] == null ? null : json["CIRCULATINGSUPPLYMKTCAP"],
        totalvolume24H: json["TOTALVOLUME24H"] == null ? null : json["TOTALVOLUME24H"],
        totalvolume24Hto: json["TOTALVOLUME24HTO"] == null ? null : json["TOTALVOLUME24HTO"],
        totaltoptiervolume24H: json["TOTALTOPTIERVOLUME24H"] == null ? null : json["TOTALTOPTIERVOLUME24H"],
        totaltoptiervolume24Hto: json["TOTALTOPTIERVOLUME24HTO"] == null ? null : json["TOTALTOPTIERVOLUME24HTO"],
        imageurl: json["IMAGEURL"] == null ? null : json["IMAGEURL"],
    );

    Map<String, dynamic> toJson() => {
        "FROMSYMBOL": fromsymbol == null ? null : fromsymbol,
        "TOSYMBOL": tosymbol == null ? null : purpleTosymbolValues.reverse[tosymbol],
        "MARKET": market == null ? null : purpleMarketValues.reverse[market],
        "PRICE": price == null ? null : price,
        "LASTUPDATE": lastupdate == null ? null : lastupdateValues.reverse[lastupdate],
        "LASTVOLUME": lastvolume == null ? null : lastvolume,
        "LASTVOLUMETO": lastvolumeto == null ? null : lastvolumeto,
        "LASTTRADEID": lasttradeid == null ? null : lasttradeid,
        "VOLUMEDAY": volumeday == null ? null : volumeday,
        "VOLUMEDAYTO": volumedayto == null ? null : volumedayto,
        "VOLUME24HOUR": volume24Hour == null ? null : volume24Hour,
        "VOLUME24HOURTO": volume24Hourto == null ? null : volume24Hourto,
        "OPENDAY": openday == null ? null : openday,
        "HIGHDAY": highday == null ? null : highday,
        "LOWDAY": lowday == null ? null : lowday,
        "OPEN24HOUR": open24Hour == null ? null : open24Hour,
        "HIGH24HOUR": high24Hour == null ? null : high24Hour,
        "LOW24HOUR": low24Hour == null ? null : low24Hour,
        "LASTMARKET": lastmarket == null ? null : lastmarket,
        "VOLUMEHOUR": volumehour == null ? null : volumehour,
        "VOLUMEHOURTO": volumehourto == null ? null : volumehourto,
        "OPENHOUR": openhour == null ? null : openhour,
        "HIGHHOUR": highhour == null ? null : highhour,
        "LOWHOUR": lowhour == null ? null : lowhour,
        "TOPTIERVOLUME24HOUR": toptiervolume24Hour == null ? null : toptiervolume24Hour,
        "TOPTIERVOLUME24HOURTO": toptiervolume24Hourto == null ? null : toptiervolume24Hourto,
        "CHANGE24HOUR": change24Hour == null ? null : change24Hour,
        "CHANGEPCT24HOUR": changepct24Hour == null ? null : changepct24Hour,
        "CHANGEDAY": changeday == null ? null : changeday,
        "CHANGEPCTDAY": changepctday == null ? null : changepctday,
        "CHANGEHOUR": changehour == null ? null : changehour,
        "CHANGEPCTHOUR": changepcthour == null ? null : changepcthour,
        "CONVERSIONTYPE": conversiontype == null ? null : conversiontypeValues.reverse[conversiontype],
        "CONVERSIONSYMBOL": conversionsymbol == null ? null : conversionsymbol,
        "SUPPLY": supply == null ? null : supply,
        "MKTCAP": mktcap == null ? null : mktcap,
        "MKTCAPPENALTY": mktcappenalty == null ? null : mktcappenaltyValues.reverse[mktcappenalty],
        "CIRCULATINGSUPPLY": circulatingsupply == null ? null : circulatingsupply,
        "CIRCULATINGSUPPLYMKTCAP": circulatingsupplymktcap == null ? null : circulatingsupplymktcap,
        "TOTALVOLUME24H": totalvolume24H == null ? null : totalvolume24H,
        "TOTALVOLUME24HTO": totalvolume24Hto == null ? null : totalvolume24Hto,
        "TOTALTOPTIERVOLUME24H": totaltoptiervolume24H == null ? null : totaltoptiervolume24H,
        "TOTALTOPTIERVOLUME24HTO": totaltoptiervolume24Hto == null ? null : totaltoptiervolume24Hto,
        "IMAGEURL": imageurl == null ? null : imageurl,
    };
}

enum Conversiontype { DIRECT }

final conversiontypeValues = EnumValues({
    "direct": Conversiontype.DIRECT
});

enum Lastupdate { JUST_NOW, THE_11_MIN_AGO }

final lastupdateValues = EnumValues({
    "Just now": Lastupdate.JUST_NOW,
    "11 min ago": Lastupdate.THE_11_MIN_AGO
});

enum PurpleMarket { CRYPTO_COMPARE_INDEX }

final purpleMarketValues = EnumValues({
    "CryptoCompare Index": PurpleMarket.CRYPTO_COMPARE_INDEX
});

enum Mktcappenalty { THE_0 }

final mktcappenaltyValues = EnumValues({
    "0 %": Mktcappenalty.THE_0
});

enum PurpleTosymbol { EMPTY }

final purpleTosymbolValues = EnumValues({
    "\u0024": PurpleTosymbol.EMPTY
});

class Raw {
    Raw({
        this.usd,
    });

    RawUsd? usd;

    factory Raw.fromJson(Map<String, dynamic> json) => Raw(
        usd: json["USD"] == null ? null : RawUsd.fromJson(json["USD"]),
    );

    Map<String, dynamic> toJson() => {
        "USD": usd == null ? null : usd!.toJson(),
    };
}

class RawUsd {
    RawUsd({
        this.type,
        this.market,
        this.fromsymbol,
        this.tosymbol,
        this.flags,
        this.price,
        this.lastupdate,
        this.median,
        this.lastvolume,
        this.lastvolumeto,
        this.lasttradeid,
        this.volumeday,
        this.volumedayto,
        this.volume24Hour,
        this.volume24Hourto,
        this.openday,
        this.highday,
        this.lowday,
        this.open24Hour,
        this.high24Hour,
        this.low24Hour,
        this.lastmarket,
        this.volumehour,
        this.volumehourto,
        this.openhour,
        this.highhour,
        this.lowhour,
        this.toptiervolume24Hour,
        this.toptiervolume24Hourto,
        this.change24Hour,
        this.changepct24Hour,
        this.changeday,
        this.changepctday,
        this.changehour,
        this.changepcthour,
        this.conversiontype,
        this.conversionsymbol,
        this.supply,
        this.mktcap,
        this.mktcappenalty,
        this.circulatingsupply,
        this.circulatingsupplymktcap,
        this.totalvolume24H,
        this.totalvolume24Hto,
        this.totaltoptiervolume24H,
        this.totaltoptiervolume24Hto,
        this.imageurl,
    });

    String? type;
    FluffyMarket? market;
    String? fromsymbol;
    FluffyTosymbol? tosymbol;
    String? flags;
    double? price;
    int? lastupdate;
    double? median;
    double? lastvolume;
    double? lastvolumeto;
    String? lasttradeid;
    double? volumeday;
    double? volumedayto;
    double? volume24Hour;
    double? volume24Hourto;
    double? openday;
    double? highday;
    double? lowday;
    double? open24Hour;
    double? high24Hour;
    double? low24Hour;
    String? lastmarket;
    double? volumehour;
    double? volumehourto;
    double? openhour;
    double? highhour;
    double? lowhour;
    double? toptiervolume24Hour;
    double? toptiervolume24Hourto;
    double? change24Hour;
    double? changepct24Hour;
    double? changeday;
    double? changepctday;
    double? changehour;
    double? changepcthour;
    Conversiontype? conversiontype;
    String? conversionsymbol;
    double? supply;
    double? mktcap;
    int? mktcappenalty;
    double? circulatingsupply;
    double? circulatingsupplymktcap;
    double? totalvolume24H;
    double? totalvolume24Hto;
    double? totaltoptiervolume24H;
    double? totaltoptiervolume24Hto;
    String? imageurl;

    factory RawUsd.fromJson(Map<String, dynamic> json) => RawUsd(
        type: json["TYPE"] == null ? null : json["TYPE"],
        market: json["MARKET"] == null ? null : fluffyMarketValues.map[json["MARKET"]],
        fromsymbol: json["FROMSYMBOL"] == null ? null : json["FROMSYMBOL"],
        tosymbol: json["TOSYMBOL"] == null ? null : fluffyTosymbolValues.map[json["TOSYMBOL"]],
        flags: json["FLAGS"] == null ? null : json["FLAGS"],
        price: json["PRICE"] == null ? null : json["PRICE"].toDouble(),
        lastupdate: json["LASTUPDATE"] == null ? null : json["LASTUPDATE"],
        median: json["MEDIAN"] == null ? null : json["MEDIAN"].toDouble(),
        lastvolume: json["LASTVOLUME"] == null ? null : json["LASTVOLUME"].toDouble(),
        lastvolumeto: json["LASTVOLUMETO"] == null ? null : json["LASTVOLUMETO"].toDouble(),
        lasttradeid: json["LASTTRADEID"] == null ? null : json["LASTTRADEID"],
        volumeday: json["VOLUMEDAY"] == null ? null : json["VOLUMEDAY"].toDouble(),
        volumedayto: json["VOLUMEDAYTO"] == null ? null : json["VOLUMEDAYTO"].toDouble(),
        volume24Hour: json["VOLUME24HOUR"] == null ? null : json["VOLUME24HOUR"].toDouble(),
        volume24Hourto: json["VOLUME24HOURTO"] == null ? null : json["VOLUME24HOURTO"].toDouble(),
        openday: json["OPENDAY"] == null ? null : json["OPENDAY"].toDouble(),
        highday: json["HIGHDAY"] == null ? null : json["HIGHDAY"].toDouble(),
        lowday: json["LOWDAY"] == null ? null : json["LOWDAY"].toDouble(),
        open24Hour: json["OPEN24HOUR"] == null ? null : json["OPEN24HOUR"].toDouble(),
        high24Hour: json["HIGH24HOUR"] == null ? null : json["HIGH24HOUR"].toDouble(),
        low24Hour: json["LOW24HOUR"] == null ? null : json["LOW24HOUR"].toDouble(),
        lastmarket: json["LASTMARKET"] == null ? null : json["LASTMARKET"],
        volumehour: json["VOLUMEHOUR"] == null ? null : json["VOLUMEHOUR"].toDouble(),
        volumehourto: json["VOLUMEHOURTO"] == null ? null : json["VOLUMEHOURTO"].toDouble(),
        openhour: json["OPENHOUR"] == null ? null : json["OPENHOUR"].toDouble(),
        highhour: json["HIGHHOUR"] == null ? null : json["HIGHHOUR"].toDouble(),
        lowhour: json["LOWHOUR"] == null ? null : json["LOWHOUR"].toDouble(),
        toptiervolume24Hour: json["TOPTIERVOLUME24HOUR"] == null ? null : json["TOPTIERVOLUME24HOUR"].toDouble(),
        toptiervolume24Hourto: json["TOPTIERVOLUME24HOURTO"] == null ? null : json["TOPTIERVOLUME24HOURTO"].toDouble(),
        change24Hour: json["CHANGE24HOUR"] == null ? null : json["CHANGE24HOUR"].toDouble(),
        changepct24Hour: json["CHANGEPCT24HOUR"] == null ? null : json["CHANGEPCT24HOUR"].toDouble(),
        changeday: json["CHANGEDAY"] == null ? null : json["CHANGEDAY"].toDouble(),
        changepctday: json["CHANGEPCTDAY"] == null ? null : json["CHANGEPCTDAY"].toDouble(),
        changehour: json["CHANGEHOUR"] == null ? null : json["CHANGEHOUR"].toDouble(),
        changepcthour: json["CHANGEPCTHOUR"] == null ? null : json["CHANGEPCTHOUR"].toDouble(),
        conversiontype: json["CONVERSIONTYPE"] == null ? null : conversiontypeValues.map[json["CONVERSIONTYPE"]],
        conversionsymbol: json["CONVERSIONSYMBOL"] == null ? null : json["CONVERSIONSYMBOL"],
        supply: json["SUPPLY"] == null ? null : json["SUPPLY"].toDouble(),
        mktcap: json["MKTCAP"] == null ? null : json["MKTCAP"].toDouble(),
        mktcappenalty: json["MKTCAPPENALTY"] == null ? null : json["MKTCAPPENALTY"],
        circulatingsupply: json["CIRCULATINGSUPPLY"] == null ? null : json["CIRCULATINGSUPPLY"].toDouble(),
        circulatingsupplymktcap: json["CIRCULATINGSUPPLYMKTCAP"] == null ? null : json["CIRCULATINGSUPPLYMKTCAP"].toDouble(),
        totalvolume24H: json["TOTALVOLUME24H"] == null ? null : json["TOTALVOLUME24H"].toDouble(),
        totalvolume24Hto: json["TOTALVOLUME24HTO"] == null ? null : json["TOTALVOLUME24HTO"].toDouble(),
        totaltoptiervolume24H: json["TOTALTOPTIERVOLUME24H"] == null ? null : json["TOTALTOPTIERVOLUME24H"].toDouble(),
        totaltoptiervolume24Hto: json["TOTALTOPTIERVOLUME24HTO"] == null ? null : json["TOTALTOPTIERVOLUME24HTO"].toDouble(),
        imageurl: json["IMAGEURL"] == null ? null : json["IMAGEURL"],
    );

    Map<String, dynamic> toJson() => {
        "TYPE": type == null ? null : type,
        "MARKET": market == null ? null : fluffyMarketValues.reverse[market],
        "FROMSYMBOL": fromsymbol == null ? null : fromsymbol,
        "TOSYMBOL": tosymbol == null ? null : fluffyTosymbolValues.reverse[tosymbol],
        "FLAGS": flags == null ? null : flags,
        "PRICE": price == null ? null : price,
        "LASTUPDATE": lastupdate == null ? null : lastupdate,
        "MEDIAN": median == null ? null : median,
        "LASTVOLUME": lastvolume == null ? null : lastvolume,
        "LASTVOLUMETO": lastvolumeto == null ? null : lastvolumeto,
        "LASTTRADEID": lasttradeid == null ? null : lasttradeid,
        "VOLUMEDAY": volumeday == null ? null : volumeday,
        "VOLUMEDAYTO": volumedayto == null ? null : volumedayto,
        "VOLUME24HOUR": volume24Hour == null ? null : volume24Hour,
        "VOLUME24HOURTO": volume24Hourto == null ? null : volume24Hourto,
        "OPENDAY": openday == null ? null : openday,
        "HIGHDAY": highday == null ? null : highday,
        "LOWDAY": lowday == null ? null : lowday,
        "OPEN24HOUR": open24Hour == null ? null : open24Hour,
        "HIGH24HOUR": high24Hour == null ? null : high24Hour,
        "LOW24HOUR": low24Hour == null ? null : low24Hour,
        "LASTMARKET": lastmarket == null ? null : lastmarket,
        "VOLUMEHOUR": volumehour == null ? null : volumehour,
        "VOLUMEHOURTO": volumehourto == null ? null : volumehourto,
        "OPENHOUR": openhour == null ? null : openhour,
        "HIGHHOUR": highhour == null ? null : highhour,
        "LOWHOUR": lowhour == null ? null : lowhour,
        "TOPTIERVOLUME24HOUR": toptiervolume24Hour == null ? null : toptiervolume24Hour,
        "TOPTIERVOLUME24HOURTO": toptiervolume24Hourto == null ? null : toptiervolume24Hourto,
        "CHANGE24HOUR": change24Hour == null ? null : change24Hour,
        "CHANGEPCT24HOUR": changepct24Hour == null ? null : changepct24Hour,
        "CHANGEDAY": changeday == null ? null : changeday,
        "CHANGEPCTDAY": changepctday == null ? null : changepctday,
        "CHANGEHOUR": changehour == null ? null : changehour,
        "CHANGEPCTHOUR": changepcthour == null ? null : changepcthour,
        "CONVERSIONTYPE": conversiontype == null ? null : conversiontypeValues.reverse[conversiontype],
        "CONVERSIONSYMBOL": conversionsymbol == null ? null : conversionsymbol,
        "SUPPLY": supply == null ? null : supply,
        "MKTCAP": mktcap == null ? null : mktcap,
        "MKTCAPPENALTY": mktcappenalty == null ? null : mktcappenalty,
        "CIRCULATINGSUPPLY": circulatingsupply == null ? null : circulatingsupply,
        "CIRCULATINGSUPPLYMKTCAP": circulatingsupplymktcap == null ? null : circulatingsupplymktcap,
        "TOTALVOLUME24H": totalvolume24H == null ? null : totalvolume24H,
        "TOTALVOLUME24HTO": totalvolume24Hto == null ? null : totalvolume24Hto,
        "TOTALTOPTIERVOLUME24H": totaltoptiervolume24H == null ? null : totaltoptiervolume24H,
        "TOTALTOPTIERVOLUME24HTO": totaltoptiervolume24Hto == null ? null : totaltoptiervolume24Hto,
        "IMAGEURL": imageurl == null ? null : imageurl,
    };
}

enum FluffyMarket { CCCAGG }

final fluffyMarketValues = EnumValues({
    "CCCAGG": FluffyMarket.CCCAGG
});

enum FluffyTosymbol { USD }

final fluffyTosymbolValues = EnumValues({
    "USD": FluffyTosymbol.USD
});

class MetaData {
    MetaData({
        this.count,
    });

    int? count;

    factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
        count: json["Count"] == null ? null : json["Count"],
    );

    Map<String, dynamic> toJson() => {
        "Count": count == null ? null : count,
    };
}

class RateLimit {
    RateLimit();

    factory RateLimit.fromJson(Map<String, dynamic> json) => RateLimit(
    );

    Map<String, dynamic> toJson() => {
    };
}

class SponsoredDatum {
    SponsoredDatum({
        this.coinInfo,
    });

    CoinInfo? coinInfo;

    factory SponsoredDatum.fromJson(Map<String, dynamic> json) => SponsoredDatum(
        coinInfo: json["CoinInfo"] == null ? null : CoinInfo.fromJson(json["CoinInfo"]),
    );

    Map<String, dynamic> toJson() => {
        "CoinInfo": coinInfo == null ? null : coinInfo!.toJson(),
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
