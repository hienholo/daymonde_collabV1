// ignore_for_file: file_names
import 'package:flutter/material.dart';

class WalletAmbassadeurAppbar extends StatefulWidget {
  const WalletAmbassadeurAppbar({Key? key}) : super(key: key);

  @override
  State<WalletAmbassadeurAppbar> createState() => _WalletAmbassadeurAppbarState();
}

class _WalletAmbassadeurAppbarState extends State<WalletAmbassadeurAppbar> {
  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:30.0),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){}, icon: const Icon(Icons.wallet,color: Colors.black87,)),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.money,color: Colors.black87,)),
                ],
              ),
            ),
               Padding(
                 padding: const EdgeInsets.only(bottom: 40),
                 child: Center(
              child: RichText(text: const TextSpan(
                  children: [
                    TextSpan(text: '49 500', style: TextStyle(color: Colors.white,fontSize: 40)),
                    TextSpan(text: 'CFA',),
                  ]
              )),
            ),
               )
          ],
        ),
        const Divider(thickness:2 ,), ],
    );
  }
}