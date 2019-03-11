import 'package:fms_app/src/models/mc.dart';

class McRepository{

  Future<Mc> fetchMc(int mcId) async {
    final imgLink = 'https://www.elestilolibre.com/wp-content/uploads/2018/09/dani.jpg';
    await Future.delayed(Duration(seconds: 3));
    return Mc('Daniel Ribas', 'dani', 19, imgLink, 'Rapero del quinto escalon');

  }
  
  
}