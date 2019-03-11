import 'package:fms_app/src/models/mc.dart';
import 'package:fms_app/src/repositories/mc_repository.dart';
import 'package:scoped_model/scoped_model.dart';


class McModel extends Model {
  McModel (this._repository);

  final McRepository _repository;

  bool _isLoading = false;
  Mc _mc;

  bool get isLoading => _isLoading;
  Mc get mc => _mc;

  void loadMcData() {
    _isLoading = true;
    notifyListeners();
    _repository.fetchMc(123).then((mc) {
      _isLoading = false;
      _mc = mc;
      notifyListeners();
    });
  }


}