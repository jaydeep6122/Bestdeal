class Item {
  final String title;
  final String thumbnail;
  final int payout_amt;
  final String payout_currency;
  final String color;
  Item(
      {required this.payout_amt,
      required this.title,
      required this.thumbnail,
      required this.payout_currency,
      required this.color});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
        payout_amt: json['payout_amt'],
        title: json['title'],
        thumbnail: json['brand']['logo'],
        payout_currency: json['payout_currency'],
        color: json['custom_data']['dominant_color']);
  }
}
