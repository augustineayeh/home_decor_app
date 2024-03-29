import 'package:flutter/material.dart';
import 'package:mynewapp/models/furniture_model.dart';
import 'package:mynewapp/screens/extras/cart.dart';

class FurnitureDetails extends StatelessWidget {
  final FurnitureModel furnitureModel;
  final int index;
  const FurnitureDetails({
    super.key,
    required this.furnitureModel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Hero(
                      tag: index,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(furnitureModel.imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 35.0,
                  ),
                  child: InkWell(
                    onTap: (() {
                      Navigator.pop(context);
                    }),
                    child: const Icon(
                      Icons.chevron_left,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 15,
                  left: 25,
                  right: 25,
                ),
                child: Text(
                  'Cozy up in this plush, oversized bed - perfect for lazy Sunday mornings and late-night reading sessions.',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Price:',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '\$573',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Quantity:',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 120,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {},
                        ),
                        const Text(
                          "1",
                          style: TextStyle(fontSize: 20),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    left: 25,
                    right: 25,
                  ),
                  child: Text(
                    'Sizes:',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 25,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            '  S  ',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            '  M  ',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            '  L  ',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            '  XL  ',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                  ),
                  child: Container(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        'assets/images/shopping-cart-2.png',
                        height: 40,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                  ),
                  child: SizedBox(
                    height: 40,
                    width: 210,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyCart()),
                        );
                      },
                      child: const Text(
                        'View your cart',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '   Shop similar items:',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: SizedBox(
                height: 150,
                width: double.infinity,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Image.network(
                          'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YmVkfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
                          width: 150.0,
                          height: 200.0,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Image.network(
                          'https://images.unsplash.com/photo-1617325247661-675ab4b64ae2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGJlZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
                          width: 150.0,
                          height: 100.0,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Image.network(
                          'https://images.unsplash.com/photo-1493663284031-b7e3aefcae8e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bGl2aW5ncm9vbSUyMGZ1cm5pdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
                          width: 150.0,
                          height: 100.0,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Image.network(
                          'https://images.unsplash.com/photo-1493663284031-b7e3aefcae8e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bGl2aW5ncm9vbSUyMGZ1cm5pdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
                          width: 100.0,
                          height: 100.0,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Image.network(
                          'https://images.unsplash.com/photo-1493663284031-b7e3aefcae8e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bGl2aW5ncm9vbSUyMGZ1cm5pdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
                          width: 100.0,
                          height: 100.0,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Image.network(
                          'https://images.unsplash.com/photo-1493663284031-b7e3aefcae8e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bGl2aW5ncm9vbSUyMGZ1cm5pdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
                          width: 100.0,
                          height: 100.0,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Image.network(
                          'https://images.unsplash.com/photo-1493663284031-b7e3aefcae8e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bGl2aW5ncm9vbSUyMGZ1cm5pdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
                          width: 100.0,
                          height: 100.0,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
