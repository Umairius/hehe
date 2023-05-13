import 'package:flutter/material.dart';
import 'book_review_screen.dart';
import 'explorescreen.dart';
import 'favoritesscreen.dart';

void main() {
  runApp(BookReviewApp());
}

class BookReviewApp extends StatefulWidget {
  @override
  _BookReviewAppState createState() => _BookReviewAppState();
}

class _BookReviewAppState extends State<BookReviewApp> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    BookReviewScreen(),
    ExploreScreen(),
    FavoriteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Review App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Book Review App'),
        ),
        body: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: _screens[_currentIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.reviews),
              label: 'Reviews',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
          ],
        ),
      ),
    );
  }
}
