
class LoginResponseModel {
  
  final String userId;
  final String token;
  final int tokenExpires;
  final String refresToken;
  final int refreshTokenExpires;

  LoginResponseModel({
    required this.userId,
    required this.token,
    required this.tokenExpires,
    required this.refresToken,
    required this.refreshTokenExpires
  });

  factory LoginResponseModel.fromJson(String userId, Map<String, dynamic> json){

    return LoginResponseModel(
      userId: userId,
      token: json['token'],
      tokenExpires: (json['expires'] as num).toInt(),
      refresToken: json['refreshToken'],
      refreshTokenExpires: (json['refreshTokenExpires'] as num).toInt(),
    );
      
  }

  // Map<String, dynamic> toJson(){
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['name'] = this.name;
  //   return data;
  // }
}
