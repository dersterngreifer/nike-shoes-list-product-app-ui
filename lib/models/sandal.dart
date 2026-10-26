class Shoe {
  final String name;
  final String image;
  final int price;
  final double rating;

  const Shoe({
    required this.name,
    required this.image,
    required this.price,
    required this.rating,
  });

  // Backward compatibility getters
  String get nama => name;
  String get foto => image;
  int get harga => price;

  static List<Shoe> getShoes() {
    return const [
      Shoe(name: "Air Max", image: "Green 1.png", price: 120, rating: 4.5),
      Shoe(name: "Air Force", image: "nike main.png", price: 100, rating: 4.2),
      Shoe(name: "React Element", image: "Shoe 1.png", price: 90, rating: 4.7),
      Shoe(name: "Free Run", image: "toppng.png", price: 80, rating: 4.0),
      Shoe(name: "Epic React", image: "Yellow Shoe.png", price: 150, rating: 4.8),
    ];
  }

  // Alias for backward compatibility
  static List<Shoe> getSepatu() => getShoes();
}

// Backward compatibility alias
typedef Sepatu = Shoe;
