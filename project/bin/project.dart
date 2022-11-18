import 'dart:io';
import 'dart:math';

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
List cart = [];
void main() {
  print("Welcom to pur library");
  //add();
  //search();
  // print(Books.length);
  // delete();
  // print(Books.length);
}

abstract class Library {
  edit();
  viewInformation();
  sell();
}

class Book extends Library {
  int book_id = 0;
  String? book_title;
  String? author;
  double? price;
  late int quantity;
  Book(
      {required this.book_title,
      required this.author,
      required this.price,
      required this.quantity}) {
    this.book_id = counter;
    counter++;
  }

  @override
  @override
  @override
  edit() {
    var change;
    print(
        "what do you want to change? 1-title  2-Auther name  3-Book price  4-quantity of Book ");
    print("press 1,2,3 or 4 to change...");

    if (change == 1) {
      book_title = stdin.readLineSync();
    } else if (change == 2) {
      author = stdin.readLineSync();
    } else if (change == 3) {
      double price = double.parse(stdin.readLineSync()!);
    } else if (change == 4) {
      int quantity = int.parse(stdin.readLineSync()!);
    }
  }

  @override
  sell() {
    var check;
    print("which book you want to buy");
    print(viewInformation());

    print("now enter the quantity");
    int count = int.parse(stdin.readLineSync()!);

    check = price! * count;

    if (quantity > 0) {
      quantity--;
      print("Thank you for your Shopping");
    } else {
      print("Sorry! we are out of stock");
    }
  }

  @override
  viewInformation() {
    print(
        "The ID is $book_id\tThe Title is $book_title\tThe author $author\tThe price is $price\tThe quantity is $quantity ");
  }
}

add() {
  String? title;
  String? author;
  double? price;
  int quantity = 0;
  bool adding = true;

  while (adding) {
    print("Enter Book Title");
    title = stdin.readLineSync();
    if (title != "") {
      adding = false;
    }
  }
  adding = true;
  while (adding) {
    print("Enter Book Author");
    author = stdin.readLineSync()!;
    if (author != "") {
      adding = false;
    }
  }
  adding = true;
  while (adding) {
    print("Enter Book Price");
    price = double.parse(stdin.readLineSync()!);
    if (price > 0) {
      adding = false;
    }
  }
  adding = true;
  while (adding) {
    print("Enter Book Quantity");
    quantity = int.parse(stdin.readLineSync()!);
    if (quantity > 0) {
      adding = false;
    }
  }
  Books.add(Book(
      book_title: title, author: author, price: price, quantity: quantity));
}

look(int search) {
  var booksearch;
  bool se = true;
  if (search == 1) {
    while (se) {
      print("Enter Book ID");
      booksearch = int.parse(stdin.readLineSync()!);
      for (int i = 0; i < Books.length; i++) {
        var item = Books[i].book_id;
        if (item == booksearch) {
          Books[i].viewInformation();
          se = false;
        }
      }
    }
  } else if (search == 2) {
    while (se) {
      print("Enter Book Title");
      booksearch = stdin.readLineSync()!;
      for (int i = 0; i < Books.length; i++) {
        var item = Books[i].book_title;
        if (item!.contains(booksearch)) {
          // if (item == booksearch) for exact Match
          Books[i].viewInformation();
          se = false;
        }
      }
    }
  } else if (search == 3) {
    while (se) {
      print("Enter Book Autor");
      booksearch = stdin.readLineSync()!;
      for (int i = 0; i < Books.length; i++) {
        var item = Books[i].author;
        if (item!.contains(booksearch)) {
          // // if (item == booksearch) for exact Match
          Books[i].viewInformation();
          se = false;
        }
      }
    }
  }
}

search() {
  bool searching = true;
  int search;
  while (searching) {
    print("How do you want to Search\n1 By ID\n2 By Title \n3 By Author");
    search = int.parse(stdin.readLineSync()!);
    if (search == 1 || search == 2 || search == 3 || search == 4) {
      look(search);
      searching = false;
    }
  }
}

delete() {
  bool deleting = true;
  int deleteID;
  String deleteMessage = "Enter Book ID for deleting it ";
  while (deleting) {
    print(deleteMessage);
    deleteID = int.parse(stdin.readLineSync()!);
    for (int i = 0; i < Books.length; i++) {
      int x = Books[i].book_id;
      if (x == deleteID) {
        Books.remove(Books[i]);
        deleting = false;
      }
      deleteMessage = "Re enter a Valid ID";
    }
  }
}

viewLibrary() {
  for (int i = 0; i == Books.length; i++) {
    print(
        "The ID is ${Books[i].book_id} tThe Title is  ${Books[i].book_title} The author name is  ${Books[i].author} The price is ${Books[i].price} The quantity is ${Books[i].quantity}");
    var viewprice = Books[i]
        .price; //متغير يحدد لي قيمة الكتاب , عشان نستخدمة في حساب الفاتورة
  }
}
