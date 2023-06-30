import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Incase/assats/colors/colors.dart';
import 'package:Incase/assats/constants/icons.dart';
import 'package:Incase/features/common/widgets/panorama_single.dart';

class LookApartment extends StatefulWidget {
  final String title;

  const LookApartment({super.key, required this.title});

  @override
  State<LookApartment> createState() => _LookApartmentState();
}

class _LookApartmentState extends State<LookApartment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  AppIcons.left,
                ),
              ),
            ),
            Text(
              widget.title,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const Column(
              children: [
                SizedBox(
                  height: 600,
                  child: WebViewExample(),
                ),

              ],
            ),
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  height: 100,
                  color: white,
                  child: Text(
                    'Move around using navigation to explore the apartment',
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                )),

            const SizedBox(height: 16),

            // Padding(
            //   padding: EdgeInsets.only(
            //       top: 32,
            //       bottom: MediaQuery.of(context).padding.bottom + 16),
            //   child: Column(
            //     children: [
            //       WScaleAnimation(
            //           onTap: () {}, child: SvgPicture.asset(AppIcons.gameUp)),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           WScaleAnimation(
            //               onTap: () {},
            //               child: SvgPicture.asset(AppIcons.gameLeft)),
            //           WScaleAnimation(
            //             onTap: () {},
            //             child: Padding(
            //               padding: const EdgeInsets.all(16),
            //               child: SvgPicture.asset(AppIcons.gameRefresh),
            //             ),
            //           ),
            //           WScaleAnimation(
            //               onTap: () {},
            //               child: SvgPicture.asset(AppIcons.gameRight)),
            //         ],
            //       ),
            //       WScaleAnimation(
            //           onTap: () {
            //             Navigator.push(context, fade(page: const WebViewExample()));
            //           },
            //           child: SvgPicture.asset(AppIcons.gameDown)),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
