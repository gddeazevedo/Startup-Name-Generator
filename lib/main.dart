import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) => MaterialApp(
        title: 'Startup Name Generator',
        home: RandomWords()
    );
}

class RandomWords extends StatefulWidget {
    @override
    _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
    final List<WordPair> _suggestions = [];
    final _biggerFont = TextStyle(fontSize: 18.0);

    @override
    Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            title: Text('Startup Name Generator')
        ),
        body: _buildSuggestions()
    );

    Widget _buildSuggestions() => ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
            if (i.isOdd) {
                return Divider();
            }

            var index = i ~/2;

            if (index >= _suggestions.length) {
                _suggestions.addAll(generateWordPairs().take(10));
            }

            return _buildRow(_suggestions[index]);
        }
    );

    Widget _buildRow(WordPair pair) => ListTile(
        title: Text(
            pair.asPascalCase,
            style: _biggerFont
        )
    );
}