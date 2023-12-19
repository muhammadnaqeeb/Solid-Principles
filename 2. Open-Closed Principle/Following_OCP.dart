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
