import 'package:flutter/material.dart';
import 'home.dart';
import 'scan.dart';
import 'package:camera/camera.dart';

class AccountPage extends StatefulWidget {
    final List<CameraDescription> cameras;

    AccountPage({required this.cameras});

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int _selectedIndex = 2;

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    _pages = [
    HomePage(cameras: widget.cameras),
      ScanPage(cameras: widget.cameras),
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header Section
            ListTile(
              leading: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    "https://via.placeholder.com/150"), // User image
              ),
              title: Text(
                "Brandon",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat",
                    fontSize: 20),
              ),
              subtitle: Text("@email"),
              trailing: IconButton(
                onPressed: () {
                  // change avatar
                },
                icon: Icon(
                  Icons.edit,
                  color: Colors.grey,
                ),
              ),
            ),

            const Divider(),

            /// Account Settings Section
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Account Settings",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text("Edit Profile"),
                    subtitle: const Text("Name, Email"),
                    onTap: () {
                      // Navigate to Edit Profile Page
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.language),
                    title: const Text("Change Language"),
                    subtitle: const Text("Select your preferred language"),
                    onTap: () {
                      // Open Language Selection
                    },
                  ),
                ],
              ),
            ),

            const Divider(),

            /// Preferences Section
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Preferences",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: const Icon(Icons.location_on),
                    title: const Text("Shopping Location"),
                    subtitle: const Text("Update preferred shopping location"),
                    onTap: () {
                      // Open Shopping Location Page
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.camera_alt),
                    title: const Text("Allow Camera Access"),
                    subtitle: const Text("Manage camera permissions"),
                    onTap: () {
                      // Manage camera access
                    },
                  ),
                ],
              ),
            ),

            const Divider(),

            /// Security Section
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Security",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: const Icon(Icons.lock),
                    title: const Text("Change Password"),
                    subtitle: const Text("Update your account password"),
                    onTap: () {
                      // Navigate to Change Password
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text("Logout"),
                    subtitle: const Text("Sign out of your account"),
                    onTap: () {
                      // Sign out of account
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.delete_forever),
                    title: const Text("Delete Account",
                        style: TextStyle(color: Colors.red)),
                    subtitle: const Text("Permanently delete your account"),
                    onTap: () {
                      // Confirm Account Deletion
                    },
                  ),
                ],
              ),
            ),

            const Divider(),

            /// Support & Feedback Section
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Support & Feedback",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: const Icon(Icons.bug_report),
                    title: const Text("Report Bugs and Issues"),
                    onTap: () {
                      // Open Bug Reporting Page
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.star),
                    title: const Text("Rate the App"),
                    onTap: () {
                      // Navigate to Rating Page
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.share),
                    title: const Text("Share the App"),
                    onTap: () {
                      // Trigger App Sharing
                    },
                  ),
                ],
              ),
            ),

            const Divider(),

            /// Logout Section
            Padding(
              padding: const EdgeInsets.all(15),
              child: ListTile(
                leading: const Icon(Icons.logout),
                title: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {
                  // Trigger Logout
                },
              ),
            ),
          ],
        ),
      )
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String _getTitleForPage(int index) {
    const titles = ["Hello User", "Scan", "Account"];
    return titles[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
