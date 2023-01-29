class KriptoModel {
  final dynamic name;
  final dynamic symbol;
  final dynamic image;
  final dynamic currentPrice;
  final dynamic marketCap;
  final dynamic marketCapRank;
  final dynamic fullyDilutedValuation;
  final dynamic totalVolume;
  final dynamic high24h;
  final dynamic low24h;
  final dynamic priceChange24h;
  final dynamic priceChangePercentage24h;
  final dynamic marketCapChange24h;
  final dynamic marketCapChangePercentage24h;
  final dynamic circulatingSupply;
  final dynamic totalSupply;
  final dynamic maxSupply;
  final dynamic ath;
  final dynamic athChangePercentage;
  final dynamic athDate;
  final dynamic atl;
  final dynamic atlChangePercentage;
  final dynamic atlDate;
  final dynamic roi;
  final dynamic lastUpdated;
  final SparklineIn7D sparklineIn7D;

  KriptoModel({
    this.marketCapRank,
    this.fullyDilutedValuation,
    this.high24h,
    this.low24h,
    this.priceChange24h,
    this.priceChangePercentage24h,
    this.marketCapChange24h,
    this.marketCapChangePercentage24h,
    this.circulatingSupply,
    this.totalSupply,
    this.maxSupply,
    this.ath,
    this.athChangePercentage,
    this.athDate,
    this.atl,
    this.atlChangePercentage,
    this.atlDate,
    this.lastUpdated,
    this.name,
    this.symbol,
    this.image,
    this.currentPrice,
    this.marketCap,
    this.totalVolume,
    this.roi,
    required this.sparklineIn7D,
  });

  factory KriptoModel.fromJson(Map<String, dynamic> json) {
    return KriptoModel(
      name: json['name'],
      symbol: json['symbol'],
      image: json['image'],
      currentPrice: json['current_price'],
      marketCap: json['market_cap'],
      marketCapRank: json['market_cap_rank'],
      fullyDilutedValuation: json["fully_diluted_valuation"],
      totalVolume: json["total_volume"],
      high24h: json["high_24h"],
      low24h: json["low_24h"],
      priceChange24h: json["price_change_24h"],
      priceChangePercentage24h: json["price_change_percentage_24h"],
      marketCapChange24h: json["market_cap_change_24h"],
      marketCapChangePercentage24h: json["market_cap_change_percentage_24h"],
      circulatingSupply: json["circulating_supply"],
      totalSupply: json["total_supply"],
      maxSupply: json["max_supply"],
      ath: json["ath"],
      athChangePercentage: json["ath_change_percentage"],
      athDate: json["ath_date"],
      atl: json["atl"],
      atlChangePercentage: json["atl_change_percentage"],
      atlDate: json["atl_date"],
      roi: json["roi"],
      lastUpdated: json["last_updated"],
      sparklineIn7D: SparklineIn7D.fromJson(json["sparkline_in_7d"]),
    );
  }
}
List<KriptoModel> kriptoList = [];
 List<dynamic> listGrafik = [];
 
 class SparklineIn7D {
    SparklineIn7D({
        this.price,
    });

    List<double>? price;

    factory SparklineIn7D.fromJson(Map<String, dynamic> json) => SparklineIn7D(
        price: List<double>.from(json["price"].map((x) => x.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "price": List<dynamic>.from(price!.map((x) => x)),
    };
} 