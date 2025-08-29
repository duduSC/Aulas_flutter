class Dog {
  final String message;
  final String status;

  Dog({required this.message, required this.status});

  factory Dog.fromJson(Map<String, dynamic> json) {
    return Dog(
      message: json['message'] as String,
      status: json['status'] as String,
    );
  }
}
