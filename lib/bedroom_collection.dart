import 'package:flutter/material.dart';
import 'package:mynewapp/furniture_details.dart';
import 'package:mynewapp/living_room_furniture.dart';
import 'package:mynewapp/main.dart';
import 'package:mynewapp/models/furniture_model.dart';

class BedroomFurniture extends StatefulWidget {
  const BedroomFurniture({super.key});

  @override
  State<BedroomFurniture> createState() => _BedroomFurnitureState();
}

class _BedroomFurnitureState extends State<BedroomFurniture> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BEDROOM"),
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
                MaterialPageRoute(builder: (context) => SignUpPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LivingRoomFurniture()),
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
          itemCount: bedroomFurniture.length,
          itemBuilder: (context, index) {
            final singleFurniture = bedroomFurniture[index];
            return BedroomFurnitureWidget(
              furniture: singleFurniture,
              index: index,
            );
          },
        ),
      ),
    );
  }
}

class BedroomFurnitureWidget extends StatefulWidget {
  final FurnitureModel furniture;
  final int index;
  const BedroomFurnitureWidget({
    super.key,
    required this.furniture,
    required this.index,
  });

  @override
  State<BedroomFurnitureWidget> createState() => _BedroomFurnitureWidgetState();
}

class _BedroomFurnitureWidgetState extends State<BedroomFurnitureWidget> {
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
              


//             Column(
//               children: [
//                 Flexible(
//                   child: Stack(
//                     children: [
//                       Container(
//                         width: 200,
//                         height: 200,
//                         decoration: const BoxDecoration(
//                           image: DecorationImage(
//                             image: NetworkImage(
//                               'https://images.unsplash.com/photo-1578898887932-dce23a595ad4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fGJlZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
//                             ),
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                       ),
                      
//                     ],
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$1670',
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
//                       'https://images.unsplash.com/photo-1617325247661-675ab4b64ae2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGJlZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$1730',
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
//                       'https://images.unsplash.com/photo-1588046130717-0eb0c9a3ba15?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzJ8fGJlZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$1530',
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
//                       'https://images.unsplash.com/photo-1587717541312-ca32fbb0bb3a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YmVkcm9vbSUyMG1pcnJvcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$430',
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
//                       'https://images.unsplash.com/photo-1615800002200-1f683abbf31e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YmVkcm9vbSUyMG1pcnJvcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$520',
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
//                       'https://images.unsplash.com/photo-1633945089460-5f0a309e10c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fGJlZHJvb20lMjBtaXJyb3J8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$380',
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
//                       'https://images.unsplash.com/photo-1633104069776-ea7e61258ec9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzB8fGJlZHJvb20lMjBtaXJyb3J8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$930',
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
//                       'https://media.istockphoto.com/id/1255939886/photo/modern-and-large-wardrobe-in-dressing-room.jpg?b=1&s=170667a&w=0&k=20&c=-Trgnh9ZH5_OPnwAPp-Fy9JECt3XpjXWrhmPjgiJkkw=',
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$1400',
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
//                       'https://media.istockphoto.com/id/1270977686/photo/luxury-bedroom-with-walk-in-closet.jpg?b=1&s=170667a&w=0&k=20&c=sMLHOkY-NnAaveUdNwqFafOHjPpx5PocfuFmxFtwBwM=',
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$1590',
//                     style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     )
//   }
// }
