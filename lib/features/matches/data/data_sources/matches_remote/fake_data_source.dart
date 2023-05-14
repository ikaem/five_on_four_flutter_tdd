import 'package:collection/collection.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/data_sources/matches_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/dtos/match_participant_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/dtos/match_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/enums/match_participant_status.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/exceptions/match_exceptions.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/match_participantion/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/matches_search_filters/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/new_match/value.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';

class MatchesRemoteFakeDataSource implements MatchesRemoteDataSource {
  @override
  Future<List<MatchRemoteDTO>> getInvitedMatchesForPlayer(
      String playerId) async {
    await Future<void>.delayed(Duration(milliseconds: 200));

    final allMatches = combinedMatches;
    final List<MatchRemoteDTO> invitedMatches = allMatches.where(
      (match) {
        final MatchParticipantRemoteDTO? invitedParticipation =
            match.participants.firstWhereOrNull((participant) {
          return participant.playerId == playerId &&
              participant.status == MatchParticipantStatus.invited.name;
        });

        if (invitedParticipation == null) return false;

        return true;
      },
    ).toList();

    return invitedMatches;
  }

  @override
  Future<List<MatchRemoteDTO>> getJoinedMatchesForPlayer(
      String playerId) async {
    await Future<void>.delayed(Duration(milliseconds: 200));
    final List<MatchRemoteDTO> joinedMatches = combinedMatches.where(
      (match) {
        final MatchParticipantRemoteDTO? currentPlayer = match.participants
            .firstWhereOrNull((participant) =>
                participant.playerId == playerId &&
                participant.status == MatchParticipantStatus.joined.name);

        if (currentPlayer == null) return false;

        return true;
      },
    ).toList();

    return joinedMatches;
  }

  @override
  Future<MatchRemoteDTO> getNextMatchForPlayer(String playerId) async {
    await Future<void>.delayed(Duration(milliseconds: 200));
    return combinedMatches[0];
  }

  @override
  Future<MatchRemoteDTO> getMatch(String matchId) async {
    await Future<void>.delayed(Duration(milliseconds: 200));

    final allMatches = combinedMatches;

    final MatchRemoteDTO? match =
        allMatches.firstWhereOrNull((element) => element.id == matchId);

    if (match == null)
      throw MatchExceptionNotFoundRemote(message: "Match id: $matchId");

    return match;
  }

  @override
  Future<String> createMatch({
    required NewMatchValue matchData,
    required PlayerModel currentPlayer,
  }) async {
    await Future<void>.delayed(Duration(milliseconds: 200));

    final String matchId = combinedMatches.length.toString();

    final bool isOrganizerJoining = matchData.isOrganizerJoined;
    if (isOrganizerJoining)
      matchData.invitedPlayers.add(
        MatchParticipationValue.fromPlayerModel(
          player: currentPlayer,
          status: MatchParticipantStatus.joined,
        ),
      );

    final MatchRemoteDTO newMatch = MatchRemoteDTO.fromNewMatchValue(
        matchId: matchId, organizerId: currentPlayer.id, matchValue: matchData);

    combinedMatches.add(newMatch);

    return matchId;
  }

  @override
  Future<void> joinMatch({
    required String matchId,
    required MatchParticipationValue matchParticipation,
  }) async {
    final MatchRemoteDTO? match = combinedMatches.firstWhereOrNull(
      (match) => match.id == matchId,
    );

    if (match == null)
      throw MatchExceptionNotFoundRemote(message: "Match: $matchId");

    final MatchParticipantRemoteDTO? existingParticipant = match.participants
        .firstWhereOrNull(
            (element) => element.playerId == matchParticipation.playerId);

    if (existingParticipant == null) {
      final MatchParticipantRemoteDTO participant =
          MatchParticipantRemoteDTO.fromMatchParticipantInvitationValue(
        invitationValue: matchParticipation,
        matchId: matchId,
        status: MatchParticipantStatus.joined.name,
      );

      final List<MatchParticipantRemoteDTO> matchParticipants = [
        ...match.participants,
      ];

      matchParticipants.add(participant);
      final MatchRemoteDTO updatedMatch =
          match.copyWith(participants: matchParticipants);

      final int matchIndex = combinedMatches.indexWhere(
        (match) => match.id == updatedMatch.id,
      );

      combinedMatches[matchIndex] = updatedMatch;

      return;
    }

    final bool hasExistingParticipantConfirmed =
        existingParticipant.status == MatchParticipantStatus.joined.name;

    if (hasExistingParticipantConfirmed) {
      throw MatchExceptionPlayerAlreadyJoined(
          message: "Match: $matchId, player: ${matchParticipation.playerId}");
    }

    final MatchParticipantRemoteDTO updatedParticipant = existingParticipant
        .copyWith(status: MatchParticipantStatus.joined.name);

    final int participantIndex =
        match.participants.indexWhere((p) => p.id == updatedParticipant.id);

    final List<MatchParticipantRemoteDTO> matchParticipants = [
      ...match.participants,
    ];

    matchParticipants[participantIndex] = updatedParticipant;

    final MatchRemoteDTO updatedMatch =
        match.copyWith(participants: matchParticipants);

    final int matchIndex = combinedMatches.indexWhere(
      (match) => match.id == updatedMatch.id,
    );

    combinedMatches[matchIndex] = updatedMatch;
  }

  Future<void> unjoinMatch({
    required String matchId,
    required MatchParticipationValue matchParticipation,
  }) async {
    final MatchRemoteDTO? match = combinedMatches.firstWhereOrNull(
      (match) => match.id == matchId,
    );

    if (match == null)
      throw MatchExceptionNotFoundRemote(message: "Match: $matchId");

    final MatchParticipantRemoteDTO? existingParticipant = match.participants
        .firstWhereOrNull(
            (element) => element.playerId == matchParticipation.playerId);

    if (existingParticipant == null) {
      throw MatchExceptionPlayerAlreadyUnjoined(
          message: "Match: $matchId, player: ${matchParticipation.playerId}");
    }

    final List<MatchParticipantRemoteDTO> matchParticipants = [
      ...match.participants,
    ];

    matchParticipants
        .removeWhere((p) => p.playerId == matchParticipation.playerId);
    final MatchRemoteDTO updatedMatch =
        match.copyWith(participants: matchParticipants);

    final int matchIndex = combinedMatches.indexWhere(
      (match) => match.id == updatedMatch.id,
    );

    combinedMatches[matchIndex] = updatedMatch;
  }

  @override
  Future<List<MatchRemoteDTO>> getSearchedMatches(
      MatchesSearchFiltersValue filters) async {
    await Future<void>.delayed(Duration(milliseconds: 500));

    return combinedMatches;
  }
}

final List<MatchRemoteDTO> combinedMatches = [
  MatchRemoteDTO(
    id: "1",
    name: "Match 1",
    date: DateTime.now().millisecondsSinceEpoch,
    location: MatchRemoteLocationDTO(
      cityLatitude: 45.815,
      cityLongitude: 15.9819,
      locationAddress: "Some Adddress",
      locationName: "Some Location Name",
      locationCountry: "Croatia",
      locationCity: "Zagreb",
    ),
    participants: [
      MatchParticipantRemoteDTO(
        id: "1",
        playerId: "1",
        matchId: "1",
        nickname: "Player 1",
        status: MatchParticipantStatus.invited.name,
        createdAt: 1617355557658,
        expiresAt: 1617355557658 + 60 * 60 * 1000, // 1 hour later
      ),
      MatchParticipantRemoteDTO(
        id: "2",
        playerId: "2",
        matchId: "1",
        nickname: "Player 2",
        status: MatchParticipantStatus.invited.name,
        createdAt: 1617355557658,
        expiresAt: 1617355557658 + 60 * 60 * 1000, // 1 hour later
      ),
    ],
  ),
  MatchRemoteDTO(
    id: "2",
    name: "Match 2",
    date: DateTime.now().millisecondsSinceEpoch,
    location: MatchRemoteLocationDTO(
      cityLatitude: 45.815,
      cityLongitude: 15.9819,
      locationAddress: "Some Adddress",
      locationName: "Some Location Name",
      locationCountry: "Croatia",
      locationCity: "Zagreb",
    ),
    participants: [
      MatchParticipantRemoteDTO(
        id: "3",
        playerId: "1",
        matchId: "2",
        nickname: "Player 1",
        status: MatchParticipantStatus.invited.name,
        createdAt: 1617355557658,
        expiresAt: 1617355557658 + 60 * 60 * 1000, // 1 hour later
      ),
      MatchParticipantRemoteDTO(
        id: "4",
        playerId: "3",
        matchId: "2",
        nickname: "Player 3",
        status: MatchParticipantStatus.invited.name,
        createdAt: 1617355557658,
        expiresAt: 1617355557658 + 60 * 60 * 1000, // 1 hour later
      ),
    ],
  ),
  MatchRemoteDTO(
    id: "3",
    name: "Match 3",
    date: DateTime.now().millisecondsSinceEpoch,
    location: MatchRemoteLocationDTO(
      cityLatitude: 45.815,
      cityLongitude: 15.9819,
      locationAddress: "Some Adddress",
      locationName: "Some Location Name",
      locationCountry: "Croatia",
      locationCity: "Zagreb",
    ),
    participants: [
      MatchParticipantRemoteDTO(
        id: "5",
        playerId: "1",
        matchId: "3",
        nickname: "Player 1",
        status: MatchParticipantStatus.joined.name,
        createdAt: 1617355557658,
        expiresAt: null,
      ),
      MatchParticipantRemoteDTO(
        id: "6",
        playerId: "2",
        matchId: "3",
        nickname: "Player 2",
        status: MatchParticipantStatus.joined.name,
        createdAt: 1617355557658,
        expiresAt: null,
      ),
    ],
  ),
  MatchRemoteDTO(
    id: "4",
    name: "Match 4",
    date: DateTime.now().millisecondsSinceEpoch,
    location: MatchRemoteLocationDTO(
      cityLatitude: 45.815,
      cityLongitude: 15.9819,
      locationAddress: "Some Adddress",
      locationName: "Some Location Name",
      locationCountry: "Croatia",
      locationCity: "Zagreb",
    ),
    participants: [
      MatchParticipantRemoteDTO(
        id: "7",
        playerId: "1",
        matchId: "4",
        nickname: "Player 1",
        status: MatchParticipantStatus.joined.name,
        createdAt: 1617355557658,
        expiresAt: null,
      ),
      MatchParticipantRemoteDTO(
        id: "8",
        playerId: "3",
        matchId: "4",
        nickname: "Player 3",
        status: MatchParticipantStatus.joined.name,
        createdAt: 1617355557658,
        expiresAt: null,
      ),
    ],
  ),
];
