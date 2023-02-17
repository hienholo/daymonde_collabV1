import 'package:flutter/material.dart';

class PopupWidget extends StatefulWidget {
  const PopupWidget({Key? key}) : super(key: key);

  @override
  _PopupWidgetState createState() => _PopupWidgetState();
}

enum menuitem { item1, item2,  }

class _PopupWidgetState extends State<PopupWidget> {
  menuitem? _mitem = menuitem.item1;
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Column(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.only(bottom:size.height*0.64),
            child: Dialog(
              backgroundColor: Colors.grey[200],
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[ 

                  ListTile(
                    title: const Text('COMPTE VENDEUR '),
                    trailing: Radio<menuitem>(
                      value: menuitem.item1,
                      activeColor: Colors.orange,
                      groupValue: _mitem,
                      onChanged: (menuitem? value) {
                        setState(() {
                          _mitem = value;
                          Navigator.pop(context);
                        });
                      },
                    ),
                  ),
                
                  ListTile(
                    title: const Text('COMPTE FOURNISSEUR '),
                    trailing: Radio<menuitem>(
                      activeColor: Colors.orange,
                      value: menuitem.item2,
                      groupValue: _mitem,
                      onChanged: (menuitem? value) {
                        setState(() {
                          _mitem = value;
                          Navigator.pop(context);
                        });
                      },
                    ),
                  ),
                
                   ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}