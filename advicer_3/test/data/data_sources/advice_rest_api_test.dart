import 'package:advicer_3/data/data_sources/advice_rest_api.dart';
import 'package:advicer_3/data/dtos/advice_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

class MockHttpClient extends Mock implements http.Client {}

void main() {
  group('AdviceRestApi', () {
    group('returns AdviceDto', () {
      late MockHttpClient mockHttpClient;

      setUp(() {
        mockHttpClient = MockHttpClient();
      });

      test('if read was called', () async {
        // setup
        final responseBody = '{"advice": "test advice", "advice_id": 1}';
        when(
              () =>
              mockHttpClient.get(Uri.parse('https://api.flutter-community.com/api/v1/advice'),
                  headers: { 'accept': 'application/json',}),
        ).thenAnswer((invocation) => Future.value(http.Response(responseBody, 200)));

        //create
        final dataSourceUnderTest = AdviceRestApi(client: mockHttpClient);

        // act
        final result = await dataSourceUnderTest.read();

        // expect/ verify
        expect(result, AdviceDto(id: 1, advice: 'test advice'));
      });
    });
  });
}
