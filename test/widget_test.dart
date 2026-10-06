import 'package:flutter_test/flutter_test.dart';
import 'package:tarjeta_videojuego/main.dart';

void main() {
  testWidgets('Carga inicial', (WidgetTester tester) async {
    await tester.pumpWidget(const MiAppVideojuego());
  });
}