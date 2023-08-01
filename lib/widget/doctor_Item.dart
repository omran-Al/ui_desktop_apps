import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_desktop/responsive.dart';

import '../constants.dart';

class DoctorItem extends StatefulWidget {
  final name;
  final description;
  final imageId;
  final phone;
  final email;

  DoctorItem(
      {super.key,
      required this.name,
      required this.description,
      required this.imageId,
      required this.phone,
      required this.email});

  @override
  State<DoctorItem> createState() => _DoctorItemState();
}

class _DoctorItemState extends State<DoctorItem> {
  late var _size;
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(defaultPadding - 3),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Icon(Icons.more_vert, color: Color.fromARGB(255, 8, 8, 8))
            ],
          ),
          Center(
              child: CircleAvatar(
            radius: Responsive.isMobile(context)
                ? 30
                : Responsive.isTablet(context)
                    ? 40
                    : 45,
            backgroundImage: AssetImage(widget.imageId),
          )),
          Text(
            "${widget.name}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (!Responsive.isMobile(context))
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.description}",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Color.fromARGB(179, 160, 159, 159)),
                  overflow: TextOverflow.ellipsis,
                ),
                if (_size.width > 1000)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: _size.width > 700 ? 10 : 20,
                          child: Icon(
                            Icons.phone,
                            size: _size.width > 700 ? 10 : 15,
                            color: Colors.white,
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: _size.width > 700 ? 10 : 20,
                          child: Icon(
                            Icons.email,
                            size: _size.width > 700 ? 10 : 15,
                            color: Colors.white,
                          )),
                    ],
                  )
              ],
            ),
          if (_size.width < 1000)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: ((_size.width > 700))
                        ? 10
                        : ((_size.width > 460) && (_size.width < 500))
                            ? 10
                            : 20,
                    child: Icon(
                      Icons.phone,
                      size: _size.width > 700 ? 10 : 15,
                      color: Colors.white,
                    )),
                const SizedBox(
                  width: 15,
                ),
                InkWell(
                  onTap: () {
                    print(_size.width);
                  },
                  child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: (_size.width > 700)
                          ? 10
                          : ((_size.width > 460) && (_size.width < 500))
                              ? 10
                              : 20,
                      child: Icon(
                        Icons.email,
                        size: _size.width > 700 ? 10 : 15,
                        color: Colors.white,
                      )),
                ),
              ],
            )
        ],
      ),
    );
  }
}
