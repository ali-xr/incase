import 'dart:io';
import 'package:Incase/assats/colors/colors.dart';
import 'package:Incase/assats/constants/icons.dart';
import 'package:Incase/features/building/widgets/panorama.dart';
import 'package:Incase/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class PanoramaScreen extends StatefulWidget {
  const PanoramaScreen({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<PanoramaScreen> createState() => _PanoramaScreenState();
}

class _PanoramaScreenState extends State<PanoramaScreen> {
  double _lon = 0;
  double _lat = 0;
  double _tilt = 0;
  int _panoId = 0;
  List<Image> panoImages = [
    Image.asset('assets/360_rooms/black_bed.jpeg'),
    Image.asset('assets/360_rooms/libruary.jpeg'),
  ];
  ImagePicker picker = ImagePicker();

  void onViewChanged(longitude, latitude, tilt) {
    setState(() {
      _lon = longitude;
      _lat = latitude;
      _tilt = tilt;
    });
  }

  Widget hotspotButton(
      {String? text, IconData? icon, VoidCallback? onPressed}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(const CircleBorder()),
            backgroundColor: MaterialStateProperty.all(Colors.black38),
            foregroundColor: MaterialStateProperty.all(white),
          ),
          onPressed: onPressed,
          child: Icon(icon),
        ),
        text != null
            ? Container(
                padding: const EdgeInsets.all(4.0),
                decoration: const BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Center(child: Text(text)),
              )
            : Container(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget panorama;
    switch (_panoId % panoImages.length) {
      case 0:
        panorama = Panorama(
          animSpeed: 1.0,
          sensorControl: SensorControl.Orientation,
          onViewChanged: onViewChanged,
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          onLongPressStart: (longitude, latitude, tilt) =>
              print('onLongPressStart: $longitude, $latitude, $tilt'),
          onLongPressMoveUpdate: (longitude, latitude, tilt) =>
              print('onLongPressMoveUpdate: $longitude, $latitude, $tilt'),
          onLongPressEnd: (longitude, latitude, tilt) =>
              print('onLongPressEnd: $longitude, $latitude, $tilt'),
          hotspots: [
            Hotspot(
              latitude: -15.0,
              longitude: -129.0,
              width: 90,
              height: 75,
              widget: hotspotButton(
                  text: "Next scene",
                  icon: Icons.open_in_browser,
                  onPressed: () => setState(() => _panoId++)),
            ),
            Hotspot(
              latitude: -42.0,
              longitude: -46.0,
              width: 60.0,
              height: 60.0,
              widget: hotspotButton(
                  icon: Icons.search,
                  onPressed: () => setState(() => _panoId = 2)),
            ),
            Hotspot(
              latitude: -33.0,
              longitude: 123.0,
              width: 60.0,
              height: 60.0,
              widget: hotspotButton(
                  icon: Icons.arrow_upward,
                  onPressed: () {
                    print('other room tapped');
                  }),
            ),
          ],
          child: Image.asset('assets/360_rooms/black_bed.jpeg'),
        );
        break;
      case 2:
        panorama = Panorama(
          animSpeed: 1.0,
          sensorControl: SensorControl.Orientation,
          onViewChanged: onViewChanged,
          croppedArea: const Rect.fromLTWH(2533.0, 1265.0, 5065.0, 2533.0),
          croppedFullWidth: 10132.0,
          croppedFullHeight: 5066.0,
          hotspots: [
            Hotspot(
              latitude: 0.0,
              longitude: -46.0,
              width: 90.0,
              height: 75.0,
              widget: hotspotButton(
                  text: "Next scene",
                  icon: Icons.double_arrow,
                  onPressed: () => setState(() => _panoId++)),
            ),
          ],
          child: Image.asset('assets/360_rooms/libruary.jpeg'),
        );
        break;
      default:
        panorama = Panorama(
          animSpeed: 1.0,
          sensorControl: SensorControl.Orientation,
          onViewChanged: onViewChanged,
          hotspots: [
            Hotspot(
              latitude: 0.0,
              longitude: 160.0,
              width: 90.0,
              height: 75.0,
              widget: hotspotButton(
                  text: "Next scene",
                  icon: Icons.double_arrow,
                  onPressed: () => setState(() => _panoId++)),
            ),
          ],
          child: panoImages[_panoId % panoImages.length],
        );
    }
    return Scaffold(
      body: Stack(
        children: [
          panorama,
          Text(
              '${_lon.toStringAsFixed(3)}, ${_lat.toStringAsFixed(3)}, ${_tilt.toStringAsFixed(3)}'),
          Positioned(
              top: 50,
              left: 20,
              child: WScaleAnimation(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: white.withOpacity(0.6),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(AppIcons.left),
                ),
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: white.withOpacity(0.6),
        mini: true,
        onPressed: () async {
          final pickedFile =
              await picker.pickImage(source: ImageSource.gallery);
          setState(() {
            if (pickedFile != null) {
              panoImages.add(Image.file(File(pickedFile.path)));
              _panoId = panoImages.length - 1;
            }
          });
        },
        child: const Icon(
          Icons.panorama,
          color: grey,
        ),
      ),
    );
  }
}
