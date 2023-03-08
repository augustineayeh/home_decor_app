import 'package:flutter/material.dart';
import 'package:mynewapp/furniture_details.dart';
import 'package:mynewapp/homepage_trial.dart';
import 'package:mynewapp/kitchen_furniture.dart';
import 'package:mynewapp/models/furniture_model.dart';

class BathroomCollection extends StatefulWidget {
  const BathroomCollection({super.key});

  @override
  State<BathroomCollection> createState() => _BathroomCollectionState();
}

class _BathroomCollectionState extends State<BathroomCollection> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BATHROOM"),
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
                    builder: (context) => const KitchenFurniture()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WelcomePage()),
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
          itemCount: bathroomCollection.length,
          itemBuilder: (context, index) {
            final singleFurniture = bathroomCollection[index];
            return BathroomCollectionWidget(
              furniture: singleFurniture,
              index: index,
            );
          },
        ),
      ),
    );
  }
}

class BathroomCollectionWidget extends StatefulWidget {
  final FurnitureModel furniture;
  final int index;
  const BathroomCollectionWidget({
    super.key,
    required this.furniture,
    required this.index,
  });

  @override
  State<BathroomCollectionWidget> createState() =>
      _BathroomCollectionWidgetState();
}

class _BathroomCollectionWidgetState extends State<BathroomCollectionWidget> {
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
//                           'https://images.unsplash.com/photo-1576698483491-8c43f0862543?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGJhdGhyb29tJTIwZGVjb3J8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
//                         ),
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$2400',
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
//                           'https://images.unsplash.com/photo-1564540583246-934409427776?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDV8fGJhdGhyb29tJTIwbWlycm9yfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
//                         ),
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$1800',
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
//                       'https://images.pexels.com/photos/6620704/pexels-photo-6620704.jpeg?auto=compress&cs=tinysrgb&w=800',
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$3100',
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
//                       'https://images.unsplash.com/photo-1561444326-63c9a8260f47?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjF8fGJhdGglMjB0dWJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$3400',
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
//                       'https://media.istockphoto.com/id/1370690408/photo/white-modern-bathroom-with-silver-fittings-with-large-sunny-windows-decorations-and-plants.jpg?b=1&s=170667a&w=0&k=20&c=l7fBI_STVchY92FODEfN6U-otW026Du9xaAVC8nMGzY=',
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$2300',
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
//                       'https://images.unsplash.com/photo-1623111771725-00e0f638198a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGJhdGglMjB0dWJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$2930',
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
//                       'https://media.istockphoto.com/id/1396585161/photo/wash-basin-in-interior-of-bathroom.jpg?b=1&s=170667a&w=0&k=20&c=lMnIEKkrHxayp3tue63w_7iOXyXmvZnsowXRTYiR5dg=',
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$1320',
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
//                       'https://images.unsplash.com/photo-1595428774862-a79ab68dbabb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGJhdGhyb29tJTIwc2lua3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$1620',
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
//                       'https://images.unsplash.com/photo-1594761047926-f0bdbadae552?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTN8fGJhdGhyb29tJTIwc2lua3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(1.0),
//                   child: const Text(
//                     '\$2280',
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
//                       'https://images.unsplash.com/photo-1595514535116-d0401260e7cf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YmF0aHJvb20lMjBzaW5rfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
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
//     );
//   }
// }
