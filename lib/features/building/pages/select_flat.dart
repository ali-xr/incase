import 'package:Incase/features/building/pages/panorama_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Incase/features/common/widgets/navigation.dart';
import 'package:Incase/features/common/widgets/w_button.dart';

const double _kItemExtent = 32.0;
const List<String> _floor = <String>[
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
  '11',
  '12',
  '13',
  '14',
  '15',
];

class SelectFlat extends StatefulWidget {
  const SelectFlat({super.key});

  @override
  State<SelectFlat> createState() => _SelectFlatState();
}

class _SelectFlatState extends State<SelectFlat> {
  int _selectedFloor = 0;
  int _selectedRoom = 0;

  // This shows a CupertinoModalPopup with a reasonable fixed height which hosts CupertinoPicker.
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 0,
        title: Center(
          child: Text(
            'NEST ONE',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 14),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: NetworkImage(
                          'https://nestone.uz/img/apartments-gallery/gallery-block-1/4.jpg'),
                      fit: BoxFit.cover)),
            ),
            Text(
              'Select a building you like',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 29),
            DefaultTextStyle(
              style: TextStyle(
                color: CupertinoColors.label.resolveFrom(context),
                fontSize: 22.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 70,
                    child: Text(
                      'Floor',
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => _showDialog(
                            CupertinoPicker(
                              magnification: 1.22,
                              squeeze: 1.2,
                              useMagnifier: true,
                              itemExtent: _kItemExtent,
                              scrollController: FixedExtentScrollController(
                                initialItem: _selectedFloor,
                              ),
                              onSelectedItemChanged: (int selectedItem) {
                                setState(() {
                                  _selectedFloor = selectedItem;
                                });
                              },
                              children: List<Widget>.generate(_floor.length,
                                  (int index) {
                                return Center(
                                    child: Text(
                                  _floor[index],
                                  style: Theme.of(context).textTheme.titleLarge,
                                ));
                              }),
                            ),
                          ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: const Color.fromRGBO(15, 15, 15, 0.50)),
                        child: Text(
                          _floor[_selectedFloor],
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                      )),
                ],
              ),
            ),
            DefaultTextStyle(
              style: TextStyle(
                color: CupertinoColors.label.resolveFrom(context),
                fontSize: 22.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 70,
                    child: Text(
                      'Room',
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => _showDialog(
                            CupertinoPicker(
                              magnification: 1.22,
                              squeeze: 1.2,
                              useMagnifier: true,
                              itemExtent: _kItemExtent,
                              scrollController: FixedExtentScrollController(
                                initialItem: _selectedRoom,
                              ),
                              onSelectedItemChanged: (int selectedItem) {
                                setState(() {
                                  _selectedRoom = selectedItem;
                                });
                              },
                              children: List<Widget>.generate(_floor.length,
                                  (int index) {
                                return Center(
                                    child: Text(
                                  _floor[index],
                                  style: Theme.of(context).textTheme.titleLarge,
                                ));
                              }),
                            ),
                          ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: const Color.fromRGBO(15, 15, 15, 0.50)),
                        child: Text(
                          _floor[_selectedRoom],
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                      )),
                ],
              ),
            ),
            // const CupertinoPickerExample(text: 'Room'),
            const SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 20),
              child: Text(
                'Let`s take a look at apartment ${_floor[_selectedFloor]}, floor ${_floor[_selectedRoom]}',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: WButton(
        color: const Color.fromRGBO(15, 15, 15, 0.50),
        margin: EdgeInsets.only(
            left: 33,
            right: 33,
            bottom: MediaQuery.of(context).padding.bottom + 16),
        onTap: () {
          Navigator.push(
            context,
            fade(
              page: const PanoramaScreen(title: 'hello',),
              // page: LookApartment(
              //   title:
              //       'Floor ${_floor[_selectedFloor]}, Room № ${_floor[_selectedRoom]}',
              // ),
            ),
          );
        },
        text: 'Explore the Apartment',
        textStyle: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(fontWeight: FontWeight.w700, letterSpacing: 0),
      ),
    );
  }
}
