// lib/features/auth/data/data_sources/auth/data_source.dart
import 'package:five_on_four_flutter_tdd/features/auth/data/dtos/auth_remote/dto.dart';

abstract class AuthRemoteDataSource {
  Future<AuthRemoteDTO> getAuth();
}
