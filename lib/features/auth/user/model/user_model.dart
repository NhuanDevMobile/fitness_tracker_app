class UserModel {
  final String uid;
  final String email;
  final String? displayName;
  final String? createdAt;
  final String? updateAt;
  // Các trường dữ liệu khác có thể có

  UserModel({
    required this.uid,
    required this.email,
    this.displayName,
    this.createdAt,
    this.updateAt,
    // Thêm các tham số khác nếu cần thiết
  });

  // Factory constructor để tạo một User từ một Map (JSON)
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      displayName: map['displayName'],
      createdAt: map['createdAt'],
      updateAt: map['updateAt'],
      // Khai báo các trường dữ liệu khác nếu cần thiết
    );
  }

  // Phương thức để chuyển đổi User thành một Map (JSON)
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'createdAt': createdAt ?? DateTime.now().toString(),
      'updateAt': updateAt,
      // Chuyển đổi các trường dữ liệu khác nếu cần thiết
    };
  }
}
