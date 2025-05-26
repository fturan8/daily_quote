import 'package:flutter/material.dart';
import '../models/quote_model.dart';
import '../services/quote_api_service.dart';
import '../services/quote_cache_service.dart';

class QuoteProvider extends ChangeNotifier {
  final QuoteApiService _apiService = QuoteApiService();
  final QuoteCacheService _cacheService = QuoteCacheService();
  
  Quote? _quote;
  bool _isLoading = false;
  String? _errorMessage;
  bool _isFromCache = false;

  Quote? get quote => _quote;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isFromCache => _isFromCache;

  QuoteProvider() {
    _initialize();
  }

  /// Provider'ı başlatır, cache kontrolü yapar
  Future<void> _initialize() async {
    await loadQuote();
  }

  /// Söz yükleme işlemi
  Future<void> loadQuote() async {
    _setLoading(true);
    _clearError();
    _isFromCache = false;

    try {
      // Cache'de söz var mı kontrol et
      final cachedQuote = await _cacheService.getCachedQuote();
      
      // Internet'ten yeni söz getirmeyi dene
      try {
        final newQuote = await _apiService.getRandomQuote();
        _quote = newQuote;
        await _cacheService.cacheQuote(newQuote);
      } catch (e) {
        // İnternet bağlantısı yoksa veya API hata verirse cache'den göster
        if (cachedQuote != null) {
          _quote = cachedQuote;
          _isFromCache = true;
          _setError('İnternet bağlantısı yok. Son kaydedilen söz gösteriliyor.');
        } else {
          _setError('İnternet bağlantısı yok ve kaydedilmiş söz bulunamadı.');
        }
      }
    } catch (e) {
      _setError('Bir hata oluştu: $e');
    } finally {
      _setLoading(false);
    }
  }

  /// Yeni söz getir butonu için
  Future<void> getNewQuote() async {
    await loadQuote();
  }

  /// Loading durumunu günceller
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  /// Hata mesajını günceller
  void _setError(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  /// Hata mesajını temizler
  void _clearError() {
    _errorMessage = null;
    notifyListeners();
  }
} 