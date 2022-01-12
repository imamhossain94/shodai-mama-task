import 'package:hive/hive.dart';

part 'rating.g.dart';


@HiveType(typeId: 1)
class Rating {
  @HiveField(0)
  num? rate;
  @HiveField(1)
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rate'] = rate;
    data['count'] = count;
    return data;
  }
}