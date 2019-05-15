import 'package:fms_app/src/models/tournament.dart';
import 'package:fms_app/src/repositories/tournament_repository.dart';
import 'package:fms_app/src/utils/db_client.dart';
import 'package:scoped_model/scoped_model.dart';

class TournamentsPageModel extends Model {

  TournamentsPageModel(this._tournamentRepository);

  TournamentRepository _tournamentRepository;

  List<Tournament> _tournaments;
  bool _isLoading;


  List<Tournament> get tournaments => _tournaments;
  bool get isLoading => _isLoading;


  void loadTournaments() async {





  }


}