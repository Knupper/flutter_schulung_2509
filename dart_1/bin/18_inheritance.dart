void main() {
  Student student1 = Student();
  student1.setSemester = 2;
  student1.setAge = 22;
  student1.setName = 'Lena';

  Person person1 = Person();
  person1.setName = 'Udo';
  person1.setAge = 20;

  int semester = student1.getSemester;

  print(semester);

  // student1.jump();
  // student1.study();
  student1.run();
  person1.run();
  student1.party();
  person1.study();
}

mixin Learner {
  void study() {
    print('study');
  }
}

mixin Jumper {
  void jump() {
    print('I can jump!');
  }
}

class Person with Learner {
  late String _name;
  late int _age;

  String get getName => this._name;

  int get getAge => this._age;

  set setName(String name) {
    this._name = name;
  }

  set setAge(int age) {
    this._age = age;
  }

  void run() {
    print('$_name runs!');
  }
}

class Student extends Person {
  late int _semester;

  int get getSemester => this._semester;

  set setSemester(int semester) {
    this._semester = semester;
  }

  void party() {
    print('$_name is on a party!');
  }
}
