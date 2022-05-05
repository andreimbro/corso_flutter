class Bank {
  Bank({
    required this.cardExpire,
    required this.cardNumber,
    required this.cardType,
    required this.currency,
    required this.iban,
  });
  late final String cardExpire;
  late final String cardNumber;
  late final String cardType;
  late final String currency;
  late final String iban;

  Bank.fromJson(Map<String, dynamic> json) {
    cardExpire = json['cardExpire'];
    cardNumber = json['cardNumber'];
    cardType = json['cardType'];
    currency = json['currency'];
    iban = json['iban'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cardExpire'] = cardExpire;
    _data['cardNumber'] = cardNumber;
    _data['cardType'] = cardType;
    _data['currency'] = currency;
    _data['iban'] = iban;
    return _data;
  }
}
