import 'package:scoped_model/scoped_model.dart';

class MainPageModel extends Model {

  int _currentPage = 0;

  int get currentPage => _currentPage;

  void changePage(int page) {
    _currentPage = page;
    notifyListeners();
  }

}