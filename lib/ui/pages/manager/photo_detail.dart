import 'package:flutter/material.dart';

class CXImageDetailPage extends StatelessWidget {
  final String _imageUrl;

  CXImageDetailPage(this._imageUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
            child: Hero(
              tag: _imageUrl, child: Image.network(_imageUrl,fit: BoxFit.fitHeight,)
            )
        ),
      ),
    );
  }
}
