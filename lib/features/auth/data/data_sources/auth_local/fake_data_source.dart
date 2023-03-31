import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_local/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/dtos/auth_local/dto.dart';

class AuthLocalFakeDataSource implements AuthLocalDataSource {
  // TODO this might not be needed
  @override
  Future<AuthLocalDTO?> getAuth() async {
    // Simulate a network delay of 2 seconds
    await Future<void>.delayed(Duration(milliseconds: 200));
    // return null;

    // Return a fake AuthRemoteDTO
    final AuthLocalDTO dto = AuthLocalDTO(
      id: '1',
      nickname: 'JohnDoe',
      email: 'johndoe@example.com',
      loggedInAt: DateTime.now().millisecondsSinceEpoch,
    );

    return dto;
  }
}
