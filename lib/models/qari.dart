class Qari{
  String? englishName;
  String? identifier;
  String? serverNumber;
  Qari({required this.englishName, required this.identifier,required this.serverNumber,});
  factory Qari.fromJson(Map<String, dynamic> json){
    return Qari(
      englishName: json['englishName'],
      identifier: json['identifier'],
      serverNumber: json['serverNumber'],


    );
  }
}