// lib/features/auth/data/data_sources/auth/providers/fake_data_source_provider.dart
import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_local/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_local/fake_data_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<AuthLocalDataSource> authLocalFakeDataSourceProvider =
    Provider<AuthLocalDataSource>(
  (ref) {
    return AuthLocalFakeDataSource();
  },
);


// TODO this might be an overkill here - datasoiurces are only used by repositories, so creating an isnitace in there would do the trick
// but, this helps with testing and mocking, where we could just override provider for this in providersscope