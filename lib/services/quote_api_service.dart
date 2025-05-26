import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/quote_model.dart';

class QuoteApiService {
  static const String zenQuotesApi = 'https://zenquotes.io/api/random';
  static const String typeFitApi = 'https://type.fit/api/quotes';

  /// ZenQuotes API'den rastgele bir söz getirir
  Future<Quote> getRandomQuoteFromZenQuotes() async {
    try {
      final response = await http.get(Uri.parse(zenQuotesApi));
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        if (data.isNotEmpty) {
          return Quote(
            text: data[0]['q'] ?? '',
            author: data[0]['a'] ?? 'Bilinmeyen',
          );
        }
      }
      throw Exception('API verisi alınamadı: ${response.statusCode}');
    } on SocketException {
      throw Exception('İnternet bağlantısı yok');
    } catch (e) {
      throw Exception('Hata oluştu: $e');
    }
  }

  /// TypeFit API'den rastgele bir söz getirir
  Future<Quote> getRandomQuoteFromTypeFit() async {
    try {
      final response = await http.get(Uri.parse(typeFitApi));
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        if (data.isNotEmpty) {
          // Rastgele bir söz seçmek için
          final random = data[DateTime.now().millisecondsSinceEpoch % data.length];
          return Quote(
            text: random['text'] ?? '',
            author: random['author'] ?? 'Bilinmeyen',
          );
        }
      }
      throw Exception('API verisi alınamadı: ${response.statusCode}');
    } on SocketException {
      throw Exception('İnternet bağlantısı yok');
    } catch (e) {
      throw Exception('Hata oluştu: $e');
    }
  }

  /// Ana API (ZenQuotes) çalışmazsa yedek API'yi dener
  Future<Quote> getRandomQuote() async {
    try {
      return await getRandomQuoteFromZenQuotes();
    } catch (e) {
      // Ana API çalışmazsa yedek API'den veri çekmeyi deneyelim
      return await getRandomQuoteFromTypeFit();
    }
  }
} 