import 'package:five_on_four_flutter_tdd/features/auth/data/dtos/auth_local/dto.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/models/auth/model.dart';

final AuthLocalDTO testAuthLocalDTO = AuthLocalDTO(
  id: '1',
  nickname: 'JohnDoe',
  email: 'johndoe@example.com',
  loggedInAt: DateTime.now().millisecondsSinceEpoch,
);

final AuthModel testAuthModel = AuthModel.fromLocalDTO(testAuthLocalDTO);
