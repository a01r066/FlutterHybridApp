class TraviaNumber {
  final String? text;
  final int? number;
  final bool? found;
  final String? type;

  const TraviaNumber({
    this.text,
    this.number,
    this.found,
    this.type,
  });

  @override
  String toString() {
    return 'TraviaNumber{text: $text, number: $number, found: $found, type: $type}';
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'number': number,
      'found': found,
      'type': type,
    };
  }

  factory TraviaNumber.fromMap(Map<String, dynamic> map) {
    return TraviaNumber(
      text: map['text'],
      number: map['number'],
      found: map['found'],
      type: map['type'],
    );
  }
}