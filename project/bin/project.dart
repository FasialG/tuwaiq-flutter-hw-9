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

  int quit = 1;
  int back = 1;// to return back one step

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
              case "1":
                {
                  print("Please inter the book ID or inter R to return");
                  String? bookId = stdin.readLineSync();
                  bool find = false;

                  for (var i in Books) {
                    if (i.book_id == bookId) {
                      // checking if the ID exist in the library
                      print(i.viewInformation());
                      find = true;
                    }
                  }
                   if (bookId == "R" || bookId == "r") {
                    back = 0;
                  }

                  else if (find == false) {
                    print("your book with ID '${bookId}' dose not exist");
                  } 
                  
                }
            }
          } while (back == 1);
          back = 1;//return the value of back to 1
          break;
        }
      case "2":
        {
          break;
        }

      case "3": //Add a book
        {
          print("Fair");
        }
        break;

      case "4": //sell a book
        {
          print("Fair");
        }
        break;
      case "5": //Delete a book
        {
          print("Fair");
        }
        break;
      case "Q": //Quit
        {
          quit = 0;
        }
        break;
      case "q": // Quit if you are lazy
        {
          quit = 0;
        }
        break;

      default:
        {
          print("Invalid choice");
        }
        break;
    }
  } while (quit == 1);
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
  add() {}

  @override
  delete() {}

  @override
  edit() {}

  @override
  search() {}

  @override
  sell() {}

  @override
  viewInformation() {}
}
