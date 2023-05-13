import 'package:five_on_four_flutter_tdd/features/matches/data/data_sources/matches_remote/app_data_source.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/data_sources/matches_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/cloud_firestore/firebase_firestore_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/cloud_firestore/providers/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
MatchesRemoteDataSource matchesRemoteAppDataSource(
  MatchesRemoteAppDataSourceRef ref,
) {
  final FirebaseFirestoreWrapper firebaseFirestoreWrapper =
      ref.read(firebaseFirestoreWrapperProvider);
  final MatchesRemoteDataSource dataSource = MatchesRemoteAppDataSource(
      firebaseFirestoreWrapper: firebaseFirestoreWrapper);

  return dataSource;
}
