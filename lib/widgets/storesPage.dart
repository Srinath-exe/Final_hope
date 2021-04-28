import 'package:flutter/material.dart';
import 'package:hope/widgets/storeCard.dart';

import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class Stores extends StatefulWidget {
  @override
  _StoresState createState() => _StoresState();
}

class _StoresState extends State<Stores> {
  List<String> cityList = ['Dar es Salaam','Mwanza','Arusha','Dodoma'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text('Stores', style: TextStyle(color: Colors.black))),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: FloatingSearchBar(
        transitionCurve: Curves.easeInOutCubic,
        transition: CircularFloatingSearchBarTransition(),
        physics: const BouncingScrollPhysics(),
        builder: (context, _) => buildBody(),
        body: Container(
            height: 100,
            width: 100,
            child: SingleChildScrollView(
              child: Container(
                  child: Center(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                        StoreCard(
                            city: 'Dar es Salaam',
                            address:
                                'POBOX- 9642, Bongoyo Road, \nOysterbay,Dar Es Salaam, \nTanzania, Eastern Africa.'),
                        StoreCard(
                            city: 'Mwanza',
                            address:
                                'POBOX- 9642, Bongoyo Road, \nOysterbay,Dar Es Salaam, \nTanzania, Eastern Africa.'),
                        StoreCard(
                            city: 'Mwanza',
                            address:
                                'POBOX- 9642, Bongoyo Road, \nOysterbay,Dar Es Salaam, \nTanzania, Eastern Africa.'),
                        StoreCard(
                            city: 'Dar es Salaam',
                            address:
                                'POBOX- 9642, Bongoyo Road, \nOysterbay,Dar Es Salaam, \nTanzania, Eastern Africa.'),
                      ],
                    ),
                  ],
                ),
              )),
            )),
      ),
    );
  }

  Widget buildBody() {
    final time = DateTime.now();
    print('BuildBody at ${time.second}:${time.millisecond}');
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Material(
        child: Column(children: cityList.map((e){
            return Container(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(e,style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w600
                  ),),
                ],
              ),
            ));
        }).toList()  ),
      ),
    );
  }

  Widget buildFloatingSearchBar() {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      hint: 'Search City',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        // Call your model, bloc, controller here.
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.place),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.red,
            elevation: 4.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: Colors.accents.map((color) {
                return Container(height: 112, color: color);
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
