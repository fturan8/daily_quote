import 'package:flutter/material.dart';
import '../models/quote_model.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;

  const QuoteCard({Key? key, required this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Icon(
              Icons.format_quote,
              size: 30,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            Text(
              quote.text,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              "- ${quote.author}",
              style: const TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }
} 