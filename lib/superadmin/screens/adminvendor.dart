// import 'package:flutter/material.dart';

// class Adminvendor extends StatefulWidget {
//   const Adminvendor({super.key});

//   @override
//   State<Adminvendor> createState() => _AdminvendorState();
// }

// class _AdminvendorState extends State<Adminvendor> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spot/superadmin/navigationadmin.dart';

class AdminVendor extends StatefulWidget {
  const AdminVendor({super.key});

  @override
  State<AdminVendor> createState() => _AdminVendorState();
}

class _AdminVendorState extends State<AdminVendor> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  late Future<DocumentSnapshot> _userDataFuture;

  @override
  void initState() {
    super.initState();
    _userDataFuture = _fetchUserData();
  }

  Future<DocumentSnapshot> _fetchUserData() async {
    final currentUser = _firebaseAuth.currentUser;
    if (currentUser == null) {
      throw Exception('No user is signed in.');
    }

    // Fetch the shop registration data from Firestore
    return FirebaseFirestore.instance
        .collection('Store_reg')
        .doc(currentUser.uid)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vendor Home Page'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: _userDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text('No shop data available.'));
          }

          // Extract the shop data from Firestore document
          final shopData = snapshot.data!.data() as Map<String, dynamic>;

          // Display shop data
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage:
                      shopData['image'] != null && shopData['image'].isNotEmpty
                          ? NetworkImage(shopData['image'])
                          : null,
                  child: shopData['image'] == null
                      ? const Icon(Icons.store, size: 70)
                      : null,
                ),
                const SizedBox(height: 20),
                Text(
                  'Shop Name: ${shopData['name']}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text('Email: ${shopData['email']}'),
                const SizedBox(height: 10),
                Text('Phone: ${shopData['phone']}'),
                const SizedBox(height: 10),
                Text('Category: ${shopData['category']}'),
                const SizedBox(height: 10),
                Text('Description: ${shopData['Description']}'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BottomNavigationadmin(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    elevation: 5,
                  ),
                  child: const Text('Go to Bottom Navbar'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
