import 'package:Dozer/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:signature/signature.dart';
import 'package:geocoding/geocoding.dart' show Placemark, placemarkFromCoordinates;

import 'controllers/booking_controller.dart';

class BookingForm extends StatelessWidget {
  final BookingController controller = Get.put(BookingController());

  Widget buildLocationField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller.locationController,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: 'Select $label',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(width: 8.0),
              ElevatedButton(
                onPressed: () async {
                  await controller.getCurrentLocation();
                },
                child: Icon(Icons.gps_fixed),
              ),
              SizedBox(width: 8.0),
              ElevatedButton(
                onPressed: () async {
                  await controller.showPredefinedLocationsDialog();
                },
                child: Icon(Icons.location_on),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildDateField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          TextField(
            controller: controller,
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: Get.context!,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2101),
              );

              if (pickedDate != null && pickedDate != DateTime.now()) {
                controller.text = "${pickedDate.toLocal()}".split(' ')[0];
              }
            },
            decoration: InputDecoration(
              hintText: 'Select $label',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDateFieldsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: buildDateField("Start Date", controller.startDateController),
        ),
        SizedBox(width: 16.0),
        Expanded(
          child: buildDateField("End Date", controller.endDateController),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Form'),
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildDateFieldsRow(),
            buildLocationField("Renter's Location"),
            buildAgreementText(),
            buildSignatureField("Sign Board", controller.signBoardSignatureController),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    controller.confirmBooking();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    minimumSize: Size(double.infinity, 50.0),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAgreementText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'By proceeding, you agree to the rental terms and conditions.',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 8.0),
          InkWell(
            onTap: () {
              Get.dialog(
                AlertDialog(
                  title: Text('Terms of Agreement'),
                  content: SingleChildScrollView(
                    child: Text(
                      'Add your terms and conditions here.',
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('Close'),
                    ),
                  ],
                ),
              );
            },
            child: Text(
              'View Terms of Agreement',
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSignatureField(String label, SignatureController? controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label),
              ElevatedButton(
                onPressed: () {
                  controller?.clear();
                },
                child: Text('Clear Signature'),
              ),
            ],
          ),
          Container(
            height: 120,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Signature(
              controller: controller ?? SignatureController(),
              height: 120,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
