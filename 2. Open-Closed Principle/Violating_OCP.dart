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
