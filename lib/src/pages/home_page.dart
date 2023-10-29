import 'package:flutter/material.dart';

import '../models/products_model.dart';
import '../repositories/products_repo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  final ProductsRepo productsRepo = ProductsRepo();
  List<ProductsModel> electronicData = [];
  List<ProductsModel> jeweleryData = [];

  getJeweleryData() async {
    jeweleryData = await productsRepo.getJeweleries();
    getElectronicData();
  }

  getElectronicData() async {
    electronicData = await productsRepo.getElectronics();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getJeweleryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi Bloc App'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: size.width,
              child: Column(
                children: [
                  isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                'Jewellery',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w500),
                              ),
                            ),
                            getUI(size: size, uiData: jeweleryData),
                            const SizedBox(height: 10),
                            const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                'Electronics',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w500),
                              ),
                            ),
                            getUI(
                                size: size,
                                uiData: electronicData,
                                scrollDirection: Axis.vertical),
                          ],
                        ),
                ],
              ),
            )),
      ),
    );
  }

  Widget getUI(
      {required Size size,
      required uiData,
      Axis scrollDirection = Axis.horizontal}) {
    return SizedBox(
      height: scrollDirection == Axis.horizontal ? 200 : 390,
      child: ListView.builder(
        scrollDirection: scrollDirection,
        itemCount: uiData.length,
        itemBuilder: (context, index) => Card(
          surfaceTintColor: Colors.white,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.network(
                  uiData[index].image,
                  width: size.width / 3,
                  height: size.width / 3,
                ),
                const SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(uiData[index].title.substring(0, 20)),
                    Text("Price: \$${uiData[index].price.toStringAsFixed(2)}"),
                    Text('Category: ${uiData[index].category}'),
                    Text(
                        'Rating: ${uiData[index].rating.rate} (${uiData[index].rating.count})'),
                    InkWell(
                      onTap: () {
                        //
                        //
                      },
                      child: const Card(
                          child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.green,
                          ),
                          Text(
                            'Add to cart  ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
