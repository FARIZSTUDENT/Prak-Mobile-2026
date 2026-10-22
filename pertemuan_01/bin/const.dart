void main () {
  final array1 = [1,2,3];
  const array2 = [1,2,3];

  array1[0] = 5;
  //Final masih bisa diubah nilainya.

  array2[0] = 5;
  //Const tidak bisa diubah nilainya.

  print(array1);
  print(array2);
}