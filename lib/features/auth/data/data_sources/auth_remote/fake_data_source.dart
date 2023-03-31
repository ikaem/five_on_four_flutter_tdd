import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/dtos/auth_remote/dto.dart';

class AuthRemoteFakeDataSource implements AuthRemoteDataSource {
  // TODO this might not be needed
  @override
  Future<AuthRemoteDTO> getAuth() async {
    // Simulate a network delay of 2 seconds
    await Future<void>.delayed(Duration(milliseconds: 200));

    // Return a fake AuthRemoteDTO
    final AuthRemoteDTO dto = AuthRemoteDTO(
      id: '1',
      nickname: 'JohnDoe',
      email: 'johndoe@example.com',
      loggedInAt: DateTime.now().millisecondsSinceEpoch,
    );

    return dto;
  }
}
