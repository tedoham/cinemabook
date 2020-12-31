class SeatStatus {
  Allseat allseat;

  SeatStatus({this.allseat});

  SeatStatus.fromJson(Map<String, dynamic> json) {
    allseat =
        json['allseat'] != null ? new Allseat.fromJson(json['allseat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allseat != null) {
      data['allseat'] = this.allseat.toJson();
    }
    return data;
  }
}

class Allseat {
  List<Seatlist> seatlist;

  Allseat({this.seatlist});

  Allseat.fromJson(Map<String, dynamic> json) {
    if (json['seatlist'] != null) {
      seatlist = new List<Seatlist>();
      json['seatlist'].forEach((v) {
        seatlist.add(new Seatlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.seatlist != null) {
      data['seatlist'] = this.seatlist.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Seatlist {
  List<String> seat;

  Seatlist({this.seat});

  Seatlist.fromJson(Map<String, dynamic> json) {
    seat = json['seat'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seat'] = this.seat;
    return data;
  }
}
