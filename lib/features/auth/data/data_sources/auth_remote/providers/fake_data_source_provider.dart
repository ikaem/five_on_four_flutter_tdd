// lib/features/auth/data/data_sources/auth/providers/fake_data_source_provider.dart
import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_remote/fake_data_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRemoteFakeDataSourceProvider = Provider<AuthRemoteDataSource>(
  (ref) {
    return AuthRemoteFakeDataSource();
  },
);
