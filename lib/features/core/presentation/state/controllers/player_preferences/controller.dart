import 'package:five_on_four_flutter_tdd/features/core/domain/repository_interfaces/player_preferences_repository.dart';
import 'package:five_on_four_flutter_tdd/features/core/domain/values/location/value.dart';

abstract class PlayerPreferencesController {
// TOOD temp, we will see how it goes - probably dont need this
  Stream<int> get regionSizeStream;
  Stream<LocationValue?> get currentLocationStream;

  String get currentPlayerNickname;

  // TODO test - remove from here
  Future<void> onDeleteAccount();

  void onChangeRegionSize(int regionSize);
  // TODO not sure if this will be here
  Future<void> onChangeTeam(TeamModel team);

  // TODO will also need a way to change avatar image

  // TODO not sure what to do here
  void dispose();
}
