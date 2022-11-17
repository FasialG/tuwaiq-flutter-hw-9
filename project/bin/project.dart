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
      author: "Robert Cecil Martin",
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
  print("Welcom to pur library");
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

  get book => null;

  @override
  add() {
    print("Enter book name: ");
    String? newtitle = book_title = stdin.readLineSync();
    print("Enter auther name: ");
    String? newauthor = author = stdin.readLineSync();
    print("Enter book price : ");
    //int? newprice = price = int.parse(stdin.readLineSync());
    print("Enter quantity of book : ");
    //double? newq = quantity =double.parse(stdin.readLineSync());
  }

  @override
  delete() {}

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
      // price = int.parse(stdin.readLineSync());
    } else if (change == 4) {
      // quantity = stdin.readLineSync();
    }
  }

  @override
  search() {}
}

@override
sell() {}

@override
viewInformation() {
  print(
      "1- Book name:Start With Why  Auther:simon sink  price:80.0  quantity: 13 ");

  print(
      "2- Book name:But how do it know  Auther:J.Clark Scott  price:59.9  quantity: 22 ");

  print(
      "3- Book name:Clean Code Auther:Rpbert Cecil Martin  price:50.0  quantity: 5 ");

  print(
      "4- Book name:Zero to One  Auther:Peter Thiel price:45.0  quantity: 12 ");

  print(
      "5- Book name:You dont know JS  Auther:Kyle Simpson  price:39.9  quantity: 9 ");
}
