import 'package:flutter/material.dart';
import 'package:mynewapp/bedroom_collection.dart';
import 'package:mynewapp/furniture_details.dart';
import 'package:mynewapp/kitchen_furniture.dart';
import 'package:mynewapp/models/furniture_model.dart';

class LivingRoomFurniture extends StatefulWidget {
  const LivingRoomFurniture({super.key});

  @override
  State<LivingRoomFurniture> createState() => _LivingRoomFurnitureState();
}

class _LivingRoomFurnitureState extends State<LivingRoomFurniture> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LIVING ROOM"),
        backgroundColor: Colors.black,
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const BedroomFurniture()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const KitchenFurniture()),
              );
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemCount: livingRoomFurniture.length,
          itemBuilder: (context, index) {
            final singleFurniture = livingRoomFurniture[index];
            return LivingRoomFurnitureWidget(
              furniture: singleFurniture,
              index: index,
            );
          },
        ),
      ),
    );
  }
}

class LivingRoomFurnitureWidget extends StatefulWidget {
  final FurnitureModel furniture;
  final int index;
  const LivingRoomFurnitureWidget({
    super.key,
    required this.furniture,
    required this.index,
  });

  @override
  State<LivingRoomFurnitureWidget> createState() =>
      _LivingRoomFurnitureWidgetState();
}

class _LivingRoomFurnitureWidgetState extends State<LivingRoomFurnitureWidget> {
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Stack(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) {
                        return FurnitureDetails(
                          furnitureModel: widget.furniture,
                          index: widget.index,
                        );
                      }),
                    ),
                  );
                },
                child: Hero(
                  tag: widget.index,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          widget.furniture.imagePath,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    isFavourite = !isFavourite;
                  });
                },
                icon: Icon(
                  Icons.favorite,
                  color: isFavourite ? Colors.red : Colors.white,
                ),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(1.0),
          child: Text(
            '\$${widget.furniture.price}',
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
              
//       body: Container(
//         padding: const EdgeInsets.all(16),
//         child: GridView(
//           padding: const EdgeInsets.symmetric(horizontal: 5),
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
//           children: [
//             Column(
//               children: [
//                 Flexible(
//                   child: Container(
//                     width: 200,
//                     height: 200,
//                     decoration: const BoxDecoration(
//                       image: DecorationImage(
//                         image: NetworkImage(
//                           'https://images.unsplash.com/photo-1493663284031-b7e3aefcae8e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bGl2aW5ncm9vbSUyMGZ1cm5pdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
//                         ),
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$1480',
//                     style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               children: [
//                 Flexible(
//                   child: Container(
//                     width: 200,
//                     height: 200,
//                     decoration: const BoxDecoration(
//                       image: DecorationImage(
//                         image: NetworkImage(
//                           'https://images.unsplash.com/photo-1540574163026-643ea20ade25?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c29mYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
//                         ),
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$1250',
//                     style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               children: [
//                 Expanded(
//                   child: SizedBox(
//                     width: 200,
//                     height: 200,
//                     child: Image.network(
//                       'https://images.unsplash.com/photo-1484101403633-562f891dc89a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8c29mYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$2230',
//                     style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               children: [
//                 Expanded(
//                   child: SizedBox(
//                     width: 200,
//                     height: 200,
//                     child: Image.network(
//                       'https://images.unsplash.com/photo-1519961655809-34fa156820ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8c29mYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$840',
//                     style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               children: [
//                 Expanded(
//                   child: SizedBox(
//                     width: 200,
//                     height: 200,
//                     child: Image.network(
//                       'https://images.unsplash.com/photo-1662749061774-8da69c898e00?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzF8fGxpdmluZ3Jvb20lMjB0ZWxldml1c2lvbiUyMHN0YW5kc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$1220',
//                     style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               children: [
//                 Expanded(
//                   child: SizedBox(
//                     width: 200,
//                     height: 200,
//                     child: Image.network(
//                       'https://media.istockphoto.com/id/1364065150/photo/living-room-interior-with-brown-chest-of-drawers-stack-of-books-pink-flower-and-round-wicker.jpg?b=1&s=170667a&w=0&k=20&c=VEeJ19VZdOgDRnBCFRjEyXdJINvGdEARnHdOWa44fsw=',
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$1300',
//                     style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               children: [
//                 Expanded(
//                   child: SizedBox(
//                     width: 200,
//                     height: 200,
//                     child: Image.network(
//                       'https://images.unsplash.com/photo-1613136127325-0928da2821e5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjR8fHJvb20lMjBkcmF3ZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$1170',
//                     style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               children: [
//                 Expanded(
//                   child: SizedBox(
//                     width: 200,
//                     height: 200,
//                     child: Image.network(
//                       'https://images.unsplash.com/photo-1616810559347-257669714c79?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGxpdmluZyUyMHJvb20lMjB0YWJsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$1930',
//                     style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               children: [
//                 Expanded(
//                   child: SizedBox(
//                     width: 200,
//                     height: 200,
//                     child: Image.network(
//                       'https://images.unsplash.com/photo-1492371451031-f0830e91b3d9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGxpdmluZ3Jvb20lMjBmdXJuaXR1cmV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$1100',
//                     style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               children: [
//                 Expanded(
//                   child: SizedBox(
//                     width: 200,
//                     height: 200,
//                     child: Image.network(
//                       'https://images.unsplash.com/photo-1599918590084-28b4a8beda0f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjl8fGxpdmluZyUyMHJvb20lMjB0YWJsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$1390',
//                     style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
