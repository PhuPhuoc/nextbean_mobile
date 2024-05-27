import 'package:flutter/material.dart';
import 'login.dart';

class UserInformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dữ liệu giả
    final String avatarUrl = 'https://via.placeholder.com/150';
    final String userName = 'Tran Phu Phuoc';
    final String userEmail = 'blessforwork@gmail.com';

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/avatar_default.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              userName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              userEmail,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
