import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(QuoteApp());
}

class QuoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuoteScreen(),
    );
  }
}

class QuoteScreen extends StatefulWidget {
  @override
  _QuoteScreenState createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  final List<Map<String, String>> quotes = [
    {"quote": "The greatest glory in living lies not in never falling, but in rising every time we fall.", "author": "Nelson Mandela"},
    {"quote": "The way to get started is to quit talking and begin doing.", "author": "Walt Disney"},
    {"quote": "Your time is limited, so don't waste it living someone else's life.", "author": "Steve Jobs"},
    {"quote": "If life were predictable it would cease to be life, and be without flavor.", "author": "Eleanor Roosevelt"},
    {"quote": "Life is what happens when you're busy making other plans.", "author": "John Lennon"}
  ];

  String currentQuote = "";
  String currentAuthor = "";

  @override
  void initState() {
    super.initState();
    generateRandomQuote();
  }

  void generateRandomQuote() {
    final random = Random();
    final randomIndex = random.nextInt(quotes.length);
    setState(() {
      currentQuote = quotes[randomIndex]["quote"]!;
      currentAuthor = quotes[randomIndex]["author"]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text("Random Quotes"),
        backgroundColor: Colors.white60,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '"$currentQuote"',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "- $currentAuthor",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[300],
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: generateRandomQuote,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 16),
                ),
                child: Text("New Quote"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
