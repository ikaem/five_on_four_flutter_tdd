import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_local/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/dtos/auth_local/dto.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/dtos/auth_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/args/login_credentials/args.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/args/register_credentials/args.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/models/auth/model.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/repository_interfaces/auth_repository.dart';

class AuthAppRepository implements AuthRepository {
  const AuthAppRepository({
    required this.remoteDataSource,
    required this.localDataSource,
  });
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  @override
  Future<AuthModel?> checkAuth() async {
    final AuthLocalDTO? localDTO = await localDataSource.getAuth();
    if (localDTO == null) return null;

    await remoteDataSource.registerUserDevice(localDTO.id);

    final AuthModel authModel = AuthModel.fromLocalDTO(localDTO);

    return authModel;
  }

  @override
  Future<AuthModel> login(
    LoginCredentialsArgs args,
  ) async {
    final AuthRemoteDTO authRemoteDTO = await remoteDataSource.login(args);

    final AuthLocalDTO authLocalDTO = AuthLocalDTO.fromRemoteDTO(authRemoteDTO);
    await localDataSource.saveAuth(authLocalDTO);

    final AuthModel authModel = AuthModel.fromLocalDTO(authLocalDTO);

    return authModel;
  }

  @override
  Future<void> logout() async {
// TODO in future, this will need to be handled better - the error potentially from either source
    await remoteDataSource.logout().catchError((e) async {
      // grab logger here
      return null;
    });
    await localDataSource.deleteAuth().catchError((e) async {
      return null;
    });
  }

  @override
  Future<AuthModel> register(
    RegisterCredentialsArgs args,
  ) async {
    final AuthRemoteDTO authRemoteDTO = await remoteDataSource.register(args);

    final AuthLocalDTO authLocalDTO = AuthLocalDTO.fromRemoteDTO(authRemoteDTO);
    await localDataSource.saveAuth(authLocalDTO);

    final AuthModel authModel = AuthModel.fromLocalDTO(authLocalDTO);

    return authModel;
  }
}
