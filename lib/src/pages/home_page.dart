import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/electronics_bloc/electronics_bloc_bloc.dart';
import '../blocs/jewelery_bloc/jewelery_bloc_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                  Column(
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
                      BlocBuilder(
                        bloc: BlocProvider.of<JeweleryBloc>(context),
                        builder: (context, state) {
                          if (state is JeweleryBlocInitialState) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is JeweleryBlocLoadedState) {
                            return getUI(
                                size: size, uiData: state.jeweleryData);
                          } else {
                            return const Center(
                              child: Text('Something went wrong'),
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'Electronics',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                      ),
                      BlocBuilder(
                        bloc: BlocProvider.of<ElectronicsBloc>(context),
                        builder: (context, state) {
                          if (state is ElectronicsBlocInitialState) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is ElectronicsBlocLoadedState) {
                            return getUI(
                                size: size,
                                uiData: state.electronicsData,
                                scrollDirection: Axis.vertical);
                          } else {
                            return const Center(
                              child: Text('Something went wrong'),
                            );
                          }
                        },
                      ),
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
