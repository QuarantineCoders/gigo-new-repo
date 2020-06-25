class Note {
  String id;
  String total;
  String decomposable;
  String nondecomposable;
  String capablecompost;
  String ecobrick;
  String amount;
  Note(this.id, this.total, this.decomposable, this.nondecomposable,
      this.capablecompost, this.ecobrick, this.amount);
  Note.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    decomposable = json['decomposable'];
    nondecomposable = json['nondecomposable'];
    capablecompost = json['capablecompost'];
    ecobrick = json['ecobrick'];
    amount = json['amount'];
  }
}
