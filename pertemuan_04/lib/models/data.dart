class User {
  String username;
  String password;
  String nama;

  User({required this.username, required this.password, required this.nama});
}

User user1 = User(
  username: 'budi123',
  password: 'password123',
  nama: 'Budi Santoso',
);

class Product {
  String id;
  String name;
  String price;

  Product({required this.id, required this.name, required this.price});
}

final List<Product> products = [
  Product(id: '1', name: 'Zyrex Mouse', price: '10000'),
  Product(id: '2', name: 'Zyrex Keyboard', price: '15000'),
  Product(id: '3', name: 'Zyrex Monitor', price: '30000'),
];
