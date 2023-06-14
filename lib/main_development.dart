import 'package:five_on_four_flutter_tdd/app/app.dart';
import 'package:five_on_four_flutter_tdd/bootstrap.dart';

void main() async {
  // await dotenv.load(fileName: ".env");

  bootstrap(() => const App());
}
