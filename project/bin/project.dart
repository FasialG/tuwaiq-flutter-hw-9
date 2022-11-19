import 'dart:ffi';

import 'dart:io';

List<Book> Books = [
  Book(
      book_title: "Start With Why",
      author: "Simon Sink",
      price: 80,
      quantity: 13),
  Book(
      book_title: "But how do it know",
      author: "J.Clark Scott",
      price: 59.9,
      quantity: 22),
  Book(
      book_title: "Clean Code",
      author: "Rpbert Cecil Martin",
      price: 50,
      quantity: 5),
  Book(
      book_title: "Zero to One",
      author: "Peter Thiel",
      price: 45,
      quantity: 12),
  Book(
      book_title: "You dont know JS",
      author: "Kyle Simpson",
      price: 39.9,
      quantity: 9)
];
int counter = 1;

void main() {
  print("Welcome to pur library");

  bool quit = false;
  bool back = false; // to return back one step
  bool find = false;
  var theBook;

  do {
    print(
        "pleas select:\n1- Show all library books\n2- Search for a book\n3- Add a book\n4- Sell a book\n5- Delete a book\nQ- quit");
    String? input = stdin.readLineSync();
    switch (input) {
      case "1": // Show all books
        {
          for (var i in Books) {
            print(i.viewInformation());
          }
        }
        break;

      case "2": //Search for book
        {
          print(
              "please chose your searching method:\n1- Book ID\n2- Book title\n3- Book author");
          String? searchInput =
              stdin.readLineSync(); //it will take the method of search
          do {
            switch (searchInput) {
              case "1": //-----------------------------------------------search by ID
                {
                  print("Please inter the book ID or inter R to return");
                  String? bookId = stdin.readLineSync();

                  if (bookId == "R" || bookId == "r") {
                    //to return to main menu or one step
                    back = true;
                    break;
                  }
                  for (var i in Books) {
                    if (i.book_id == int.parse(bookId!)) {
                      // changing String to int to check ID number
                      // checking if the ID exist in the library
                      theBook = i;
                      print(i.viewInformation());
                      find = true;
                      print(theBook.book_title); // testing
                    }
                  }
                  if (find == false) {
                    print("your book with ID '${bookId}' dose not exist");
                  }
                }

                break;
              case "2": //------------------------------------------------search by Title
                {
                  print("Please inter the book title or inter R to return");
                  String? bookTitle = stdin.readLineSync();
                  
                  if (bookTitle == "R" || bookTitle == "r") {
                    //to return to main menu or one step
                    back = true;
                    break;
                  }

                  for (var i in Books) {
                    if (i.book_title == bookTitle) {
                      // changing String to int to check ID number
                      // checking if the ID exist in the library
                      theBook = i;
                      print(i.viewInformation());
                      find = true;
                      print(theBook.book_title);
                    }
                  }
                  if (find == false) {
                    print("your book with ID '${bookTitle}' dose not exist");
                  }
                }
                break;
              case "3": //------------------------------------------------search by Author
                {
                  print("Please inter the book title or inter R to return");
                  String? bookAuthor = stdin.readLineSync();
                  
                  if (bookAuthor == "R" || bookAuthor == "r") {
                    //to return to main menu or one step
                    back = true;
                    break;
                  }

                  for (var i in Books) {
                    if (i.book_title == bookAuthor) {
                      // changing String to int to check ID number
                      // checking if the ID exist in the library
                      theBook = i;
                      print(i.viewInformation());
                      find = true;
                      print(theBook.book_title);
                    }
                  }
                  if (find == false) {
                    print("your book with ID '${bookAuthor}' dose not exist");
                  }
                }
                break;
              default:
                {
                  print("Invalid choice");
                  back = true;
                }
                break;
            }
            if (find == true) {
              
              print(
                  "you find the book that you are looking for, what do you want to do?\n1- Edit the book\n2- Buy the book\n3- Delete the book\n4- Return to the main menu");
              String? fundedBook = stdin.readLineSync();
              if (fundedBook == "1") {
                theBook.edit();
                back = true;
              } else if (fundedBook == "2") {
                theBook.sell();
                back = true;
              } else if (fundedBook == "3") {
                theBook.delete();
                back = true;
              } else if (fundedBook == "4") {
                back = true;
              } else {
                print("miss input, please try agin");
                back = true;
              }
            }
          } while (back == false);
          back = false; //return the value of back to false
          break;
          //end of Case 2
        }

      case "3": //Add a book
        {
          Book().add();
        }
        break;

      case "4": //sell a book
        {
          Book().sell();
        }
        break;
      case "5": //Delete a book
        {
          Book().delete();
        }
        break;
      case "Q": //Quit
        {
          quit = true;
        }
        break;
      case "q": // Quit if you are lazy
        {
          quit = true;
        }
        break;

      default:
        {
          print("Invalid choice");
        }
        break;
    }
  } while (quit == false);
  print("Goodbye, See you in the next time");
}

abstract class Library {
  add();
  delete();
  edit();
  viewInformation();
  search();
  sell();
}

class Book extends Library {
  int? book_id = 0;
  String? book_title;
  String? author;
  double? price;
  int? quantity;
  Book({this.book_title, this.author, this.price, this.quantity}) {
    this.book_id = counter;
    counter++;
  }

  @override
  add() {
    print("Add a book");
  }

  @override
  delete() {
    print("the book Deleted ");
  }

  @override
  edit() {
    print("the book edited");
  }

  @override
  search() {}

  @override
  sell() {
    print("the sell is done");
  }

  @override
  viewInformation() {
    print("view all library book");
  }
}
