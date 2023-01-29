class Welcome4 {
    Welcome4({
        this.haberler,
    });

    Haberler? haberler;
}

class Haberler {
    Haberler({
        this.haber,
    });

    List<Haber>? haber;
}

class Haber {
    Haber({
        this.haberManset,
        this.haberResim,
        this.haberLink,
        this.haberId,
        this.haberVideo,
        this.haberAciklama,
        this.haberMetni,
        this.haberKategorisi,
        this.haberTarihi,
        this.mansetResim,
        this.izlesId,
        this.yorumSay,
        this.okunmaadedi,
        this.anasayfamanset,
        this.kategorimanset,
    });

    String? haberManset;
    String? haberResim;
    String? haberLink;
    String? haberId;
    String? haberVideo;
    String? haberAciklama;
    String? haberMetni;
    String? haberKategorisi;
    String? haberTarihi;
    String? mansetResim;
    String? izlesId;
    String? yorumSay;
    String? okunmaadedi;
    String? anasayfamanset;
    String? kategorimanset;


    factory Haber.fromJson(Map<String, dynamic> json) {
    return Haber(
      haberManset: json['haber_manset'].toString(),
      haberResim: json['haber_resim'].toString(),
      haberLink: json['haber_link'].toString(),
      haberId: json['haber_id'].toString(),
      haberVideo: json['haber_video'].toString(),
      haberAciklama: json['haber_aciklama'].toString(),
      haberMetni: json['haber_metni'].toString(),
      haberKategorisi: json["haber_kategorisi"].toString(),
      haberTarihi: json["haber_tarihi"].toString(),
      mansetResim: json["manset_resim"].toString(),
      yorumSay: json["yorumSay"].toString(),
      okunmaadedi: json["okunmaadedi"].toString(),
      kategorimanset: json["kategorimanset"].toString(),
     
    );
  }
}

List<Haber> haberList = [];

class Anasayfamanset {
    Anasayfamanset({
        this.cdata,
    });

    String? cdata;
}

enum HaberKategorisi { EKONOMI, DNYA }
