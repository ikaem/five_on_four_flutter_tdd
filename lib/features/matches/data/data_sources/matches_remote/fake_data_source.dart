import 'package:collection/collection.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/data_sources/matches_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/dtos/match_participant_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/dtos/match_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/enums/match_participant_status.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/exceptions/match_exceptions.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/match_participantion/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/new_match/value.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';

class MatchesRemoteFakeDataSource implements MatchesRemoteDataSource {
  @override
  Future<List<MatchRemoteDTO>> getInvitedMatchesForPlayer(
      String playerId) async {
    await Future.delayed(Duration(milliseconds: 200));

    final allMatches = combinedMatches;
    final List<MatchRemoteDTO> invitedMatches = allMatches.where(
      (match) {
        // TODO test
        final MatchParticipantRemoteDTO? invitedParticipation =
            match.participants.firstWhereOrNull((participant) {
          return participant.playerId == playerId &&
              participant.status == MatchParticipantStatus.invited.name;
        });

        // TODO TEST
        if (invitedParticipation == null) return false;

        return true;
      },
    ).toList();

    return invitedMatches;
  }

  @override
  Future<List<MatchRemoteDTO>> getJoinedMatchesForPlayer(
      String playerId) async {
    await Future.delayed(Duration(milliseconds: 200));
    final List<MatchRemoteDTO> joinedMatches = combinedMatches.where(
      (match) {
        // TODO test
        final MatchParticipantRemoteDTO? currentPlayer = match.participants
            .firstWhereOrNull((participant) =>
                participant.playerId == playerId &&
                participant.status == MatchParticipantStatus.joined.name);

        // TODO TEST
        if (currentPlayer == null) return false;

        return true;
      },
    ).toList();

    return joinedMatches;
  }

  @override
  Future<MatchRemoteDTO> getNextMatchForPlayer(String playerId) async {
    await Future.delayed(Duration(milliseconds: 200));
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

// TODO test
  @override
  Future<String> createMatch({
    required NewMatchValue matchData,
    // TODO this needs to be kept in either some repository, or i keep it now in the controller. but it should probably be kept in a repository
    // TODO it is kept in repository - there is auth status repository
    // so match service can be provided this - and then
    //
    required PlayerModel currentPlayer,
  }) async {
    await Future.delayed(Duration(milliseconds: 200));

    final String matchId = combinedMatches.length.toString();
    // TODO with firebase, we have to do this part. ideally, backend would do this
    // TODO
    final bool isOrganizerJoining = matchData.isOrganizerJoined;
    if (isOrganizerJoining)
      matchData.invitedPlayers.add(
        MatchParticipationValue.fromPlayerModel(currentPlayer),
      );

    final MatchRemoteDTO newMatch = MatchRemoteDTO.fromNewMatchValue(
        matchId: matchId, organizerId: currentPlayer.id, matchValue: matchData);

    combinedMatches.add(newMatch);

    return matchId;

// final String matchId =
  }

  @override
  Future<void> joinMatch({
    required String matchId,
    required MatchParticipationValue matchParticipation,
  }) async {
    final allMatches = combinedMatches;
    // TODO finfd the match
    final MatchRemoteDTO? match = combinedMatches.firstWhereOrNull(
      (match) => match.id == matchId,
    );

    // if match no exist
    if (match == null)
      throw MatchExceptionNotFoundRemote(message: "Match: $matchId");

    // find the participant already
    final MatchParticipantRemoteDTO? existingParticipant = match.participants
        .firstWhereOrNull(
            (element) => element.playerId == matchParticipation.playerId);

    // TODO test this
    // first we check if there is no participant - then we join and return

    if (existingParticipant == null) {
      final MatchParticipantRemoteDTO participant =
          MatchParticipantRemoteDTO.fromMatchParticipantInvitationValue(
        invitationValue: matchParticipation,
        matchId: matchId,
        // TODO this should be an enum
        status: MatchParticipantStatus.joined.name,
      );

      final List<MatchParticipantRemoteDTO> matchParticipants = [
        ...match.participants,
      ];
      // TODO this should be a function to be reused
      matchParticipants.add(participant);
      final MatchRemoteDTO updatedMatch =
          match.copyWith(participants: matchParticipants);

      //

      final int matchIndex = combinedMatches.indexWhere(
        (match) => match.id == updatedMatch.id,
      );

      combinedMatches[matchIndex] = updatedMatch;

      final newCombined = combinedMatches;

      return;
    }

// TODO no need for tghis really -or is there?
    final bool hasExistingParticipantConfirmed =
        existingParticipant.status == MatchParticipantStatus.joined.name;

    if (hasExistingParticipantConfirmed) {
      throw MatchExceptionPlayerAlreadyJoined(
          message: "Match: $matchId, player: ${matchParticipation.playerId}");
    }

    // now we know participant exists, but has not confirmed
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

    // match.participants[participantIndex] = updatedParticipant;

    // match.participants.removeAt(participantIndex);

    final int matchIndex = combinedMatches.indexWhere(
      (match) => match.id == updatedMatch.id,
    );

    combinedMatches[matchIndex] = updatedMatch;

    final newCombined = combinedMatches;

    //

    // TODO test
  }

  // TODO test

  Future<void> unjoinMatch({
    required String matchId,
    required MatchParticipationValue matchParticipation,
  }) async {
    final allMatches = combinedMatches;
    // TODO finfd the match
    final MatchRemoteDTO? match = combinedMatches.firstWhereOrNull(
      (match) => match.id == matchId,
    );

    // if match no exist
    if (match == null)
      throw MatchExceptionNotFoundRemote(message: "Match: $matchId");

    // find the participant already
    final MatchParticipantRemoteDTO? existingParticipant = match.participants
        .firstWhereOrNull(
            (element) => element.playerId == matchParticipation.playerId);

    if (existingParticipant == null) {
      throw MatchExceptionPlayerAlreadyUnjoined(
          message: "Match: $matchId, player: ${matchParticipation.playerId}");
    }

// now we know participation is not null

    // now create new participants wihtout this participant
    final List<MatchParticipantRemoteDTO> matchParticipants = [
      ...match.participants,
    ];

    matchParticipants
        .removeWhere((p) => p.playerId == matchParticipation.playerId);
    // create new match with updated participants
    final MatchRemoteDTO updatedMatch =
        match.copyWith(participants: matchParticipants);

    final int matchIndex = combinedMatches.indexWhere(
      (match) => match.id == updatedMatch.id,
    );

    // insert new match into matches to replace existing one
    combinedMatches[matchIndex] = updatedMatch;

    final newCombined = combinedMatches;

    //
  }

  @override
  Future<List<MatchRemoteDTO>> getSearchedMatches(
      MatchesSearchFilters filters) async {
    await Future<void>.delayed(Duration(milliseconds: 500));

    return combinedMatches;
  }
}

final List<MatchRemoteDTO> combinedMatches = [
  MatchRemoteDTO(
    id: "1",
    name: "Match 1",
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
