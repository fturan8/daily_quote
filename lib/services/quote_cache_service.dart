import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/quote_model.dart';

class QuoteCacheService {
  static const String _quoteKey = 'cached_quote';
  static const String _timestampKey = 'cached_quote_timestamp';

  /// Söz'ü cache'e kaydeder
  Future<void> cacheQuote(Quote quote) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_quoteKey, json.encode(quote.toJson()));
    await prefs.setInt(_timestampKey, DateTime.now().millisecondsSinceEpoch);
  }

  /// Cache'deki söz'ü getirir. Eğer cache boş ise null döner.
  Future<Quote?> getCachedQuote() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? quoteJson = prefs.getString(_quoteKey);
      
      if (quoteJson != null) {
        final Map<String, dynamic> quoteMap = json.decode(quoteJson);
        return Quote.fromJson(quoteMap);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  /// Cache'deki sözün zaman damgasını kontrol eder
  /// 24 saatten eski ise true döner
  Future<bool> isCacheOlderThan24Hours() async {
    final prefs = await SharedPreferences.getInstance();
    final int? timestamp = prefs.getInt(_timestampKey);
    
    if (timestamp == null) {
      return true;
    }
    
    final DateTime cachedTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    final Duration difference = DateTime.now().difference(cachedTime);
    
    return difference.inHours >= 24;
  }
} 