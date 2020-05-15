class TourTeamModel{
  final double income; // 当前阶段总收入
  final double friendIncome; // 扩散好友贡献
  TourTeamModel({this.income, this.friendIncome});

  factory TourTeamModel.from(Map<String, dynamic> json) {
    return TourTeamModel(
      friendIncome: json['friendIncome'],
      income: json['income'],
    );
  }
}