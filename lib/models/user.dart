class User {
  final int id;
  final String name;
  final String displayName;
  final String avatarURL;
  // final Profile profile;

  User({
    this.id,
    this.name,
    this.displayName,
    this.avatarURL,
    // this.profile,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      displayName: json['displayName'] as String,
      avatarURL: json['avatarUrl'] as String,
      // profile:
      //     json['profile'] == null ? null : Profile.fromJson(json['profile']),
    );
  }
}
