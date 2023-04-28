import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/dtos/auth_remote/dto.dart';

class AuthRemoteFakeDataSource implements AuthRemoteDataSource {
  @override
  Future<AuthRemoteDTO> getAuth() async {
    await Future<void>.delayed(Duration(milliseconds: 200));

    final AuthRemoteDTO dto = AuthRemoteDTO(
      id: '1',
      nickname: 'JohnDoe',
      email: 'johndoe@example.com',
      loggedInAt: DateTime.now().millisecondsSinceEpoch,
    );

    return dto;
  }
}
