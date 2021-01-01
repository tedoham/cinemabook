class CinemaSeatStatus {
  String id;
  List<int> r1;
  List<int> r2;
  List<int> r3;
  List<int> r4;
  List<int> r5;
  List<int> r6;
  List<int> r7;
  List<int> r8;
  List<int> r9;

  CinemaSeatStatus(
      {this.id,
      this.r1,
      this.r2,
      this.r3,
      this.r4,
      this.r5,
      this.r6,
      this.r7,
      this.r8,
      this.r9});

  CinemaSeatStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    r1 = json['r1'].cast<int>();
    r2 = json['r2'].cast<int>();
    r3 = json['r3'].cast<int>();
    r4 = json['r4'].cast<int>();
    r5 = json['r5'].cast<int>();
    r6 = json['r6'].cast<int>();
    r7 = json['r7'].cast<int>();
    r8 = json['r8'].cast<int>();
    r9 = json['r9'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
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
