import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_desktop/constants.dart';
import 'package:task_desktop/responsive.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({super.key});

  @override
  State<DoctorScreen> createState() => _MyDoctorScreen();
}

class _MyDoctorScreen extends State<DoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: defaultPadding / 2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (!Responsive.isMobile(context))
                  Text(
                    'Doctor',
                    style: GoogleFonts.poppins(fontSize: 25),
                  ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: !Responsive.isMobile(context)
                              ? defaultPadding
                              : defaultPadding / 2,
                          vertical: defaultPadding / 2),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey, strokeAlign: 0.6),
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Row(children: [
                        //  if (!Responsive.isMobile(context))
                        if (!Responsive.isMobile(context))
                          Text(
                            'Sort by',
                            style: TextStyle(
                                color: Colors.grey.withOpacity(0.6),
                                fontSize: 10),
                          ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'All Categories ',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        const Icon(Icons.arrow_drop_down)
                      ]),
                    ),
                    const SizedBox(
                      width: defaultPadding / 2,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(7),
                                  bottomLeft: Radius.circular(7)),
                              border: Border.all(
                                  color: Colors.grey, strokeAlign: 0.6)),
                          child: IconButton(
                            icon: const Icon(Icons.list),
                            onPressed: () {},
                          ),
                        ),
                        //  if (!Responsive.isMobile(context))
                        Container(
                            decoration: BoxDecoration(
                                color: const Color(0xff4fccc8),
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(7),
                                    bottomRight: Radius.circular(7)),
                                border: Border.all(
                                    color: Colors.grey, strokeAlign: 0.6)),
                            child: IconButton(
                              icon: const Icon(
                                Icons.grid_view_rounded,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ))
                      ],
                    ),
                    const SizedBox(
                      width: defaultPadding / 2,
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: const Color(0xff4fccc8),
                            borderRadius: BorderRadius.circular(10)),
                        child: InkWell(
                          onTap: () {
                            //  print("444");
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              if (!Responsive.isMobile(context))
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: defaultPadding / 2),
                                  child: Text(
                                    "Add Doctor",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                            ],
                          ),
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
