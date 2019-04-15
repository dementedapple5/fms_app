import 'package:fms_app/src/models/rooster.dart';
import 'package:fms_app/src/repositories/rooster_repository.dart';
import 'package:scoped_model/scoped_model.dart';


class RoosterModel extends Model {
  RoosterModel (this._repository);

  final RoosterRepository _repository;

  bool _isLoading = false;
  List<Rooster> _roosters;

  bool get isLoading => _isLoading;
  List<Rooster> get roosters => _roosters;

  void loadMcData() {
    _isLoading = true;
    notifyListeners();
    _repository.fetchRoosters().then((roosters) {
      _isLoading = false;
      _roosters = roosters;
      notifyListeners();
    });
  }


}