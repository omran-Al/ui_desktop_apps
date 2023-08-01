import 'package:flutter/material.dart';
import 'package:task_desktop/constants.dart';
import 'package:task_desktop/widget/doctor_Item.dart';

class DoctorInfoCardGridView extends StatelessWidget {
  DoctorInfoCardGridView(
      {Key? key,
      this.crossAxisCount = 4,
      this.childAspectRatio = 1,
      required this.doctor})
      : super(key: key);
  late List doctor;
  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: doctor.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => DoctorItem(
          email: doctor[index].email,
          name: doctor[index].name,
          phone: doctor[index].phone,
          description: doctor[index].description,
          imageId: doctor[index].imageId),
    );
  }
}
