class A {
  List<String> list = [];
  void test(List<dynamic> dynList) {
    list = dynList.map((e) => e['id'] as String).toList();
  }
}
void main() {
  A().test([{'id': '1'}]);
  print("Success");
}
