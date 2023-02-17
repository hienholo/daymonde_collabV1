import 'package:flutter/material.dart';
class ProduitInvisibleScreen extends StatefulWidget {
  const ProduitInvisibleScreen({super.key});

  @override
  State<ProduitInvisibleScreen> createState() => _ProduitInvisibleScreenState();
}

class _ProduitInvisibleScreenState extends State<ProduitInvisibleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produit invisible'),
      ),
    );
  }
}