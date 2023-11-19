import 'dart:convert';
import 'dart:io';
import 'dart:math';

class QuoteGenerator {
  Future<String> getQuote() async {
    String url = "https://zenquotes.io/api/quotes";

    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');

    HttpClientResponse response = await request.close();

    if (response.statusCode == 200) {
      String reply = await response.transform(utf8.decoder).join();
      List<dynamic> quotes = jsonDecode(reply);

      if (quotes.isNotEmpty) {
        Random random = Random();
        int randomNumber = random.nextInt(quotes.length);

        String selectedQuote = quotes[randomNumber]['q'];
        String author = quotes[randomNumber]['a'];

        String formattedQuote = '"$selectedQuote" - $author';
        print(formattedQuote);
        return formattedQuote;
      }
    }

    httpClient.close();
    throw Exception('Failed to load quote');
  }
}
