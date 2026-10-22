class Person {
  String name = "Guest";
  String? alamat;

  Person(String nameParam, String addressParam){
    name = nameParam;
    alamat = addressParam;
  }

  void sayHello(){
  print("Halo nama saya, $name");
}
}

void main() {
  var person1 = Person("Cihuy", "Rusia");
  var person2 = Person("Cihuy 2", "China");
  print(person1.name);
  print(person1.alamat);
  print(person2.name);
  print(person2.alamat);
  person1.sayHello();
  person2.sayHello();
}
