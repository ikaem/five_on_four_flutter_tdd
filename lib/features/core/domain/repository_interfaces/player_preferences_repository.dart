import 'dart:math';

import 'package:five_on_four_flutter_tdd/features/core/domain/values/location/value.dart';

abstract class PlayerPreferencesRepository {
  Stream<String?> get avatarUrlStream;
  Stream<LocationValue?> get playerCurrentLocationStream;
  Stream<int?> get playerRegionSizeStream;
  Stream<TeamModel?> get playerTeamStream;

  void setAvatarUrl(String avatarUrl);
  void setPlayerTeam(TeamModel team);
  void setPlayerCurrentLocation(LocationValue? location);
  void setPlayerRegionSize(int regionSize);

  // getters - not sure if this should be streams or real values

  // disposer
  Future<void> dispose();
}

// TODO temp model, move to models when team feature comeas in
class TeamModel {
  const TeamModel({
    required this.name,
    required this.id,
  });

  final String id;
  final String name;

  factory TeamModel.fromRandom() {
    final Random rand = Random();
    final String id = rand.nextInt(10000).toString();

    return TeamModel(
      id: id,
      name: "random_team_name",
    );
  }
}
