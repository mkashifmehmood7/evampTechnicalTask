class ProfileModel {
  final String? token;
  final String? profileImage;
  final String? name;
  final String? email;
  final String? welcomeMessage;

  ProfileModel(
    this.token,
    this.profileImage,
    this.name,
    this.email,
    this.welcomeMessage,
  );

  static ProfileModel fromJson(Map<String, dynamic> resp) {
    return ProfileModel(
      resp['token'] as String?,
      resp['profileImage'] as String?,
      resp['name'] as String,
      resp['email'] as String?,
      resp['welcomeMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        "token": token,
        "profileImage": profileImage,
        "name": name,
        "email": email,
        "welcomeMessage": welcomeMessage,
      };
}
