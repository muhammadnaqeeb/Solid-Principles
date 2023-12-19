abstract class Car {
  void pedal();
  // void addfuel();
}

abstract class Fuel {
  void addfuel();
}

abstract class Electric {
  void plugInCharger();
}

class Toyota implements Car, Fuel {
  @override
  void addfuel() {
    print("The car is adding fuel in station");
  }

  @override
  void pedal() {
    print("The car is pedalling");
  }
}

class Tesla implements Car, Electric {
  @override
  void pedal() {
    print("The car is pedalling");
  }

  @override
  void plugInCharger() {
    print("The car is charging");
  }
}
