import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_desktop/constants.dart';
import 'package:task_desktop/doctor_screen.dart';
import 'package:task_desktop/models/doctors_model.dart';
import 'package:task_desktop/my_files.dart';
import 'package:task_desktop/responsive.dart';
import 'package:task_desktop/widget/doctor_Item.dart';

import 'Services/doctors_service.dart';
import 'widget/header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Size size;
  int slectedPage = 0;
  List doctors = [];
  bool loading = true;
  _getDoctors() async {
    List doc = await DoctorServices.getDector();
    setState(() {
      doctors = doc;
      loading = false;
    });
  }

  @override
  void initState() {
    _getDoctors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      primary: false,
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        children: [
          Header(),
          SizedBox(height: defaultPadding),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            DoctorScreen(),
                          ],
                        ),
                        SizedBox(height: defaultPadding),
                        Responsive(
                          mobile: DoctorInfoCardGridView(
                            crossAxisCount: size.width < 460
                                ? 1
                                : size.width > 700
                                    ? 4
                                    : 2,
                            childAspectRatio: size.width < 650 ? 1.3 : 1,
                            doctor: doctors,
                          ),
                          tablet: DoctorInfoCardGridView(doctor: doctors),
                          desktop: DoctorInfoCardGridView(
                              childAspectRatio: size.width < 1400 ? 1.1 : 1.4,
                              doctor: doctors),
                        ),
                        endPar(),
                      ],
                    ),
                    SizedBox(height: defaultPadding),
                    if (Responsive.isMobile(context))
                      SizedBox(height: defaultPadding),
                  ],
                ),
              ),
              if (!Responsive.isMobile(context))
                SizedBox(width: defaultPadding),
            ],
          ),
        ],
      ),
      //Items 3
    )));
  }

  Widget endPar() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("1 - 8 of 10 records"),
          Row(
            children: [
              if (size.width > 500) Text('The page you are on '),
              Container(
                color: Colors.white,
                child: TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_drop_down),
                    label: Text(
                      "1",
                      style: TextStyle(fontSize: 10),
                    )),
              ),
              SizedBox(
                width: 20,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 15,
                    color: Colors.grey.withOpacity(0.5),
                  )),
              SizedBox(
                width: 20,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_forward_ios, size: 15)),
            ],
          )
        ],
      );
}
