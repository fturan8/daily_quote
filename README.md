# Günün Sözü - Daily Quote App

Flutter ile geliştirilmiş, her gün rastgele bir güzel söz gösteren mobil uygulama.

## Özellikler

- Her gün farklı bir söz görüntüleme
- İstenildiğinde yeni söz getirme
- İnternet bağlantısı olmadığında bile çalışma (offline mod)
- Modern ve estetik kullanıcı arayüzü
- iOS ve Android platformlarında çalışma

## Teknolojiler

- **Flutter & Dart**: Cross-platform uygulama geliştirme
- **Provider**: State yönetimi
- **HTTP**: API istekleri
- **SharedPreferences**: Lokal veri depolama (cache)

## API Kaynakları

Uygulama, aşağıdaki API'lerden rastgele sözler çeker:

- Birincil API: [ZenQuotes.io](https://zenquotes.io/)
- Yedek API: [Type.fit](https://type.fit/api/quotes)

## Kurulum

1. Flutter SDK'yı kurun (https://flutter.dev/docs/get-started/install)
2. Projeyi klonlayın
3. Bağımlılıkları yükleyin:
   ```
   flutter pub get
   ```
4. Uygulamayı çalıştırın:
   ```
   flutter run
   ```

## Proje Yapısı

```
lib/
├── models/         # Veri modelleri
├── providers/      # State yönetimi
├── screens/        # Uygulama ekranları
├── services/       # API ve cache servisleri
├── widgets/        # UI bileşenleri
└── main.dart       # Uygulama giriş noktası
```

## Yol Haritası - Gelecek Özellikler

- Söz paylaşma özelliği
- Favori sözleri kaydetme
- Günlük bildirimler
- Temalar ve kişiselleştirme seçenekleri
