abstract class Car {
  void pedal();
  void addfuel();
}

class Toyota implements Car {
  @override
  void addfuel() {
    print("The car is adding fuel in station");
  }

  @override
  void pedal() {
    print("The car is pedalling");
  }
}

class Tesla implements Car {
  @override
  void pedal() {
    print("The car is pedalling");
  }

  @override
  void addfuel() {} // ????
}
