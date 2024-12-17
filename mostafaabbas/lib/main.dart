import 'package:flutter/material.dart';

void main() {
  runApp(CalorieCalculatorApp());
}

class CalorieCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calorie Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: CalorieCalculatorHomePage(),
    );
  }
}

class CalorieCalculatorHomePage extends StatefulWidget {
  @override
  _CalorieCalculatorHomePageState createState() =>
      _CalorieCalculatorHomePageState();
}

class _CalorieCalculatorHomePageState extends State<CalorieCalculatorHomePage> {
  final Map<String, Map<String, double>> foodNutrients = {
    'Grilled Chicken': {
      'calories': 165,
      'protein': 31.0,
      'fat': 3.6,
      'healthyFat': 0.8,
    },
    'Fried Chicken': {
      'calories': 230,
      'protein': 27.0,
      'fat': 9.0,
      'healthyFat': 1.0,
    },
    'Apple': {
      'calories': 52,
      'protein': 0.3,
      'fat': 0.2,
      'healthyFat': 0.0,
    },
    'Banana': {
      'calories': 96,
      'protein': 1.3,
      'fat': 0.3,
      'healthyFat': 0.0,
    },
    'Broccoli': {
      'calories': 34,
      'protein': 2.8,
      'fat': 0.4,
      'healthyFat': 0.1,
    },
    'Spinach': {
      'calories': 23,
      'protein': 2.9,
      'fat': 0.4,
      'healthyFat': 0.1,
    },
    'Oats': {
      'calories': 389,
      'protein': 16.9,
      'fat': 6.9,
      'healthyFat': 1.0,
    },
    'Almonds': {
      'calories': 579,
      'protein': 21.1,
      'fat': 49.9,
      'healthyFat': 39.5,
    },
    'Dark Chocolate': {
      'calories': 546,
      'protein': 4.9,
      'fat': 31.3,
      'healthyFat': 5.0,
    },
    'Biscuits': {
      'calories': 502,
      'protein': 6.0,
      'fat': 24.0,
      'healthyFat': 5.0,
    },
    'Fresh Orange Juice': {
      'calories': 45,
      'protein': 0.9,
      'fat': 0.1,
      'healthyFat': 0.0,
    },
    'Tea (without sugar)': {
      'calories': 2,
      'protein': 0.1,
      'fat': 0.0,
      'healthyFat': 0.0,
    },
    // 20 new food items added
    'Beef Steak': {
      'calories': 242,
      'protein': 26.0,
      'fat': 16.0,
      'healthyFat': 1.5,
    },
    'Salmon': {
      'calories': 208,
      'protein': 20.0,
      'fat': 13.0,
      'healthyFat': 9.0,
    },
    'Chicken Breast': {
      'calories': 165,
      'protein': 31.0,
      'fat': 3.6,
      'healthyFat': 0.9,
    },
    'Carrot': {
      'calories': 41,
      'protein': 0.9,
      'fat': 0.2,
      'healthyFat': 0.0,
    },
    'Tomato': {
      'calories': 18,
      'protein': 0.9,
      'fat': 0.2,
      'healthyFat': 0.0,
    },
    'Cucumber': {
      'calories': 16,
      'protein': 0.7,
      'fat': 0.1,
      'healthyFat': 0.0,
    },
    'Chia Seeds': {
      'calories': 486,
      'protein': 16.5,
      'fat': 30.7,
      'healthyFat': 25.0,
    },
    'Peanut Butter': {
      'calories': 588,
      'protein': 25.0,
      'fat': 50.0,
      'healthyFat': 24.0,
    },
    'Sweet Potato': {
      'calories': 86,
      'protein': 1.6,
      'fat': 0.1,
      'healthyFat': 0.0,
    },
    'Coconut': {
      'calories': 354,
      'protein': 3.3,
      'fat': 33.5,
      'healthyFat': 30.0,
    },
    'Cabbage': {
      'calories': 25,
      'protein': 1.3,
      'fat': 0.1,
      'healthyFat': 0.0,
    },
    'Cauliflower': {
      'calories': 25,
      'protein': 1.9,
      'fat': 0.3,
      'healthyFat': 0.0,
    },
    'Lentils': {
      'calories': 353,
      'protein': 25.8,
      'fat': 1.0,
      'healthyFat': 0.2,
    },
    'Pineapple': {
      'calories': 50,
      'protein': 0.5,
      'fat': 0.1,
      'healthyFat': 0.0,
    },
    'Avocado': {
      'calories': 160,
      'protein': 2.0,
      'fat': 15.0,
      'healthyFat': 10.0,
    },
    'Mango': {
      'calories': 60,
      'protein': 0.8,
      'fat': 0.3,
      'healthyFat': 0.0,
    },
    'Grapes': {
      'calories': 69,
      'protein': 0.7,
      'fat': 0.2,
      'healthyFat': 0.0,
    },
  };

  final List<String> foodCategories = ['Meats', 'Fruits', 'Vegetables', 'Grains & Nuts', 'Canned & Sweets', 'Beverages'];

  String selectedCategory = 'Meats';
  String selectedFood = 'Grilled Chicken';
  double enteredWeight = 100;
  double calculatedCalories = 0;
  double calculatedProtein = 0;
  double calculatedFat = 0;
  double calculatedHealthyFat = 0;

  TextEditingController weightController = TextEditingController();

  void calculateNutrients() {
    setState(() {
      calculatedCalories = (foodNutrients[selectedFood]!['calories']! * enteredWeight) / 100;
      calculatedProtein = (foodNutrients[selectedFood]!['protein']! * enteredWeight) / 100;
      calculatedFat = (foodNutrients[selectedFood]!['fat']! * enteredWeight) / 100;
      calculatedHealthyFat = (foodNutrients[selectedFood]!['healthyFat']! * enteredWeight) / 100;
    });
  }

  List<String> getFoodsByCategory(String category) {
    switch (category) {
      case 'Meats':
        return ['Grilled Chicken', 'Fried Chicken', 'Beef Steak', 'Chicken Breast', 'Salmon'];
      case 'Fruits':
        return ['Apple', 'Banana', 'Pineapple', 'Mango', 'Grapes'];
      case 'Vegetables':
        return ['Broccoli', 'Spinach', 'Carrot', 'Tomato', 'Cucumber', 'Cabbage', 'Cauliflower'];
      case 'Grains & Nuts':
        return ['Oats', 'Almonds', 'Chia Seeds', 'Peanut Butter', 'Lentils'];
      case 'Canned & Sweets':
        return ['Dark Chocolate', 'Biscuits'];
      case 'Beverages':
        return ['Fresh Orange Juice', 'Tea (without sugar)'];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[300],
        title: Text(
          'Calorie Calculator',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select Food Category:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedCategory,
              isExpanded: true,
              items: foodCategories.map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category, style: TextStyle(fontSize: 16)),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                  selectedFood = getFoodsByCategory(selectedCategory).first;
                });
              },
            ),
            SizedBox(height: 20),
            Text('Select Food Item:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedFood,
              isExpanded: true,
              items: getFoodsByCategory(selectedCategory).map((String food) {
                return DropdownMenuItem<String>(
                  value: food,
                  child: Text(food, style: TextStyle(fontSize: 16)),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedFood = value!;
                });
              },
            ),
            SizedBox(height: 20),
            Text('Enter weight in grams:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter weight here',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                enteredWeight = double.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: calculateNutrients,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[400],
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                ),
                child: Text('Calculate Nutrients', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Text(
                'Calories: ${calculatedCalories.toStringAsFixed(2)} kcal\n'
                    'Protein: ${calculatedProtein.toStringAsFixed(2)} g\n'
                    'Fat: ${calculatedFat.toStringAsFixed(2)} g\n'
                    'Healthy Fat: ${calculatedHealthyFat.toStringAsFixed(2)} g',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue[700]),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}