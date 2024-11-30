import 'package:flutter/material.dart';
import 'package:satori/pages/scan.dart';
import 'package:satori/pages/account.dart';

class ScannedOutfit {
  final String imagePath; // Path to the outfit image
  final DateTime timestamp; // Timestamp of when the outfit was scanned
  final List<String> description; // A list of 5 descriptive words

  ScannedOutfit({
    required this.imagePath,
    required this.timestamp,
    required this.description,
  });

  // Optional: A method to display the outfit details
  String getFormattedDetails() {
    return 'Scanned on ${timestamp.toString()}, Description: ${description.join(', ')}';
  }
}

final List<ScannedOutfit> scannedOutfits = [
  ScannedOutfit(
    imagePath: 'assets/images/outfit1.jpg',
    timestamp: DateTime.now(),
    description: ['Casual'],
  ),
  ScannedOutfit(
    imagePath: 'assets/images/outfit1.jpg',
    timestamp: DateTime.now().subtract(Duration(minutes: 30)),
    description: ['Black', 'Elegant'],
  ),
  ScannedOutfit(
    imagePath: 'assets/images/outfit1.jpg',
    timestamp: DateTime.now().subtract(Duration(days: 1)),
    description: ['Sporty', 'Red'],
  ),
  ScannedOutfit(
    imagePath: 'assets/images/outfit1.jpg',
    timestamp: DateTime.now(),
    description: ['Modern'],
  ),
  ScannedOutfit(
    imagePath: 'assets/images/outfit1.jpg',
    timestamp: DateTime.now().subtract(Duration(hours: 5)),
    description: ['Slim', 'Classic'],
  ),
  ScannedOutfit(
    imagePath: 'assets/images/outfit1.jpg',
    timestamp: DateTime.now().subtract(Duration(days: 1)),
    description: ['Dynamic'],
  ),
  ScannedOutfit(
    imagePath: 'assets/images/outfit1.jpg',
    timestamp: DateTime.now(),
    description: ['Blue', 'Denim'],
  ),
  ScannedOutfit(
    imagePath: 'assets/images/outfit1.jpg',
    timestamp: DateTime.now().subtract(Duration(hours: 5)),
    description: ['Formal'],
  ),
  ScannedOutfit(
    imagePath: 'assets/images/outfit1.jpg',
    timestamp: DateTime.now(),
    description: ['Casual'],
  ),
  ScannedOutfit(
    imagePath: 'assets/images/outfit1.jpg',
    timestamp: DateTime.now().subtract(Duration(hours: 5)),
    description: ['Classic'],
  ),
  ScannedOutfit(
    imagePath: 'assets/images/outfit1.jpg',
    timestamp: DateTime.now().subtract(Duration(days: 1)),
    description: ['Athletic'],
  ),
  ScannedOutfit(
    imagePath: 'assets/images/outfit1.jpg',
    timestamp: DateTime.now().subtract(Duration(days: 1)),
    description: ['Red'],
  ),
];

String formatTimeAgo(DateTime timestamp) {
  final duration = DateTime.now().difference(timestamp);

  if (duration.inDays > 1) {
    return '${duration.inDays}d ago'; // Days ago
  } else if (duration.inHours >= 1) {
    return '${duration.inHours}h ago'; // Hours ago
  } else if (duration.inMinutes >= 1) {
    return '${duration.inMinutes}m ago'; // Minutes ago
  } else {
    return 'Just now';
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    Padding(
      padding: const EdgeInsets.only(bottom: 1.0), //TODO
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recently Scanned',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: scannedOutfits.length,
              itemBuilder: (context, index) {
                final outfit = scannedOutfits[index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white, // Background color for the outfit box
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Shadow position
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Timestamp at the top
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Text(
                          formatTimeAgo(
                              outfit.timestamp), // Format the timestamp
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Outfit image in the middle
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            outfit.imagePath,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.error, size: 50); // Fallback UI
                            },
                          ),
                        ),
                      ),
                      // Description at the bottom
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Text(
                          outfit.description
                              .join(', '), // Join description words
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            Text(
              "What You'll Love", // What You'll Love Section
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Project Satori is your one-stop solution for shopping smarter and faster. Here's what makes us special:",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.check, color: Colors.green),
                    SizedBox(width: 10),
                    Text(
                      textAlign: TextAlign.center,
                      "Accurate Results",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Scan outfits with ease using our Advanced AI which ensures precise identification of clothing items.",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.check, color: Colors.green),
                    SizedBox(width: 10),
                    Text(
                      "Effortless Shopping",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Quickly find where to buy the clothes you love",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.check, color: Colors.green),
                    SizedBox(width: 10),
                    Text(
                      "Time-Saving",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "No more endless searching but get instant links to online stores for your style.",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.check, color: Colors.green),
                    SizedBox(width: 10),
                    Text(
                      "Your closet-digitized",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Save your favorite outfits to revisit them anytime to shop or to share with friends.",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    ),
    ScanPage(),
    AccountPage(),
  ];

  String _getTitleForPage(int index) {
    const titles = ["Hello User", "Scan", "Account"];
    return titles[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0), // Set the height here
        child: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          iconTheme: IconThemeData(
            color: Color.fromRGBO(217, 208, 222, 1), // Change your color here
          ),
          backgroundColor: Color.fromRGBO(12, 23, 19, 1),
          title: Text(
            _getTitleForPage(_selectedIndex),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(217, 208, 222, 1),
              fontFamily: "Roboto",
            ),
          ),
        ),
      ),
      body: _pages[_selectedIndex],
      extendBody: true, // Ensures the floating navbar overlaps body content
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(25.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 8,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: BottomNavigationBar(
              backgroundColor: Color.fromRGBO(217, 208, 222, 1),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.flip_outlined),
                  label: 'Scan',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  label: 'Account',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.black,
              unselectedItemColor: Color.fromARGB(255, 223, 78, 78),
              onTap: _onItemTapped,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
            ),
          ),
        ),
      ),
    );
  }
}
