class AyaOfTheDay{
  final String? arText;
  final String? enTran;
  final String? aya;
  final String? surEnName;
  final String? surNumber;
  final String? footnotes;

  AyaOfTheDay({this.arText, this.enTran, this.surEnName, this.surNumber,this.aya,this.footnotes});
  factory AyaOfTheDay.fromJSON(Map<String, dynamic> json){
    return AyaOfTheDay(
      arText: json['result']['arabic_text'],
      enTran: json['result']['translation'],
      surEnName: json['result']['aya'],
        aya: json['result']['aya'],
        footnotes: json['result']['footnotes'],
      surNumber: json['result']['aya']

    );
  }
}