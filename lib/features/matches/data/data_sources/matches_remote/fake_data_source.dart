import 'package:five_on_four_flutter_tdd/features/matches/data/data_sources/matches_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/dtos/match_participant_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/dtos/match_remote/dto.dart';

class MatchesRemoteFakeDataSource implements MatchesRemoteDataSource {
  @override
  Future<List<MatchRemoteDTO>> getPlayerInvitedMatches(String playerId) async {
    await Future.delayed(Duration(milliseconds: 200));
    return invitedMatches;
  }

  @override
  Future<List<MatchRemoteDTO>> getPlayerJoinedMatches(String playerId) async {
    await Future.delayed(Duration(milliseconds: 200));
    return joinedMatches;
  }

  @override
  Future<MatchRemoteDTO> getPlayerNextMatch(String playerId) async {
    await Future.delayed(Duration(milliseconds: 200));
    return joinedMatches[0];
  }
}

final List<MatchRemoteDTO> invitedMatches = [
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
];

final List<MatchRemoteDTO> joinedMatches = [
  MatchRemoteDTO(
    id: "1",
    name: "Match 1",
    participants: [
      MatchParticipantRemoteDTO(
        id: "1",
        playerId: "1",
        matchId: "1",
        nickname: "Player 1",
        status: "confirmed",
        createdAt: 1617355557658,
        expiresAt:
            null, // null indicates that user joined, so this field is not affecting anything anymore
      ),
      MatchParticipantRemoteDTO(
        id: "2",
        playerId: "2",
        matchId: "1",
        nickname: "Player 2",
        status: "confirmed",
        createdAt: 1617355557658,
        expiresAt: null, // 1 hour later
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
          status: "confirmed",
          createdAt: 1617355557658,
          expiresAt: null // 1 hour later
          ),
      MatchParticipantRemoteDTO(
        id: "4",
        playerId: "3",
        matchId: "2",
        nickname: "Player 3",
        status: "confirmed",
        createdAt: 1617355557658,
        expiresAt: null, // 1 hour later
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
          status: "confirmed",
          createdAt: 1617355557658,
          expiresAt: null // 1 hour later
          ),
      MatchParticipantRemoteDTO(
        id: "4",
        playerId: "3",
        matchId: "2",
        nickname: "Player 3",
        status: "confirmed",
        createdAt: 1617355557658,
        expiresAt: null, // 1 hour later
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
          status: "confirmed",
          createdAt: 1617355557658,
          expiresAt: null // 1 hour later
          ),
      MatchParticipantRemoteDTO(
        id: "4",
        playerId: "3",
        matchId: "2",
        nickname: "Player 3",
        status: "confirmed",
        createdAt: 1617355557658,
        expiresAt: null, // 1 hour later
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
          status: "confirmed",
          createdAt: 1617355557658,
          expiresAt: null // 1 hour later
          ),
      MatchParticipantRemoteDTO(
        id: "4",
        playerId: "3",
        matchId: "2",
        nickname: "Player 3",
        status: "confirmed",
        createdAt: 1617355557658,
        expiresAt: null, // 1 hour later
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
          status: "confirmed",
          createdAt: 1617355557658,
          expiresAt: null // 1 hour later
          ),
      MatchParticipantRemoteDTO(
        id: "4",
        playerId: "3",
        matchId: "2",
        nickname: "Player 3",
        status: "confirmed",
        createdAt: 1617355557658,
        expiresAt: null, // 1 hour later
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
          status: "confirmed",
          createdAt: 1617355557658,
          expiresAt: null // 1 hour later
          ),
      MatchParticipantRemoteDTO(
        id: "4",
        playerId: "3",
        matchId: "2",
        nickname: "Player 3",
        status: "confirmed",
        createdAt: 1617355557658,
        expiresAt: null, // 1 hour later
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
          status: "confirmed",
          createdAt: 1617355557658,
          expiresAt: null // 1 hour later
          ),
      MatchParticipantRemoteDTO(
        id: "4",
        playerId: "3",
        matchId: "2",
        nickname: "Player 3",
        status: "confirmed",
        createdAt: 1617355557658,
        expiresAt: null, // 1 hour later
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
          status: "confirmed",
          createdAt: 1617355557658,
          expiresAt: null // 1 hour later
          ),
      MatchParticipantRemoteDTO(
        id: "4",
        playerId: "3",
        matchId: "2",
        nickname: "Player 3",
        status: "confirmed",
        createdAt: 1617355557658,
        expiresAt: null, // 1 hour later
      ),
    ],
  ),
];
