import 'package:flutter_test/flutter_test.dart';
import 'package:nike_shoes_list_product_app/main.dart';

void main() {
  testWidgets('Home page smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Get Started'), findsOneWidget);
    expect(find.text('Just Do It.'), findsOneWidget);
  });
}
