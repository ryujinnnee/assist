class Data {
  static final items = [
    Item(
      id: 1,
      assigment: 'Pemrograman Mobile',
      desc: 'Instalasi Flutter, Dart, Widget',
      image: 'assets/icon/jisoo.png',
    ),
    Item(
      id: 2,
      assigment: 'Tugas So ',
      desc: 'Buat vidio upload di yutub',
      image: 'assets/icon/lg_umm.png',
    ),
    Item(
      id: 3,
      assigment: 'Tugas Si ',
      desc: 'presentasi',
      image: 'assets/icon/house.png',
    ),
  ];
}

class Item {
  final int id;
  final String assigment;
  final String desc;
  final String image;

  Item({required this.id, required this.assigment, required this.desc, required this.image});
}