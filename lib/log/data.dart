class Data {
  static final items = [
    Item(
      id: 1,
      assigment: 'Pemrograman Mobile',
      desc: 'Instalasi Flutter, Dart, Widget',
      image: 'assets/icon/jisoo.png',
    )
  ];
}

class Item {
  final int id;
  final String assigment;
  final String desc;
  final String image;

  Item({required this.id, required this.assigment, required this.desc, required this.image});
}