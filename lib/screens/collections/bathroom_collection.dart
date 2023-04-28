import 'package:flutter/material.dart';
import 'package:mynewapp/models/furniture_model.dart';
import 'package:mynewapp/screens/collections/kitchen_collection.dart';
import 'package:mynewapp/models/furniture_details.dart';
import 'package:mynewapp/screens/home_page.dart';

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
