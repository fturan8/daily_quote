import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quote_provider.dart';
import '../widgets/quote_card.dart';
import '../widgets/error_message.dart';
import '../widgets/loading_indicator.dart';
import '../widgets/refresh_button.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Günün Sözü'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.surfaceVariant,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Consumer<QuoteProvider>(
              builder: (context, quoteProvider, child) {
                if (quoteProvider.isLoading) {
                  return const LoadingIndicator();
                }
                
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (quoteProvider.quote != null)
                      QuoteCard(quote: quoteProvider.quote!),
                    
                    const SizedBox(height: 24),
                    
                    RefreshButton(
                      onPressed: quoteProvider.getNewQuote,
                    ),
                    
                    const SizedBox(height: 16),
                    
                    if (quoteProvider.errorMessage != null)
                      ErrorMessage(message: quoteProvider.errorMessage!),
                    
                    if (quoteProvider.isFromCache)
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          '* Çevrimdışı modda son alıntı gösteriliyor',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
} 