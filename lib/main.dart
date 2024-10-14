import 'package:flutter/material.dart';
import 'package:flutter_menu/models/food.dart';

void main() {
  runApp(const MenuApp());
}

class MenuApp extends StatelessWidget {
  const MenuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Build the main MaterialApp widget
    return MaterialApp(
      title: 'Menu App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  // List of Food items to be displayed
  final List<Food> menuItems = [
    const Food(name: 'Pasta', imgPath: 'assets/images/pasta.jpg'),
    const Food(name: 'Burger', imgPath: 'assets/images/burger.jpg'),
    const Food(name: 'Sushi', imgPath: 'assets/images/suchi.jpg'),
    const Food(name: 'Pizza', imgPath: 'assets/images/pizza.jpg'),
    const Food(name: 'Biryani', imgPath: 'assets/images/biryani.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    // Build the main layout for the HomePage
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        centerTitle: true,
        backgroundColor: Colors.red, // Set AppBar background color
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, // Number of columns in the grid
          childAspectRatio: 3 / 2, // Aspect ratio of each grid item
          crossAxisSpacing: 10, // Horizontal spacing between grid items
          mainAxisSpacing: 10, // Vertical spacing between grid items
        ),
        itemCount: menuItems.length, // Total number of items in the grid
        itemBuilder: (context, index) {
          final foodItem = menuItems[index]; // Get the food item for this index
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(10), // Rounded corners for the card
            ),
            elevation: 5, // Shadow elevation of the card
            child: Container(
              padding: const EdgeInsets.all(10.0), // Padding inside the card
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align items to the start
                children: [
                  Image.asset(
                    foodItem.imgPath, // Load the food item's image
                    width: double.infinity, // Make the image full width
                    height: 200, // Fixed height for the image
                    fit: BoxFit.contain, // Fit the image within the bounds
                  ),
                  const SizedBox(
                      height: 20), // Space between the image and text
                  Text(
                    foodItem.name, // Display the name of the food item
                    style: const TextStyle(
                      fontSize: 20, // Font size for the food name
                      fontWeight: FontWeight.bold, // Bold font weight
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
