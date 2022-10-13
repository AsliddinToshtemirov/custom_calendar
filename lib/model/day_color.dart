// api malumotlarini modeli // The model of api

class ColorDays {
  String? date;
  List<String>? green;
  List<String>? yellow;
  List<String>? grey;

  ColorDays({this.date, this.green, this.yellow, this.grey});

  ColorDays.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    green = json['green'].cast<String>();
    yellow = json['yellow'].cast<String>();
    grey = json['grey'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['green'] = green;
    data['yellow'] = yellow;
    data['grey'] = grey;
    return data;
  }
}
