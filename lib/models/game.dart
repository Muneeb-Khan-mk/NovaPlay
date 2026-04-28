class Game {
  final int id;
  final String title;
  final String image;
  final String description;
  final double price;

  const Game({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.price,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Game && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}