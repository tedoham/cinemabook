class MovieDataFromLocal {
  String id;
  String rate;
  List<Showtime> showtime;
  List<String> r1;
  List<String> r2;
  List<String> r3;
  List<String> r4;
  List<String> r5;
  List<String> r6;
  List<String> r7;
  List<String> r8;
  List<String> r9;

  MovieDataFromLocal(
      {this.id,
      this.rate,
      this.showtime,
      this.r1,
      this.r2,
      this.r3,
      this.r4,
      this.r5,
      this.r6,
      this.r7,
      this.r8,
      this.r9});

  MovieDataFromLocal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rate = json['rate'];
    if (json['showtime'] != null) {
      showtime = new List<Showtime>();
      json['showtime'].forEach((v) {
        showtime.add(new Showtime.fromJson(v));
      });
    }
    r1 = json['r1'].cast<String>();
    r2 = json['r2'].cast<String>();
    r3 = json['r3'].cast<String>();
    r4 = json['r4'].cast<String>();
    r5 = json['r5'].cast<String>();
    r6 = json['r6'].cast<String>();
    r7 = json['r7'].cast<String>();
    r8 = json['r8'].cast<String>();
    r9 = json['r9'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rate'] = this.rate;
    if (this.showtime != null) {
      data['showtime'] = this.showtime.map((v) => v.toJson()).toList();
    }
    data['r1'] = this.r1;
    data['r2'] = this.r2;
    data['r3'] = this.r3;
    data['r4'] = this.r4;
    data['r5'] = this.r5;
    data['r6'] = this.r6;
    data['r7'] = this.r7;
    data['r8'] = this.r8;
    data['r9'] = this.r9;
    return data;
  }
}

class Showtime {
  String time;
  String status;
  String cinema;
  String block;

  Showtime({this.time, this.status, this.cinema, this.block});

  Showtime.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    status = json['status'];
    cinema = json['cinema'];
    block = json['block'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['status'] = this.status;
    data['cinema'] = this.cinema;
    data['block'] = this.block;
    return data;
  }
}
