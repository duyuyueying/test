class UserInfoModel {
  final String phone;
  final String ids;
  final double progress;
  final double money;

  UserInfoModel({this.phone, this.ids, this.progress, this.money});

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      ids: json['ids'],
      phone: json['phone'],
      progress: json['progress'],
      money: json['money']
    );
  }
}