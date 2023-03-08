import 'package:flutter/material.dart';
import 'package:mynewapp/bathroom_collection.dart';
import 'package:mynewapp/furniture_details.dart';
import 'package:mynewapp/living_room_furniture.dart';
import 'package:mynewapp/models/furniture_model.dart';

class KitchenFurniture extends StatefulWidget {
  const KitchenFurniture({super.key});

  @override
  State<KitchenFurniture> createState() => _KitchenFurnitureState();
}

class _KitchenFurnitureState extends State<KitchenFurniture> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("KITCHEN"),
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
                    builder: (context) => const LivingRoomFurniture()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const BathroomCollection()),
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
          itemCount: kitchenFurniture.length,
          itemBuilder: (context, index) {
            final singleFurniture = kitchenFurniture[index];
            return KitchenFurnitureWidget(
              furniture: singleFurniture,
              index: index,
            );
          },
        ),
      ),
    );
  }
}

class KitchenFurnitureWidget extends StatefulWidget {
  final FurnitureModel furniture;
  final int index;
  const KitchenFurnitureWidget({
    super.key,
    required this.furniture,
    required this.index,
  });

  @override
  State<KitchenFurnitureWidget> createState() => _KitchenFurnitureWidgetState();
}

class _KitchenFurnitureWidgetState extends State<KitchenFurnitureWidget> {
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
              



// class KitchenFurniture extends StatelessWidget {
//   const KitchenFurniture({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("KITCHEN"),
//         backgroundColor: Colors.black,
//         leading: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             IconButton(
//               icon: const Icon(Icons.menu),
//               onPressed: () {},
//             ),
//           ],
//         ),
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(Icons.search),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: const Icon(Icons.chevron_left),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => const LivingRoomFurniture()),
//               );
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.navigate_next),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => const BathroomCollection()),
//               );
//             },
//           ),
//         ],
//       ),
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
//                           'https://images.unsplash.com/photo-1559554704-0f74b35a8718?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGtpdGNoZW4lMjBmdXJuaXR1cmV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
//                         ),
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$4400',
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
//                           'https://media.istockphoto.com/id/1360324668/photo/modern-home-kitchen-interior-design-in-white-tones.jpg?b=1&s=170667a&w=0&k=20&c=n0u8be3dZSxdRa3bXmBSOZA4FgkVeCccZJ4jbM3qiCk=',
//                         ),
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$5200',
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
//                       'https://images.unsplash.com/photo-1600122272511-c85c3a0209f9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8a2l0Y2hlbiUyMGNhYmluZXR8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60s',
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$4000',
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
//                       'https://media.istockphoto.com/id/135120292/photo/interior-of-a-beautiful-custom-kitchen.jpg?b=1&s=170667a&w=0&k=20&c=kYu0cuDrKRN4aOPY97QuBXd5QlX1Ny0a28p3LeRfLhU=',
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$6300',
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
//                       'https://images.pexels.com/photos/3741316/pexels-photo-3741316.jpeg?auto=compress&cs=tinysrgb&w=800',
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$5320',
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
//                       'https://images.pexels.com/photos/7195739/pexels-photo-7195739.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$5620',
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
//                       'https://thumbs.dreamstime.com/b/dining-table-21396984.jpg',
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$6280',
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
//                       'https://m.media-amazon.com/images/I/81ECn07pa2L._AC_SL1500_.jpg',
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$3930',
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
//                       'https://www.ubuy.com.gh/productimg/?image=aHR0cHM6Ly9tLm1lZGlhLWFtYXpvbi5jb20vaW1hZ2VzL0kvNTE5a1FTM2xoVUwuX1NTNDAwXy5qcGc.jpg',
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$6400',
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
//                       'https://www.ikea.com/images/a-traditional-style-dining-room-with-a-white-ingatorp-table--f69fb8f1d35b962c599659b20f7b9d4e.jpg?f=s',
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$7590',
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
