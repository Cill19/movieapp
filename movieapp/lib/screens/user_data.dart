import 'package:flutter/material.dart';

class UserDataScreen extends StatelessWidget {
  final List<User> users = [
    User(
        name: 'Alice Johnson',
        email: 'alice@example.com',
        loginDate: '28.05.2024'),
    User(name: 'Bob Smith', email: 'bob@example.com', loginDate: '27.05.2024'),
    User(
        name: 'Charlie Brown',
        email: 'charlie@example.com',
        loginDate: '26.05.2024'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1A1A1A),
        elevation: 0,
        title: Text(
          'User Data',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return userCard(users[index]);
          },
        ),
      ),
    );
  }

  Widget userCard(User user) {
    return Card(
      color: Color(0xFF2C2C2C),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, color: Colors.white, size: 30),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    user.email,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Login Date',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Text(
                  user.loginDate,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class User {
  final String name;
  final String email;
  final String loginDate;

  User({required this.name, required this.email, required this.loginDate});
}
