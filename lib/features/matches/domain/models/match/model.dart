import 'package:five_on_four_flutter_tdd/features/matches/data/dtos/match_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/enums/match_participant_status.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_participant/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/utils/extensions/match_model_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';

@freezed
class MatchModel with _$MatchModel {
  const factory MatchModel({
    required String id,
    required String name,
    // TODO WE WILL only have one date, and time of date will combine all of this
    required DateTime date,
    required List<MatchParticipantModel> joinedParticipants,
    required List<MatchParticipantModel> invitedParticipants,
    required MatchLocationModel location,
  }) = _MatchModel;

  factory MatchModel.fromRemoteDto(MatchRemoteDTO remoteDto) {
    final List<MatchParticipantModel> allParticipants = remoteDto.participants
        .map((p) => MatchParticipantModel.fromRemoteDTO(p))
        .toList();

    final List<MatchParticipantModel> matchJoinedParticipants =
        MatchModelExtension.filterMatchParticipantsByStatus(
      status: MatchParticipantStatus.joined,
      participants: allParticipants,
    );

    final List<MatchParticipantModel> matchInvitedParticipants =
        MatchModelExtension.filterMatchParticipantsByStatus(
      status: MatchParticipantStatus.invited,
      participants: allParticipants,
    );

    final DateTime matchDate =
        DateTime.fromMillisecondsSinceEpoch(remoteDto.date);

    final MatchLocationModel matchLocation = MatchLocationModel.fromRemoteDto(
      remoteDto.location,
    );

    final MatchModel match = MatchModel(
      id: remoteDto.id,
      name: remoteDto.name,
      joinedParticipants: matchJoinedParticipants,
      invitedParticipants: matchInvitedParticipants,
      date: matchDate,
      location: matchLocation,
    );

    return match;
  }

  factory MatchModel.fromRandom() {
    final String id = '1';
    final String name = 'Some random match name';
    final List<MatchParticipantModel> joinedParticipants = [];
    final List<MatchParticipantModel> invitedParticipants = [];

    return MatchModel(
      id: id,
      name: name,
      joinedParticipants: joinedParticipants,
      invitedParticipants: invitedParticipants,
      date: DateTime.now(),
      location: MatchLocationModel(
        cityLatitude: 45.815,
        cityLongitude: 15.9819,
        locationAddress: "Some Adddress",
        locationName: "Some Location Name",
        locationCountry: "Croatia",
        locationCity: "Zagreb",
      ),
    );
  }
}

// TODO this possibly also generate with freezed
@immutable
class MatchLocationModel {
  const MatchLocationModel({
    required this.cityLatitude,
    required this.cityLongitude,
    required this.locationAddress,
    required this.locationName,
    required this.locationCountry,
    required this.locationCity,
  });

  factory MatchLocationModel.fromRemoteDto(
    MatchRemoteLocationDTO remoteDto,
  ) {
    final double? cityLatitude = remoteDto.cityLatitude;
    final double? cityLongitude = remoteDto.cityLongitude;
    final String locationAddress = remoteDto.locationAddress;
    final String locationName = remoteDto.locationName;
    final String locationCountry = remoteDto.locationCountry;
    final String locationCity = remoteDto.locationCity;

    final MatchLocationModel model = MatchLocationModel(
      cityLatitude: cityLatitude,
      cityLongitude: cityLongitude,
      locationAddress: locationAddress,
      locationName: locationName,
      locationCountry: locationCountry,
      locationCity: locationCity,
    );

    return model;
  }

  final double? cityLatitude;
  final double? cityLongitude;
  final String locationAddress;
  final String locationName;
  final String locationCountry;
  final String locationCity;
}

// TODO move to extensions
extension MatchLocationModelExtension on MatchLocationModel {
  bool get hasCoordinates => cityLatitude != null && cityLongitude != null;
}
