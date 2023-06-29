import 'package:fit_fraternity_of_information_technology/constants.dart';
import 'package:fit_fraternity_of_information_technology/page/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
// import '../screens/sign_in/otp_screen.dart';

class ImageGalleryPage extends StatelessWidget {
  const ImageGalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  automaticallyImplyLeading: false,
                  // centerTitle: true,
                  title: Text(
                    textAlign: TextAlign.left,
                    'Image Gallery',
                    style: textStyle.copyWith(fontSize: 20),
                  ),
                ),
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                  ),
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
              ],
            ),
          ),
          Positioned(
            bottom: 70.0,
            right: 16.0,
            child: FloatingActionButton(
              onPressed: () {
                // Perform an action when the FAB is pressed
              },
              child: Icon(Icons.add_a_photo),
            ),
          ),
        ],
      ),
    );
  }
}








// class ImageGalleryPage extends StatelessWidget {
//   const ImageGalleryPage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         CustomScrollView(
//           physics: const NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           slivers: <Widget>[
//             SliverToBoxAdapter(
//               child: Container(
//                 height: 50.0,
//                 width: double.infinity,
//                 color: Colors.yellow,
//                 child: const Center(
//                   child: Text(
//                     'Image Gallery',
//                   ),
//                 ),
//               ),
//             ),
//             SliverGrid(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   childAspectRatio: 1.0,
//                   mainAxisSpacing: 10.0,
//                   crossAxisSpacing: 10.0),
//               delegate: SliverChildBuilderDelegate(
//                 (context, index) {
//                   return InstaImageViewer(
//                     // disableSwipeToDismiss: true,
//                     child: Image.asset(
//                       'assets/img_gallery/${index + 1}.jpg',
//                       fit: BoxFit.cover,
//                     ),
//                   );
//                 },
//                 childCount: 36,
//               ),
//             ),
//             const SliverPadding(
//               padding: EdgeInsets.only(bottom: 80.0),
//             )
//           ],
//         ),
//         Positioned(
//           bottom: 16.0,
//           right: 16.0,
//           child: FloatingActionButton(
//             onPressed: () {
//               // Perform an action when the FAB is pressed
//             },
//             child: Icon(Icons.add_a_photo),
//           ),
//         ),
//       ],
//     );
//   }
// }
