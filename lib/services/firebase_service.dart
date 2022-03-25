import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final firestore = FirebaseFirestore.instance;
final mAuth = FirebaseAuth.instance;
final drugsCollection = firestore.collection('Drugs');
final cartCollection = firestore.collection('Cart-Items');
