class PositionalConstructor {
  final int id;
  String value;
  double? optional;

  PositionalConstructor(this.id, this.value, [this.optional]);

  final exampleNoOptional = PositionalConstructor(1, "First");
  final exampleWithOptional = PositionalConstructor(2, "Second", 1.234);
}

class NamedConstructor {
  final int id;
  String value;
  double? optional;

  NamedConstructor({
    required this.id,
    required this.value,
    this.optional,
  });

  final withoutOptional = NamedConstructor(id: 1, value: "First");
  final withOptional = NamedConstructor(
    id: 2,
    value: "Second",
    optional: 1.234,
  );
}
