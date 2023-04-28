import 'package:flutter/material.dart';
import 'package:mynewapp/main.dart';
import 'package:mynewapp/models/furniture_details.dart';
import 'package:mynewapp/models/furniture_model.dart';
import 'package:mynewapp/screens/collections/living_room_collection.dart';

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
                MaterialPageRoute(builder: (context) => const SignUpPage()),
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
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '\$${widget.furniture.price}',
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
          ),
        ),
      ],
    );
  }
}
