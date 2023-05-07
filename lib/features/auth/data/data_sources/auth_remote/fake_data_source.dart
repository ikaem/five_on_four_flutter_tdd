import 'package:collection/collection.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/dtos/auth_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/args/login_credentials/args.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/exceptions/auth_exceptions.dart';

class AuthRemoteFakeDataSource implements AuthRemoteDataSource {
  @override
  Future<AuthRemoteDTO> login(LoginCredentialsArgs credentials) async {
    await Future<void>.delayed(Duration(milliseconds: 200));

    final AuthRemoteDTO? auth = _authRemoteDTOList.firstWhereOrNull(
      (element) => element.nickname == credentials.email,
    );

    if (auth == null)
      throw AuthExceptionUnauthorized(
          message: "Loggin failed with followingemail: ${credentials.email}");

    return auth;
  }
}

List<AuthRemoteDTO> _authRemoteDTOList = [
  AuthRemoteDTO(
    id: '1',
    nickname: 'JohnDoe',
    email: 'johndoe@gmail.com',
    loggedInAt: 1651540800,
  ),
  AuthRemoteDTO(
    id: '2',
    nickname: 'JaneSmith',
    email: 'janesmith@yahoo.com',
    loggedInAt: 1651609200,
  ),
  AuthRemoteDTO(
    id: '3',
    nickname: 'BobJohnson',
    email: 'bjohnson@hotmail.com',
    loggedInAt: 1651514400,
  ),
  AuthRemoteDTO(
    id: '4',
    nickname: 'AliceWilliams',
    email: 'awilliams@gmail.com',
    loggedInAt: 1651485600,
  ),
  AuthRemoteDTO(
    id: '5',
    nickname: 'MarkDavis',
    email: 'mdavis@yahoo.com',
    loggedInAt: 1651574400,
  ),
];
