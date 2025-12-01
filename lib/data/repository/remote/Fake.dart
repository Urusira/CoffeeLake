import '../../models/product/ProductData.dart';

class Fake {
  static final List<Product> products = [
    Product(
      id: 0,
      name: "Эспрессо",
      description: "Крепкий черный кофе из свежемолотых зёрен.",
      basePrice: [250.0],
      sale: 10,
      imageUrl: "",
      sizes: [0.03],
    ),
    Product(
      id: 1,
      name: "Капучино",
      description:
          "Кофе с не большим количеством вспененного молока - золотой стандарт.",
      basePrice: [290, 320, 340],
      sale: 14,
      imageUrl: "",
      sizes: [0.25, 0.35, 0.45],
    ),
    Product(
      id: 2,
      name: "Латте",
      description: "Нежный кофе с большим количеством молока.",
      basePrice: [320, 340],
      sale: 0,
      imageUrl: "",
      sizes: [0.35, 0.45],
    ),
    Product(
      id: 3,
      name: "Раф",
      description: "Нежный кофе с большим количеством сливок.",
      basePrice: [290, 320, 340],
      sale: 0,
      imageUrl: "",
      sizes: [0.25, 0.35, 0.45],
    ),
    Product(
      id: 4,
      name: "Флэт Уайт",
      description: "Крепкий кофе с тонкой молочной пенкой.",
      basePrice: [290, 320, 340],
      sale: 0,
      imageUrl: "",
      sizes: [0.25, 0.35, 0.45],
    ),
    Product(
      id: 5,
      name: "Американо",
      description: "Эспрессо с добавлением тёплой воды для мягкого вкуса.",
      basePrice: [290, 320, 340],
      sale: 0,
      imageUrl: "",
      sizes: [0.25, 0.35, 0.45],
    ),
    Product(
      id: 6,
      name: "Моккачино",
      description: "Капучино с добавлением шоколада и какао-порошка.",
      basePrice: [290, 320, 340],
      sale: 0,
      imageUrl: "",
      sizes: [0.25, 0.35, 0.45],
    ),
    Product(
      id: 7,
      name: "Фильтр",
      description: "Альтернативный способ заваривания для чистого вкуса.",
      basePrice: [290, 320, 340],
      sale: 30,
      imageUrl: "",
      sizes: [0.25, 0.35, 0.45],
    ),
    Product(
      id: 8,
      name: "Айс-латте",
      description: "Освежающий латте с колотым льдом.",
      basePrice: [290, 320, 340],
      sale: 15,
      imageUrl: "",
      sizes: [0.25, 0.35, 0.45],
    ),
    Product(
      id: 9,
      name: "Кортадо",
      description: "Испанский кофе с небольшим количеством подогретого молока",
      basePrice: [290, 320, 340],
      sale: 5,
      imageUrl: "",
      sizes: [0.25, 0.35, 0.45],
    ),
  ];

  static Product getProductById(int id) {
    return products[id];
  }

  static List<Product> getProducts() {
    return List.unmodifiable(products);
  }
}
