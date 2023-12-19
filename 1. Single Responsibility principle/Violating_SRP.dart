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
