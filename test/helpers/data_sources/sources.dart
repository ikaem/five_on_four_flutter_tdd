// import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_local/data_source.dart';
// import 'package:five_on_four_flutter_tdd/features/matches/data/data_sources/matches_remote/data_source.dart';
// import 'package:mockito/annotations.dart';

// // TODO this is file path
// // test/helpers/data_sources/sources.dart

// @GenerateMocks([
//   AuthLocalDataSource,
//   MatchesRemoteDataSource,
// ])
// void main() {
//   // mockAuthLocalDataSource = MockAuthLocalDataSource();
// }

// // MockAuthLocalDataSource? mockAuthLocalDataSource;


// // this kind works
// // class AuthLocalDataSourceMock extends Mock implements AuthLocalDataSource {}

// // class MockAuthLocalDataSource implements AuthLocalDataSource {
// //   MockAuthLocalDataSource() : mock = AuthLocalDataSourceMock();

// //   final AuthLocalDataSourceMock mock;

// //   @override
// //   Future<AuthLocalDTO> getAuth() async {
// //     print("testing this!!!!!!!!!!!!!!!!!!!!!!");

// //     final AuthLocalDTO dto = AuthLocalDTO(
// //       id: '1',
// //       nickname: 'JohnDoe',
// //       email: 'johndoe@example.com',
// //       loggedInAt: DateTime.now().millisecondsSinceEpoch,
// //     );

// // // this actually prevents it from working 
// //     // when(mock.getAuth()).thenAnswer((realInvocation) => Future.value(dto));

// //     return dto;
// //   }
// // }

// // this is better replaced by separate implementation of mock and data class
// // class MockAuthLocalDataSource extends Mock implements AuthLocalDataSource {
// //   @override
// //   Future<AuthLocalDTO> getAuth() async {
// //     final AuthLocalDTO dto = AuthLocalDTO(
// //       id: '1',
// //       nickname: 'JohnDoe',
// //       email: 'johndoe@example.com',
// //       loggedInAt: DateTime.now().millisecondsSinceEpoch,
// //     );

// //     when(getAuth()).thenAnswer((realInvocation) => Future.value(dto));

// //     return dto;
// //   }
// // }
