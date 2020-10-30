import 'package:flutter/material.dart';
import 'package:flutter_face/ui/pages/main/leading_btn.dart';
import 'package:flutter_face/ui/pages/manager/photo_detail.dart';

class OPManagerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("管理"),
        leading: OpenLeading(),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          childAspectRatio: 16/9,
          mainAxisSpacing: 8
        ),
        children: List.generate(100, (index){
          final url = "https://picsum.photos/400/600?random=$index}.webp";
          return GestureDetector(
            onTap: (){
              Navigator.of(context).push(PageRouteBuilder(
                pageBuilder:(ctx,anim1,animi2){
                  return FadeTransition(opacity: anim1,child: CXImageDetailPage(url),);
                }
              ));
            },
              child: Hero(
                tag: url,
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                  frameBuilder: (BuildContext context, Widget child, int frame,
                      bool wasSynchronouslyLoaded){
                    if (wasSynchronouslyLoaded){
                      return child;
                    } else{
                      return AnimatedOpacity(
                        child: child,
                        opacity: frame == null ? 0 : 1,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeOut,
                      );
                    }
                  },
                ),
              )
          );
        }),
      ),
    );
  }
}