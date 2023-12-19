# Introduction
SOLID is an acronym for the first five object-oriented design (OOD) principles by Robert C. Martin (also known as Uncle Bob).

Solid contains five principles, and we’ll take a look at each one. For each letter in solid, there is an abbreviation, and we’ll look at what they stand for. Hence, we will take a look at them all, but let’s take a moment to understand why we need solid in the first place. With solid, you can avoid bad software design patterns, engineering mistakes, and code depths, so your code will be easier and more readable as a result.

* S - Single-responsiblity Principle
* O - Open-closed Principle
* L - Liskov Substitution Principle
* I - Interface Segregation Principle
* D - Dependency Inversion Principle
 


### Single-Responsibility Principle
Single-responsibility Principle (SRP) states:

> A class should have one and only one reason to change, meaning that a class should have only one job.

In other words, rather than creating a single class that attempts to handle multiple tasks, it’s better to break down the tasks into separate classes, each responsible for a specific job. This approach makes your code easier to understand, maintain, and modify because each class has a clear and focused purpose.

#### *Bad Practice*
```
void main() {}

// Violating SRP
class User {
  String name;
  String email;

  User({required this.name, required this.email});

  void saveUser() {
    // Code to save user to a database
  }

  void sendEmail(String message) {
    // Code to send an email
  }
}
```

#### *Good Practice*

```
void main() {}

// Following SRP
class User {
  void saveUser() {
    // Code to save user to a database
  }
}

class EmailService {
  void sendEmail(String to, String message) {
    // Code to send an email
  }
}
```


### Open-Closed Principle
Open-closed Principle (OCP) states:

> Objects or entities should be open for extension but closed for modification.

In other words, you should be able to add new functionality to a class without altering its existing code. This principle promotes code stability and reduces the risk of introducing bugs when making changes.

#### *Bad Practice*
```
class Rectangle {
  final double width;
  final double height;

  Rectangle(this.width, this.height);

  double getArea() {
    return width * height;
  }
}

class Circle {
  final double radius;

  Circle(this.radius);

  double getArea() {
    return 3.14 * radius * radius;
  }
}

class AreaCalculator {
  double getTotalArea(List<dynamic> shapes) {
    double totalArea = 0.0;

    for (var shape in shapes) {
      if (shape is Rectangle) {
        totalArea += shape.getArea();
      } else if (shape is Circle) {
        totalArea += shape.getArea();
      }
      // Additional checks for new Shape types would be needed here
    }
    return totalArea;
  }
}

```

#### *Good Practice*

```
abstract class Shape {
  double getArea();
}

class Rectangle extends Shape {
  final double width;
  final double height;

  Rectangle(this.width, this.height);

  @override
  double getArea() {
    return width * height;
  }
}

class Circle extends Shape {
  final double radius;

  Circle(this.radius);
  @override
  double getArea() {
    return 3.14 * radius * radius;
  }
}

// adding another shape
class Square extends Shape {
  final double width;
  final double height;

  Square(this.width, this.height);
  @override
  double getArea() {
    return width * height;
  }
}

// now we don't have to change this for new shape
class AreaCalculator {
  double getTotalArea(List<Shape> shapes) {
    double totalArea = 0.0;

    for (var shape in shapes) {
      totalArea += shape.getArea();
    }

    return totalArea;
  }
}

```

### Liskov Substitution Principle
Liskov Substitution Principle states:

> Subtypes must be substitutable for their base types without altering the correctness of the program.
 
In simpler terms, objects of a superclass should be replaceable with objects of a subclass without affecting the program's functionality. the purpose of substitution is to replace a subtype somehow with its general parent type.
This means that every subclass or derived class should be substitutable for their base or parent class.

#### *Bad Practice*

```
abstract class Result {
  checkResult();
  codingTestResult();
}

class MechanicalBranch extends Result {
  @override
  checkResult() {
    //  some code
  }

  /*
  * Here it  is logically incorrect
  * */
  @override
  codingTestResult() {
    //  some code
  }
}

class ComputerScienceBranch extends Result {
  @override
  checkResult() {
    //  some code
  }

  @override
  codingTestResult() {
    //  some code
  }
}

```

#### *Good Practice*

```
abstract class OfflineResult {
  checkResult();
}

abstract class CodingResult {
  codingTestResult();
}

class MechanicalBranch implements OfflineResult {
  @override
  checkResult() {
    //  some code
  }
}

class ComputerScienceBranch implements OfflineResult, CodingResult {
  @override
  checkResult() {
    // somecode
  }

  @override
  codingTestResult() {
    // somecode
  }
}

```

### Interface Segregation Principle
Interface segregation principle states:

> A client should never be forced to implement an interface that it doesn’t use, or clients shouldn’t be forced to depend on methods they do not use.


Basically client should never depend on anything more than the method its calling.
#### *Bad Practice*
```
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

```

#### *Good Practice*
```
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
```

### Dependency Inversion Principle
Dependency inversion principle states:

> Entities must depend on abstractions, not on concretions. It states that the high-level module must not depend on the low-level module, but they should depend on abstractions.

#### *Bad Practice*
```
abstract class WeatherService {
  Future<String> getWeather();
}

class OpenWeatherMapService implements WeatherService {
  @override
  Future<String> getWeather() {
    // Fetch weather data from OpenWeatherMap
    return Future.delayed(Duration.zero);
  }
}

class WeatherApp {
  final WeatherService weatherService;

  WeatherApp(this.weatherService);

  Future<void> displayWeather() async {
    final weather = await weatherService.getWeather();
    print('Weather: $weather');
  }
}

```


