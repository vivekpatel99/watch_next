import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String apiEndpoint = dotenv.env['API_ENDPOINT']!;
  static String apiImageEndpoint = dotenv.env['API_ENDPOINT_IMAGE_PATH']!;

  static String apiKey = dotenv.env['API_KEY']!;

  static String searchTVSeriesUrl = '${apiEndpoint}search/tv?query=';

  static String trandingTodayUrl = '${apiEndpoint}trending/tv/day?$apiKey';

  static String fetchTVSeriesInfoUrl = '${apiEndpoint}tv/';
}
