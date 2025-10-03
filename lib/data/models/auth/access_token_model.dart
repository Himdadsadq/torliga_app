class AccessTokenModel {
  final String? token;

  AccessTokenModel({
    this.token,
  });

  factory AccessTokenModel.fromJson(Map<String, dynamic> json) {
    return AccessTokenModel(
      token: json['access_token']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': token,
    };
  }
}