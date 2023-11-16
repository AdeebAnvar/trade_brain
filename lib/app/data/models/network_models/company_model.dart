// class CompanyModel {
//   CompanyModel({this.globalQuote});

//   CompanyModel.fromJson(Map<String, dynamic> json) {
//     globalQuote = json['Global Quote'] != null
//         ? GlobalQuote.fromJson(json['Global Quote'])
//         : GlobalQuote();
//   }
//   GlobalQuote? globalQuote;

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (globalQuote != null) {
//       data['Global Quote'] = globalQuote!.toJson();
//     }
//     return data;
//   }
// }

// class GlobalQuote {
//   GlobalQuote(
//       {this.s01Symbol,
//       this.s02Open,
//       this.s03High,
//       this.s04Low,
//       this.s05Price,
//       this.s06Volume,
//       this.s07LatestTradingDay,
//       this.s08PreviousClose,
//       this.s09Change,
//       this.s10ChangePercent});

//   GlobalQuote.fromJson(Map<String, dynamic> json) {
//     s01Symbol = json['01. symbol'] ?? '';
//     s02Open = json['02. open'] ?? '';
//     s03High = json['03. high'] ?? '';
//     s04Low = json['04. low'] ?? '';
//     s05Price = json['05. price'] ?? '';
//     s06Volume = json['06. volume'] ?? '';
//     s07LatestTradingDay = json['07. latest trading day'] ?? '';
//     s08PreviousClose = json['08. previous close'] ?? '';
//     s09Change = json['09. change'] ?? '';
//     s10ChangePercent = json['10. change percent'] ?? '';
//   }
//   String? s01Symbol;
//   String? s02Open;
//   String? s03High;
//   String? s04Low;
//   String? s05Price;
//   String? s06Volume;
//   String? s07LatestTradingDay;
//   String? s08PreviousClose;
//   String? s09Change;
//   String? s10ChangePercent;

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['01. symbol'] = s01Symbol;
//     data['02. open'] = s02Open;
//     data['03. high'] = s03High;
//     data['04. low'] = s04Low;
//     data['05. price'] = s05Price;
//     data['06. volume'] = s06Volume;
//     data['07. latest trading day'] = s07LatestTradingDay;
//     data['08. previous close'] = s08PreviousClose;
//     data['09. change'] = s09Change;
//     data['10. change percent'] = s10ChangePercent;
//     return data;
//   }
// }

class CompanyModel {
  CompanyModel({this.type, this.symbol, this.company});

  CompanyModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    symbol = json['symbol'];
    company = json['company'];
  }
  String? type;
  String? symbol;
  String? company;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['symbol'] = symbol;
    data['company'] = company;
    return data;
  }
}
