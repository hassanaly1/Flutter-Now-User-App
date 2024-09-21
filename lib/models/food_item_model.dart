class MyFoodItemModel {
  final String? name;
  final String? image;
  double? price;
  final String? description;
  final String? restaurantName;
  int? totalCount;
  final String? category;
  final double? rating;
  final int? reviews;
  final int? discount;
  final bool? isDiscounted;
  final bool? inStock;
  final int? quantityAvailable;

  MyFoodItemModel({
    this.name,
    this.image,
    this.price,
    this.description,
    this.restaurantName,
    this.totalCount = 0,
    this.category,
    this.rating,
    this.reviews,
    this.discount,
    this.isDiscounted,
    this.inStock,
    this.quantityAvailable,
  });
}

List<MyFoodItemModel> foodItems = [
  MyFoodItemModel(
    name: "Margherita Pizza",
    image:
        'https://images.sbs.com.au/dims4/default/b62dc3d/2147483647/strip/true/crop/2000x1125+0+70/resize/1280x720!/quality/90/?url=http%3A%2F%2Fsbs-au-brightspot.s3.amazonaws.com%2Fdrupal%2Ffood%2Fpublic%2F2022-05-09-tcu-s3-rx030-slice-of-life-mahnaz-angury-easy-margherita-pizza-l.jpg',
    price: 8.99,
    description:
        "Our Margherita Pizza is a timeless classic that embodies the essence of Italian cuisine. Featuring a perfectly baked thin crust, it's generously topped with rich, creamy fresh mozzarella cheese and vibrant, aromatic basil leaves. The tomato sauce is simmered to perfection, providing a balanced tanginess that complements the other ingredients. Finished with a drizzle of high-quality olive oil and a sprinkle of sea salt, this pizza offers a harmonious blend of flavors and textures. Ideal for those who appreciate simplicity done right, our Margherita Pizza is a favorite among both pizza enthusiasts and newcomers alike.",
    restaurantName: "Pizza Palace",
    category: "Pizza",
    rating: 4.5,
    reviews: 120,
    discount: 10,
    isDiscounted: true,
    inStock: true,
    quantityAvailable: 12,
  ),
  MyFoodItemModel(
    name: "Cheese Burger",
    image:
        'https://t3.ftcdn.net/jpg/08/16/71/94/360_F_816719471_OmnA1qVm4aGOPRCCdY9mNA8qpSnf7aMi.jpg',
    price: 5.99,
    description:
        "Indulge in our mouth-watering Cheese Burger, where a juicy, perfectly grilled beef patty is nestled between two soft, toasted buns. Each bite delivers a delightful combination of melted cheddar cheese that oozes over the savory meat, complemented by crisp lettuce, fresh tomato slices, and tangy pickles. Our special house sauce adds a creamy and flavorful kick, enhancing the overall taste experience. Served with a side of golden, crispy French fries, this burger is a satisfying choice for anyone craving a hearty and delicious meal.",
    restaurantName: "Burger Barn",
    category: "Burger",
    rating: 4.2,
    reviews: 98,
    discount: 0,
    isDiscounted: false,
    inStock: true,
    quantityAvailable: 25,
  ),
  MyFoodItemModel(
    name: "Caesar Salad",
    image:
        "https://img.freepik.com/free-photo/flat-lay-salad-with-chicken-sesame-seeds_23-2148700369.jpg",
    price: 7.49,
    description:
        "Our Caesar Salad is a refreshing and hearty option, perfect for a light meal or a satisfying side. Crisp romaine lettuce is generously tossed with our creamy Caesar dressing, which is made from high-quality ingredients including garlic, anchovies, and Parmesan cheese. The salad is topped with crunchy croutons and a generous sprinkling of shaved Parmesan, adding texture and depth of flavor. For those seeking a protein boost, we offer the option to add grilled chicken or shrimp, making this salad both versatile and delicious. It's a timeless favorite that combines freshness with rich, savory notes.",
    restaurantName: "Green Bowl",
    category: "Salad",
    rating: 4.8,
    reviews: 45,
    discount: 5,
    isDiscounted: true,
    inStock: true,
    quantityAvailable: 35,
  ),
  MyFoodItemModel(
    name: "Spaghetti Carbonara",
    image:
        'https://t4.ftcdn.net/jpg/01/41/12/25/360_F_141122511_X1eEXS9nH13p6TziRMEmAvPmQVCYbyWy.jpg',
    price: 9.99,
    description:
        "Experience the rich and creamy flavors of our Spaghetti Carbonara. This traditional Italian dish features al dente spaghetti coated in a luxurious sauce made from eggs, Parmesan cheese, and a hint of black pepper. Generous pieces of crispy bacon add a savory crunch, perfectly complementing the smooth texture of the pasta. Finished with a sprinkle of fresh parsley, this Carbonara is both comforting and indulgent. Ideal for pasta lovers seeking a classic dish that delivers depth and satisfaction in every bite.",
    restaurantName: "Pasta House",
    category: "Pasta",
    rating: 4.3,
    reviews: 150,
    discount: 15,
    isDiscounted: true,
    inStock: true,
    quantityAvailable: 8,
  ),
  MyFoodItemModel(
    name: "Tandoori Chicken",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYrtZ7FKOw2d07eZOP7EO8CXyhWxB-oiSDcw&s",
    price: 11.99,
    description:
        "Our Tandoori Chicken is a masterpiece of Indian cuisine, featuring succulent chicken pieces marinated in a blend of yogurt and traditional spices. The marinade includes turmeric, cumin, coriander, and garam masala, which infuse the meat with vibrant flavors and a beautiful red hue. Grilled to perfection in a tandoor oven, the chicken emerges tender, juicy, and slightly charred, offering a delightful contrast of textures. Served with a side of cooling raita and fresh naan bread, this dish provides a harmonious balance of spicy and savory notes that are sure to satisfy your taste buds.",
    restaurantName: "Spice Hub",
    category: "Indian",
    rating: 4.7,
    reviews: 200,
    discount: 10,
    isDiscounted: true,
    inStock: true,
    quantityAvailable: 9,
  ),
  MyFoodItemModel(
    name: "Sushi Platter",
    image:
        'https://img.freepik.com/premium-photo/sushi-platter-hd-8k-wallpaper-stock-photographic-image_853645-44224.jpg',
    price: 18.99,
    description:
        "Dive into our exquisite Sushi Platter, an assortment of the finest sushi rolls crafted by our skilled chefs. This platter features a variety of fresh fish, including salmon, tuna, and shrimp, paired with perfectly seasoned sushi rice and wrapped in delicate nori sheets. Accompanied by crisp vegetables and flavorful sauces, each piece offers a unique taste experience. Garnished with sesame seeds and served with soy sauce, wasabi, and pickled ginger, this platter is ideal for sushi enthusiasts seeking a diverse and delightful selection that showcases the art of sushi making.",
    restaurantName: "Sakura Sushi",
    category: "Japanese",
    rating: 4.9,
    reviews: 310,
    discount: 0,
    isDiscounted: false,
    inStock: true,
    quantityAvailable: 11,
  ),
  MyFoodItemModel(
    name: "Chicken Burrito",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCahzdZEfq_VeKc8aeow5q6frE0mKYrZel9g&s",
    price: 6.99,
    description:
        "Our Chicken Burrito is a hearty and flavorful meal wrapped in a warm flour tortilla. It’s generously filled with tender grilled chicken, fluffy rice, and seasoned black beans, creating a balanced combination of proteins and carbohydrates. Fresh ingredients like crisp lettuce, juicy tomatoes, and shredded cheese add texture and taste, while our signature salsa and creamy sour cream provide the perfect finishing touches. Whether you're grabbing a quick lunch or enjoying a satisfying dinner, this burrito offers a delicious and convenient option that caters to a variety of tastes.",
    restaurantName: "Fiesta Mexicana",
    category: "Mexican",
    rating: 4.4,
    reviews: 80,
    discount: 10,
    isDiscounted: true,
    inStock: true,
    quantityAvailable: 50,
  ),
  MyFoodItemModel(
    name: "Pepperoni Pizza",
    image:
        'https://static.vecteezy.com/system/resources/thumbnails/033/281/423/small/slice-of-pizza-high-resolution-ai-generative-photo.jpg',
    price: 9.99,
    description:
        "Indulge in our Pepperoni Pizza, a beloved favorite for pizza lovers. This pizza features a crispy and chewy crust, generously topped with rich tomato sauce and a blend of mozzarella and cheddar cheeses that melt to perfection. Slices of spicy pepperoni are scattered evenly across the surface, offering bursts of flavor with every bite. Finished with a sprinkle of oregano and a drizzle of olive oil, our Pepperoni Pizza delivers a satisfying combination of savory, spicy, and cheesy goodness that’s perfect for any occasion.",
    restaurantName: "Pizza Palace",
    category: "Pizza",
    rating: 4.6,
    reviews: 160,
    discount: 10,
    isDiscounted: true,
    inStock: true,
    quantityAvailable: 75,
  ),
  MyFoodItemModel(
    name: "French Fries",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHDAAJnZKbpdiGB0uHcey1_U3AJZYR3Q8iIQ&s",
    price: 2.99,
    description:
        "Our French Fries are the perfect side dish to complement any meal. Made from fresh, high-quality potatoes, they are hand-cut and fried to achieve a crispy exterior while maintaining a fluffy interior. Lightly salted to enhance their natural flavor, these golden fries are irresistibly crunchy and satisfying. Whether enjoyed on their own or paired with your favorite dipping sauces like ketchup, aioli, or cheese sauce, our French Fries add a delightful touch to your dining experience.",
    restaurantName: "Snack Shack",
    category: "Sides",
    rating: 4.3,
    reviews: 230,
    discount: 0,
    isDiscounted: false,
    inStock: true,
    quantityAvailable: 57,
  ),
  MyFoodItemModel(
    name: "Greek Salad",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1xoSh_Q9oIgPWd4E0TM3GlR1e3ST3BVrSdA&s",
    price: 6.49,
    description:
        "Our Greek Salad is a vibrant and nutritious option, packed with fresh ingredients that celebrate Mediterranean flavors. Crisp cucumbers, juicy tomatoes, and red onions are combined with Kalamata olives and creamy feta cheese, creating a delightful mix of textures and tastes. Dressed with a tangy olive oil and lemon vinaigrette, this salad is both refreshing and satisfying. Garnished with oregano and a sprinkle of black pepper, our Greek Salad is a perfect choice for those seeking a healthy yet flavorful meal.",
    restaurantName: "Mediterraneo",
    category: "Salad",
    rating: 4.5,
    reviews: 95,
    discount: 5,
    isDiscounted: true,
    inStock: true,
    quantityAvailable: 68,
  ),
  MyFoodItemModel(
    name: "Beef Tacos",
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTad4RcECh860o5P6ReD6YpshCkXco7oV2suA&s',
    price: 7.99,
    description:
        "Savor our Beef Tacos, where tender, seasoned beef is nestled in soft, warm tortillas. Each taco is loaded with a flavorful mixture of beef, fresh lettuce, diced tomatoes, and shredded cheese, creating a perfect balance of savory and fresh ingredients. Topped with a drizzle of our signature salsa and a squeeze of lime, these tacos offer a burst of flavor in every bite. Whether you're enjoying a quick lunch or a satisfying dinner, our Beef Tacos provide a delicious and convenient option that embodies the essence of Mexican cuisine.",
    restaurantName: "Taco Town",
    category: "Mexican",
    rating: 4.7,
    reviews: 175,
    discount: 0,
    isDiscounted: false,
    inStock: true,
    quantityAvailable: 57,
  ),
  MyFoodItemModel(
    name: "Grilled Salmon",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTO0MCKvKFpHRPTuwrcuWn5XxgODZxHnd9_UQ&s",
    price: 14.99,
    description:
        "Our Grilled Salmon is a delightful and healthy choice, featuring fresh salmon fillets expertly grilled to achieve a perfect balance of crispy skin and tender, flaky flesh. Marinated in a blend of lemon juice, garlic, and herbs, the salmon is infused with vibrant flavors that enhance its natural richness. Served with a luscious lemon butter sauce and accompanied by seasonal vegetables, this dish not only satisfies your taste buds but also provides a nourishing and satisfying meal. Ideal for seafood enthusiasts seeking a flavorful and elegant option.",
    restaurantName: "Sea Breeze",
    category: "Seafood",
    rating: 4.8,
    reviews: 220,
    discount: 20,
    isDiscounted: true,
    inStock: true,
    quantityAvailable: 36,
  ),
  MyFoodItemModel(
    name: "Vegan Burger",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR522z3sNY_u05ewWcAo8GG5bDBBcVzMVExPr8CwKzYEA2JyY66VFEClKqNvb0UiZI7DBE&usqp=CAU",
    price: 9.49,
    description:
        "Our Vegan Burger is a delicious and wholesome alternative for plant-based eaters. Featuring a hearty plant-based patty made from a blend of vegetables, grains, and legumes, this burger is both satisfying and nutritious. Topped with crisp lettuce, juicy tomato slices, ripe avocado, and a tangy vegan mayo, each bite offers a delightful mix of textures and flavors. Served on a soft, toasted bun with a side of our signature sweet potato fries, the Vegan Burger is perfect for those looking to enjoy a tasty meal without compromising on their dietary preferences.",
    restaurantName: "Green Leaf",
    category: "Vegan",
    rating: 4.4,
    reviews: 110,
    discount: 5,
    isDiscounted: true,
    inStock: true,
    quantityAvailable: 85,
  ),
  MyFoodItemModel(
    name: "Pad Thai",
    image:
        "https://img.freepik.com/premium-photo/slowcooker-pad-thai-thai-food-photography_960396-1024.jpg",
    price: 10.99,
    description:
        "Experience the authentic flavors of Thailand with our Pad Thai. This beloved dish features stir-fried rice noodles cooked to perfection and tossed with tofu, crunchy peanuts, and a medley of fresh vegetables. The savory and slightly sweet sauce, made from tamarind paste, fish sauce, and a hint of lime, brings all the ingredients together in a harmonious blend of tastes. Garnished with fresh cilantro and lime wedges, our Pad Thai is both satisfying and aromatic, offering a delightful balance of textures and flavors that transport your taste buds straight to the streets of Bangkok.",
    restaurantName: "Thai Delight",
    category: "Thai",
    rating: 4.5,
    reviews: 190,
    discount: 0,
    isDiscounted: false,
    inStock: true,
    quantityAvailable: 54,
  ),
  MyFoodItemModel(
    name: "Chicken Alfredo",
    image:
        "https://www.shutterstock.com/image-photo/creamy-alfredo-pasta-chicken-mushrooms-600nw-2217614495.jpg",
    price: 12.49,
    description:
        "Indulge in our rich and creamy Chicken Alfredo, a classic Italian-American favorite. Tender grilled chicken breast slices are generously mixed with perfectly cooked fettuccine pasta, all enveloped in a luxurious Alfredo sauce made from heavy cream, Parmesan cheese, and a hint of garlic. The addition of sautéed mushrooms adds an earthy depth to the dish, while fresh parsley provides a touch of color and freshness. This hearty and satisfying meal is perfect for those seeking a comforting and flavorful pasta experience.",
    restaurantName: "Pasta House",
    category: "Pasta",
    rating: 4.7,
    reviews: 145,
    discount: 10,
    isDiscounted: true,
    inStock: true,
    quantityAvailable: 45,
  ),
  MyFoodItemModel(
    name: "Shrimp Tempura",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMgyRmZB6576Hpyqy3sJMnmz_ovGsuzXHJ5Q&s",
    price: 13.99,
    description:
        "Our Shrimp Tempura is a delightful Japanese appetizer featuring plump, juicy shrimp coated in a light and crispy batter. Each shrimp is carefully selected and dipped in a special tempura batter, then fried to perfection, resulting in a delicate crunch that complements the tender seafood inside. Served with a side of tangy dipping sauce and a sprinkle of sesame seeds, this dish is both elegant and satisfying. Ideal for sharing or enjoying as a starter, our Shrimp Tempura offers a taste of authentic Japanese cuisine that is sure to impress.",
    restaurantName: "Sakura Sushi",
    category: "Japanese",
    rating: 4.9,
    reviews: 175,
    discount: 15,
    isDiscounted: true,
    inStock: true,
    quantityAvailable: 74,
  ),
  MyFoodItemModel(
    name: "Falafel Wrap",
    image:
        'https://veggymalta.com/wp-content/uploads/2024/05/falafel-wrap-02.jpg',
    price: 6.99,
    description:
        "Our Falafel Wrap is a delicious and nutritious option inspired by Middle Eastern cuisine. Crispy, golden-brown falafel balls made from ground chickpeas and aromatic herbs are wrapped in a soft pita bread, accompanied by fresh vegetables like lettuce, tomatoes, and cucumbers. A drizzle of creamy tahini sauce adds a rich, nutty flavor, while pickled vegetables provide a tangy contrast. This wrap is not only flavorful but also packed with protein and fiber, making it a perfect choice for a satisfying and wholesome meal.",
    restaurantName: "Middle East Express",
    category: "Middle Eastern",
    rating: 4.3,
    reviews: 130,
    discount: 0,
    isDiscounted: false,
    inStock: true,
    quantityAvailable: 74,
  ),
  MyFoodItemModel(
    name: "BBQ Ribs",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoHPF7PyamUJTUSjEpM1VgFjPibEAfMZy_Hg&s",
    price: 16.99,
    description:
        "Sink your teeth into our mouthwatering BBQ Ribs, slow-cooked to perfection for maximum tenderness and flavor. These succulent ribs are generously coated with our signature tangy barbecue sauce, which caramelizes during the cooking process, creating a sticky, flavorful glaze. Each bite offers a perfect balance of smoky, sweet, and savory notes, complemented by the rich, juicy meat that falls off the bone. Served with a side of coleslaw and cornbread, our BBQ Ribs are a hearty and satisfying choice for any barbecue enthusiast.",
    restaurantName: "Smoke House",
    category: "BBQ",
    rating: 4.8,
    reviews: 250,
    discount: 20,
    isDiscounted: true,
    inStock: true,
    quantityAvailable: 76,
  ),
  MyFoodItemModel(
    name: "Mushroom Risotto",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8eh2ZHeNa7u29g7FWH_dsrJLBxmSTqxOVJQ&s",
    price: 11.99,
    description:
        "Our Mushroom Risotto is a creamy and comforting Italian dish that highlights the earthy flavors of fresh mushrooms. Arborio rice is slowly cooked in a rich vegetable broth, absorbing each flavorful spoonful until it reaches a perfect, creamy consistency. Sautéed mushrooms add depth and texture, while a generous amount of Parmesan cheese is stirred in to enhance the richness. Finished with a touch of white wine and a sprinkle of fresh parsley, this risotto is both elegant and satisfying, making it an ideal choice for a cozy dinner or a special occasion.",
    restaurantName: "Italian Bistro",
    category: "Italian",
    rating: 4.6,
    reviews: 100,
    discount: 0,
    isDiscounted: false,
    inStock: true,
    quantityAvailable: 25,
  ),
  MyFoodItemModel(
    name: "Ice Cream Sundae",
    image: 'https://tummy-to-heart.com/wp-content/uploads/2021/06/4O1A7470.png',
    price: 4.99,
    description:
        "Treat yourself to our decadent Ice Cream Sundae, a delightful dessert that combines creamy vanilla ice cream with rich, velvety chocolate sauce. Each scoop of ice cream is generously drizzled with the luscious chocolate topping, creating a perfect harmony of sweet flavors. Topped with a generous swirl of whipped cream and a cherry, this sundae offers a visually appealing and delicious end to any meal. Whether you're celebrating a special occasion or simply indulging your sweet tooth, our Ice Cream Sundae is sure to satisfy your dessert cravings.",
    restaurantName: "Sweet Treats",
    category: "Dessert",
    rating: 4.9,
    reviews: 300,
    discount: 0,
    isDiscounted: false,
    inStock: true,
    quantityAvailable: 34,
  ),
];
