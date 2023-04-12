import 'package:five_on_four_flutter_tdd/features/matches/data/dtos/match_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_info/model.dart';

import 'weather.dart';

final MatchRemoteDTO testMatchRemoteDTO = MatchRemoteDTO(
  id: "1",
  name: "Test match",
  participants: [],
);

final MatchModel testMatchModel = MatchModel.fromRemoteDto(testMatchRemoteDTO);

final MatchInfoModel testMatchInfoModel =
    MatchInfoModel.fromWeatherAndMatchModels(
  match: testMatchModel,
  weather: testWeatherModel,
);
