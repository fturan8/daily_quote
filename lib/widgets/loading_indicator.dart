import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text(
            'Söz yükleniyor...',
            style: TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
} 