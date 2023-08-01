import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  late var size;
  var slectedPage = 0;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(children: [
          Container(
            height: 150,
            padding: const EdgeInsets.all(40),
            decoration: const BoxDecoration(
              image: DecorationImage(
                scale: 0.7,
                image: AssetImage("assets/images/1.png"),
              ),
            ),
          ),
          listItem(Icons.home, "Home", 1),
          listItem(Icons.file_open, "Appointments", 2),
          listItem(Icons.group, "Doctors", 3),
          listItem(Icons.group, "Staff", 4),
          listItem(Icons.airline_seat_individual_suite_rounded, "Patient", 5),
          listItem(Icons.payment, "Payment", 6),
          SizedBox(height: 30.0),
          Container(
            padding: const EdgeInsets.all(40),
            height: 200,
            width: 300,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/2.png"),
              ),
            ),
          ),
          listItem(Icons.logout_rounded, "Log out", 7),
        ]),
      ),
    );
  }

  listItem(icon, title, id) {
    return InkWell(
      onTap: () {
        setState(() {
          slectedPage = id;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(6),
        height: 40,
        width: size.width * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: slectedPage == id ? Color(0xff4fccc8) : Colors.grey[200],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: Colors.grey,
            ),
            const SizedBox(width: 10),
            Text(title, style: GoogleFonts.poppins(fontSize: 13))
          ],
        ),
      ),
    );
  }
}
