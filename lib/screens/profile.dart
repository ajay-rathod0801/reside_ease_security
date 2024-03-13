import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 130,
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person,
                  size: 130,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.edit_square,
                  color: Theme.of(context).colorScheme.primary,
                ),
                label: const Text('Edit Profile'),
              ),
              const SizedBox(height: 12),
              Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '+91 9876543210',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const Spacer(),
              Container(
                width: double.infinity,
                child: FilledButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.error,
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.logout_outlined),
                  label: const Text('Logout'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
