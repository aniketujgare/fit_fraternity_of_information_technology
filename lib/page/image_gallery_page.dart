import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

// final List<String> images = [
//   "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg",
//   "https://cdn.pixabay.com/photo/2016/05/05/02/37/sunset-1373171_960_720.jpg",
//   "https://cdn.pixabay.com/photo/2017/02/01/22/02/mountain-landscape-2031539_960_720.jpg",
//   "https://cdn.pixabay.com/photo/2014/09/14/18/04/dandelion-445228_960_720.jpg",
//   "https://cdn.pixabay.com/photo/2016/08/09/21/54/yellowstone-national-park-1581879_960_720.jpg",
//   "https://cdn.pixabay.com/photo/2016/07/11/15/43/pretty-woman-1509956_960_720.jpg",
//   "https://cdn.pixabay.com/photo/2016/02/13/12/26/aurora-1197753_960_720.jpg",
//   "https://cdn.pixabay.com/photo/2016/11/08/05/26/woman-1807533_960_720.jpg",
//   "https://cdn.pixabay.com/photo/2013/11/28/10/03/autumn-219972_960_720.jpg",
//   "https://cdn.pixabay.com/photo/2017/12/17/19/08/away-3024773_960_720.jpg",
// ];

class ImageGalleryPage extends StatelessWidget {
  const ImageGalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Container(
            height: 50.0,
            width: double.infinity,
            color: Colors.yellow,
            child: const Center(
              child: Text(
                'Image Gallery',
              ),
            ),
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return InstaImageViewer(
                disableSwipeToDismiss: true,
                child: Image.asset(
                  'assets/img_gallery/${index + 1}.jpg',
                  fit: BoxFit.cover,
                ),
              );
            },
            childCount: 36,
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.only(bottom: 80.0),
        )
      ],
    );
  }
}
