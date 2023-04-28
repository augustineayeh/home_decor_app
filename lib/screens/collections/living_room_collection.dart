import 'package:flutter/material.dart';
import 'package:mynewapp/models/furniture_model.dart';
import 'package:mynewapp/screens/collections/bedroom_collection.dart';
import 'package:mynewapp/screens/collections/kitchen_collection.dart';
import 'package:mynewapp/models/furniture_details.dart';

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
          padding: const EdgeInsets.all(5.0),
          child: Text(
            '\$${widget.furniture.price}',
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
