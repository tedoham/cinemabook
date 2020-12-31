class MovieXMLInfo {
  Data data;

  MovieXMLInfo({this.data});

  MovieXMLInfo.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  Moviedata moviedata;

  Data({this.moviedata});

  Data.fromJson(Map<String, dynamic> json) {
    moviedata = json['moviedata'] != null
        ? new Moviedata.fromJson(json['moviedata'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.moviedata != null) {
      data['moviedata'] = this.moviedata.toJson();
    }
    return data;
  }
}

class Moviedata {
  String id;
  String title;
  String rate;
  Datetime datetime;
  Showtime showtime;
  Allseat allseat;

  Moviedata(
      {this.id,
      this.title,
      this.rate,
      this.datetime,
      this.showtime,
      this.allseat});

  Moviedata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    rate = json['rate'];
    datetime = json['datetime'] != null
        ? new Datetime.fromJson(json['datetime'])
        : null;
    showtime = json['showtime'] != null
        ? new Showtime.fromJson(json['showtime'])
        : null;
    allseat =
        json['allseat'] != null ? new Allseat.fromJson(json['allseat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['rate'] = this.rate;
    if (this.datetime != null) {
      data['datetime'] = this.datetime.toJson();
    }
    if (this.showtime != null) {
      data['showtime'] = this.showtime.toJson();
    }
    if (this.allseat != null) {
      data['allseat'] = this.allseat.toJson();
    }
    return data;
  }
}

class Datetime {
  List<String> date;

  Datetime({this.date});

  Datetime.fromJson(Map<String, dynamic> json) {
    date = json['date'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    return data;
  }
}

class Showtime {
  List<Available> available;

  Showtime({this.available});

  Showtime.fromJson(Map<String, dynamic> json) {
    if (json['available'] != null) {
      available = new List<Available>();
      json['available'].forEach((v) {
        available.add(new Available.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.available != null) {
      data['available'] = this.available.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Available {
  String time;
  String status;

  Available({this.time, this.status});

  Available.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['status'] = this.status;
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
