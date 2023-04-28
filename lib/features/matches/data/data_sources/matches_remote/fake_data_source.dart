import 'package:collection/collection.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/data_sources/matches_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/dtos/match_participant_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/dtos/match_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/exceptions/match_exceptions.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/match_participantion/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/new_match/value.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';

class MatchesRemoteFakeDataSource implements MatchesRemoteDataSource {
  @override
  Future<List<MatchRemoteDTO>> getInvitedMatchesForPlayer(
      String playerId) async {
    await Future.delayed(Duration(milliseconds: 200));
    final List<MatchRemoteDTO> invitedMatches = combinedMatches.where(
      (match) {
        // TODO test
        final MatchParticipantRemoteDTO? currentPlayer =
            match.participants.firstWhereOrNull((participant) {
          return participant.playerId == playerId &&
              participant.status == "invited";
        });

        // TODO TEST
        if (currentPlayer == null) return false;

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
                participant.status == "confirmed");

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

    return combinedMatches[0];
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

    // if participant already joined
    if (existingParticipant != null) {
      throw MatchExceptionPlayerAlreadyJoined(
          message: "Match: $matchId, player: ${matchParticipation.playerId}");
    }

    // join
    final MatchParticipantRemoteDTO participant =
        MatchParticipantRemoteDTO.fromMatchParticipantInvitationValue(
      invitationValue: matchParticipation,
      matchId: matchId,
      // TODO this should be an enum
      status: "confirmed",
    );
    match.participants.add(participant);

// TODO how to replace
    final int matchIndex = combinedMatches.indexWhere(
      (match) => match.id == matchId,
    );

    combinedMatches[matchIndex] = match;
  }

  // TODO test
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
        status: "invited",
        createdAt: 1617355557658,
        expiresAt: 1617355557658 + 60 * 60 * 1000, // 1 hour later
      ),
      MatchParticipantRemoteDTO(
        id: "2",
        playerId: "2",
        matchId: "1",
        nickname: "Player 2",
        status: "invited",
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
        status: "invited",
        createdAt: 1617355557658,
        expiresAt: 1617355557658 + 60 * 60 * 1000, // 1 hour later
      ),
      MatchParticipantRemoteDTO(
        id: "4",
        playerId: "3",
        matchId: "2",
        nickname: "Player 3",
        status: "invited",
        createdAt: 1617355557658,
        expiresAt: 1617355557658 + 60 * 60 * 1000, // 1 hour later
      ),
    ],
  ),
  MatchRemoteDTO(
    id: "3",
    name: "Match 1",
    participants: [
      MatchParticipantRemoteDTO(
        id: "5",
        playerId: "1",
        matchId: "3",
        nickname: "Player 1",
        status: "confirmed",
        createdAt: 1617355557658,
        expiresAt: null,
      ),
      MatchParticipantRemoteDTO(
        id: "6",
        playerId: "2",
        matchId: "3",
        nickname: "Player 2",
        status: "confirmed",
        createdAt: 1617355557658,
        expiresAt: null,
      ),
    ],
  ),
  MatchRemoteDTO(
    id: "4",
    name: "Match 2",
    participants: [
      MatchParticipantRemoteDTO(
        id: "7",
        playerId: "1",
        matchId: "4",
        nickname: "Player 1",
        status: "confirmed",
        createdAt: 1617355557658,
        expiresAt: null,
      ),
      MatchParticipantRemoteDTO(
        id: "8",
        playerId: "3",
        matchId: "4",
        nickname: "Player 3",
        status: "confirmed",
        createdAt: 1617355557658,
        expiresAt: null,
      ),
    ],
  ),
];

// final List<MatchRemoteDTO> invitedMatches = [
//   MatchRemoteDTO(
//     id: "1",
//     name: "Match 1",
//     participants: [
//       MatchParticipantRemoteDTO(
//         id: "1",
//         playerId: "1",
//         matchId: "1",
//         nickname: "Player 1",
//         status: "invited",
//         createdAt: 1617355557658,
//         expiresAt: 1617355557658 + 60 * 60 * 1000, // 1 hour later
//       ),
//       MatchParticipantRemoteDTO(
//         id: "2",
//         playerId: "2",
//         matchId: "1",
//         nickname: "Player 2",
//         status: "invited",
//         createdAt: 1617355557658,
//         expiresAt: 1617355557658 + 60 * 60 * 1000, // 1 hour later
//       ),
//     ],
//   ),
//   MatchRemoteDTO(
//     id: "2",
//     name: "Match 2",
//     participants: [
//       MatchParticipantRemoteDTO(
//         id: "3",
//         playerId: "1",
//         matchId: "2",
//         nickname: "Player 1",
//         status: "invited",
//         createdAt: 1617355557658,
//         expiresAt: 1617355557658 + 60 * 60 * 1000, // 1 hour later
//       ),
//       MatchParticipantRemoteDTO(
//         id: "4",
//         playerId: "3",
//         matchId: "2",
//         nickname: "Player 3",
//         status: "invited",
//         createdAt: 1617355557658,
//         expiresAt: 1617355557658 + 60 * 60 * 1000, // 1 hour later
//       ),
//     ],
//   ),
// ];

// final List<MatchRemoteDTO> joinedMatches = [
//   MatchRemoteDTO(
//     id: "1",
//     name: "Match 1",
//     participants: [
//       MatchParticipantRemoteDTO(
//         id: "1",
//         playerId: "1",
//         matchId: "1",
//         nickname: "Player 1",
//         status: "confirmed",
//         createdAt: 1617355557658,
//         expiresAt:
//             null, // null indicates that user joined, so this field is not affecting anything anymore
//       ),
//       MatchParticipantRemoteDTO(
//         id: "2",
//         playerId: "2",
//         matchId: "1",
//         nickname: "Player 2",
//         status: "confirmed",
//         createdAt: 1617355557658,
//         expiresAt: null, // 1 hour later
//       ),
//     ],
//   ),
//   MatchRemoteDTO(
//     id: "2",
//     name: "Match 2",
//     participants: [
//       MatchParticipantRemoteDTO(
//           id: "3",
//           playerId: "1",
//           matchId: "2",
//           nickname: "Player 1",
//           status: "confirmed",
//           createdAt: 1617355557658,
//           expiresAt: null // 1 hour later
//           ),
//       MatchParticipantRemoteDTO(
//         id: "4",
//         playerId: "3",
//         matchId: "2",
//         nickname: "Player 3",
//         status: "confirmed",
//         createdAt: 1617355557658,
//         expiresAt: null, // 1 hour later
//       ),
//     ],
//   ),
//   MatchRemoteDTO(
//     id: "2",
//     name: "Match 2",
//     participants: [
//       MatchParticipantRemoteDTO(
//           id: "3",
//           playerId: "1",
//           matchId: "2",
//           nickname: "Player 1",
//           status: "confirmed",
//           createdAt: 1617355557658,
//           expiresAt: null // 1 hour later
//           ),
//       MatchParticipantRemoteDTO(
//         id: "4",
//         playerId: "3",
//         matchId: "2",
//         nickname: "Player 3",
//         status: "confirmed",
//         createdAt: 1617355557658,
//         expiresAt: null, // 1 hour later
//       ),
//     ],
//   ),
//   MatchRemoteDTO(
//     id: "2",
//     name: "Match 2",
//     participants: [
//       MatchParticipantRemoteDTO(
//           id: "3",
//           playerId: "1",
//           matchId: "2",
//           nickname: "Player 1",
//           status: "confirmed",
//           createdAt: 1617355557658,
//           expiresAt: null // 1 hour later
//           ),
//       MatchParticipantRemoteDTO(
//         id: "4",
//         playerId: "3",
//         matchId: "2",
//         nickname: "Player 3",
//         status: "confirmed",
//         createdAt: 1617355557658,
//         expiresAt: null, // 1 hour later
//       ),
//     ],
//   ),
//   MatchRemoteDTO(
//     id: "2",
//     name: "Match 2",
//     participants: [
//       MatchParticipantRemoteDTO(
//           id: "3",
//           playerId: "1",
//           matchId: "2",
//           nickname: "Player 1",
//           status: "confirmed",
//           createdAt: 1617355557658,
//           expiresAt: null // 1 hour later
//           ),
//       MatchParticipantRemoteDTO(
//         id: "4",
//         playerId: "3",
//         matchId: "2",
//         nickname: "Player 3",
//         status: "confirmed",
//         createdAt: 1617355557658,
//         expiresAt: null, // 1 hour later
//       ),
//     ],
//   ),
//   MatchRemoteDTO(
//     id: "2",
//     name: "Match 2",
//     participants: [
//       MatchParticipantRemoteDTO(
//           id: "3",
//           playerId: "1",
//           matchId: "2",
//           nickname: "Player 1",
//           status: "confirmed",
//           createdAt: 1617355557658,
//           expiresAt: null // 1 hour later
//           ),
//       MatchParticipantRemoteDTO(
//         id: "4",
//         playerId: "3",
//         matchId: "2",
//         nickname: "Player 3",
//         status: "confirmed",
//         createdAt: 1617355557658,
//         expiresAt: null, // 1 hour later
//       ),
//     ],
//   ),
//   MatchRemoteDTO(
//     id: "2",
//     name: "Match 2",
//     participants: [
//       MatchParticipantRemoteDTO(
//           id: "3",
//           playerId: "1",
//           matchId: "2",
//           nickname: "Player 1",
//           status: "confirmed",
//           createdAt: 1617355557658,
//           expiresAt: null // 1 hour later
//           ),
//       MatchParticipantRemoteDTO(
//         id: "4",
//         playerId: "3",
//         matchId: "2",
//         nickname: "Player 3",
//         status: "confirmed",
//         createdAt: 1617355557658,
//         expiresAt: null, // 1 hour later
//       ),
//     ],
//   ),
//   MatchRemoteDTO(
//     id: "2",
//     name: "Match 2",
//     participants: [
//       MatchParticipantRemoteDTO(
//           id: "3",
//           playerId: "1",
//           matchId: "2",
//           nickname: "Player 1",
//           status: "confirmed",
//           createdAt: 1617355557658,
//           expiresAt: null // 1 hour later
//           ),
//       MatchParticipantRemoteDTO(
//         id: "4",
//         playerId: "3",
//         matchId: "2",
//         nickname: "Player 3",
//         status: "confirmed",
//         createdAt: 1617355557658,
//         expiresAt: null, // 1 hour later
//       ),
//     ],
//   ),
//   MatchRemoteDTO(
//     id: "2",
//     name: "Match 2",
//     participants: [
//       MatchParticipantRemoteDTO(
//           id: "3",
//           playerId: "1",
//           matchId: "2",
//           nickname: "Player 1",
//           status: "confirmed",
//           createdAt: 1617355557658,
//           expiresAt: null // 1 hour later
//           ),
//       MatchParticipantRemoteDTO(
//         id: "4",
//         playerId: "3",
//         matchId: "2",
//         nickname: "Player 3",
//         status: "confirmed",
//         createdAt: 1617355557658,
//         expiresAt: null, // 1 hour later
//       ),
//     ],
//   ),
// ];

// final MatchRemoteDTO _singleMatch = MatchRemoteDTO(
//   id: "2",
//   name: "Match 2",
//   participants: [
//     MatchParticipantRemoteDTO(
//         id: "3",
//         playerId: "1",
//         matchId: "2",
//         nickname: "Player 1",
//         status: "confirmed",
//         createdAt: 1617355557658,
//         expiresAt: null // 1 hour later
//         ),
//     MatchParticipantRemoteDTO(
//       id: "4",
//       playerId: "3",
//       matchId: "2",
//       nickname: "Player 3",
//       status: "confirmed",
//       createdAt: 1617355557658,
//       expiresAt: null, // 1 hour later
//     ),
//   ],
// );
