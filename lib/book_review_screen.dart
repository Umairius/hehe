import 'package:flutter/material.dart';

class Book {
  final String title;
  final String author;
  final String review;

  Book({
    @required this.title,
    @required this.author,
    @required this.review,
  });
}

class BookReviewScreen extends StatefulWidget {
  @override
  _BookReviewScreenState createState() => _BookReviewScreenState();
}

class _BookReviewScreenState extends State<BookReviewScreen> {
  Book selectedBook;

  final List<Book> books = [
    Book(
      title: 'Book 1',
      author: 'Author 1',
      review: 'Add review text here',
    ),
    Book(
      title: 'Book 2',
      author: 'Author 2',
      review: 'Add review text here',
    ),
    Book(
      title: 'Book 3',
      author: 'Author 3',
      review: 'Add review text here',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Reviews'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.7,
        ),
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedBook = book;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300), // Add duration here
              curve: Curves.easeInOut,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300],
                    blurRadius: 6.0,
                    offset: Offset(4, 4),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 6.0,
                    offset: Offset(-4, -4),
                  ),
                  BoxShadow(
                    color: Colors.grey[400],
                    blurRadius: 6.0,
                    offset: Offset(-4, 4),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 6.0,
                    offset: Offset(4, -4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: selectedBook == book ? 200 : 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                      color: Colors.grey[300],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.book,
                        size: selectedBook == book ? 100 : 60,
                        // Existing code...
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          book.author,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Review: ${book.review}',
                          style: TextStyle(
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
