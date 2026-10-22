class Person {
  String name = "Cihuy";
  String? alamat;
void sayHello() {
  print("Hello my name is $name");
}
}



void main() {
  var person1 = Person();
  person1.name = "Cihuy";
  person1.alamat = "Rusia";
  var person2 = Person();
  person2.name = "Cihuy 2";
  person2.alamat = "China";
  print(person1.name);
  print(person1.alamat);
  print(person2.name);
  print(person2.alamat);
  person1.sayHello();
  person2.sayHello();
}