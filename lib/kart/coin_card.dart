import 'package:doviz_projeler/grafik/deneme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx_servis/coin_servis.dart';

class CoinCard extends StatelessWidget {
  CoinCard(
      {required this.name,
      required this.symbol,
      required this.current_price,
      required this.marketCapChangePercentage24h,
      required this.imageUrl,
      required this.yuksek24Saat,
      required this.dusuk24Saat,
      required this.islemHacim,
      required this.piyasaDeger,
      required this.tumZamanEnYuksek,
      required this.tumZamanEnDusuk,
      required this.rank,
      required this.grfikVeri,
      required this.index});

  String name;
  String symbol;
  var current_price;
  double marketCapChangePercentage24h;
  var imageUrl;
  var yuksek24Saat;
  var dusuk24Saat;
  var islemHacim;
  var piyasaDeger;
  var tumZamanEnYuksek;
  var tumZamanEnDusuk;
  var rank;
  int index;
  List<dynamic> grfikVeri;
  final _controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    if (grfikVeri.length == 0) {
      return CircularProgressIndicator(
        color: Colors.white,
      );
    }
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 13, 2, 31)),
        child: Obx(
          () => _controller.isLoading.value
              ? CircularProgressIndicator()
              : ListTile(
                
                  leading: Image.network(
                    symbol,
                    width: 40,
                  ),
                  title: Text(
                    name,
                    style: TextStyle(color: Colors.white70),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 3),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$${current_price.toString()}',
                          style: TextStyle(
                            color: Colors.white70,
                          )),
                      Text(
                        '${marketCapChangePercentage24h.toDouble().toStringAsFixed(4)}%',
                        style: TextStyle(
                            color: marketCapChangePercentage24h.toDouble() > 0
                                ? Colors.green
                                : Colors.red,
                            fontSize: 15),
                      ),
                    ],
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.only(top: 22),
                    child: Icon(
                      Icons.arrow_right,
                      color: Colors.yellow,
                      size: 35,
                    ),
                  ),
                  onTap: (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Deneme(
                            name: name,
                            symbol: symbol,
                            anlikFiyat: current_price,
                            gunlukdegisim: marketCapChangePercentage24h,
                            dusuk24Saat: dusuk24Saat,
                            yuksek24Saat: yuksek24Saat,
                            islemHacim: islemHacim,
                            piyasaDeger: piyasaDeger,
                            tumZamanEnDusuk: tumZamanEnDusuk,
                            tumZamanEnYuksek: tumZamanEnYuksek,
                            rank: rank,
                            grfikVeri: [grfikVeri],
                            index: index,
                          ),
                        ));
                  }),
                ),
        ));
  }
}
