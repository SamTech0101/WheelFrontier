import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/add_vehicle_form/add_vehicle_form.dart';

class ManageVehiclePage extends StatefulWidget {
  @override
  _ManageVehiclePageState createState() => _ManageVehiclePageState();
}

class _ManageVehiclePageState extends State<ManageVehiclePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Vehicle Management',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // InkWell(
                //   onTap: () {
                //     Get.to(CarResultPage(
                //       carDetail:
                //           '2013 Bentley Continental GT V8 COUPE, CABRIOLET, AWD, TWN TURBO',
                //       carImage:
                //           'https://cdn-ds.com/stock/2013-Bentley-Continental-GT-V8-COUPE-CABRIOLET-AWD-NAVI-REAR-CAM-TWN-TURBO-Toronto-ON/seo/ECL12186-SCBGT3ZA0DC083505/sz_115993/w_387/3b205dace275f13f4eadccdb0e0ffccc.jpg',
                //       carMileage: 35000,
                //       carPrice: '124,950',
                //     ));
                //   },
                //   child: VehcileCard(
                //     carDetail:
                //         '2013 Bentley Continental GT V8 COUPE, CABRIOLET, AWD, TWN TURBO',
                //     pictureUrl:
                //         'https://cdn-ds.com/stock/2013-Bentley-Continental-GT-V8-COUPE-CABRIOLET-AWD-NAVI-REAR-CAM-TWN-TURBO-Toronto-ON/seo/ECL12186-SCBGT3ZA0DC083505/sz_115993/w_387/3d0cadfe45b842dced6a2772590e45c5.jpg',
                //     milleage: 35000,
                //     price: '124,950',
                //   ),
                // ),
                // InkWell(
                //   onTap: () {
                //     Get.to(CarResultPage(
                //       carImage:
                //           'https://cdn-ds.com/stock/2017-Mercedes-Benz-C-Class-AMG-C-43-NO-ACCIDENTCOUPEAWD-NAVI360CAM-Toronto-ON/seo/ECL12186-WDDWJ6EB4HF435221/sz_107860/w_387/442d0b2ca91c0a080df9b4d5b75f04ee.jpg',
                //       carDetail:
                //           '2017 Mercedes-Benz C-Class AMG C 43, NO ACCIDENT,COUPE,AWD',
                //       carMileage: 110000,
                //       carPrice: '42,250',
                //     ));
                //   },
                //   child: VehcileCard(
                //     carDetail:
                //         '2017 Mercedes-Benz C-Class AMG C 43, NO ACCIDENT,COUPE,AWD',
                //     pictureUrl:
                //         'https://cdn-ds.com/stock/2017-Mercedes-Benz-C-Class-AMG-C-43-NO-ACCIDENTCOUPEAWD-NAVI360CAM-Toronto-ON/seo/ECL12186-WDDWJ6EB4HF435221/sz_107860/w_387/442d0b2ca91c0a080df9b4d5b75f04ee.jpg',
                //     milleage: 110000,
                //     price: '42,250',
                //   ),
                // ),
                // InkWell(
                //   onTap: () {
                //     Get.to(CarResultPage(
                //       carDetail: '2018 Audi TTS Coupe QUATTRO, NO ACCIDENT',
                //       carImage:
                //           'https://cdn-ds.com/stock/2018-Audi-TTS-Coupe-QUATTRO-NO-ACCIDENT-NAVI-REAR-CAM-B-SPOT-Toronto-ON/seo/ECL12186-TRUC1AFV9J1002883/sz_103241/w_387/7e6244c533eb7ffd2aacf62b5b0a91c5.jpg',
                //       carPrice: '124,950',
                //       carMileage: 82000,
                //     ));
                //   },
                //   child: VehcileCard(
                //     carDetail: '2018 Audi TTS Coupe QUATTRO, NO ACCIDENT',
                //     pictureUrl:
                //         'https://cdn-ds.com/stock/2018-Audi-TTS-Coupe-QUATTRO-NO-ACCIDENT-NAVI-REAR-CAM-B-SPOT-Toronto-ON/seo/ECL12186-TRUC1AFV9J1002883/sz_103241/w_387/7e6244c533eb7ffd2aacf62b5b0a91c5.jpg',
                //     milleage: 82000,
                //     price: '124,950',
                //   ),
                // ),
                // InkWell(
                //   onTap: () {
                //     Get.to(CarResultPage(
                //       carDetail:
                //           '2017 Land Rover Range Rover Evoque HSE, PANO ROOF',
                //       carMileage: 58000,
                //       carPrice: '35,750',
                //       carImage:
                //           'https://cdn-ds.com/stock/2017-Land-Rover-Range-Rover-Evoque-HSE-AWD-NAVI-REAR-CAM-PANO-ROOF-Toronto-ON/seo/ECL12186-SALVR2BG9HH241384/sz_117776/w_387/1e1fa42c1f679d3bdfbb7f166fe653f9.jpg',
                //     ));
                //   },
                //   child: VehcileCard(
                //     carDetail:
                //         '2017 Land Rover Range Rover Evoque HSE, PANO ROOF',
                //     pictureUrl:
                //         'https://cdn-ds.com/stock/2017-Land-Rover-Range-Rover-Evoque-HSE-AWD-NAVI-REAR-CAM-PANO-ROOF-Toronto-ON/seo/ECL12186-SALVR2BG9HH241384/sz_117776/w_387/1e1fa42c1f679d3bdfbb7f166fe653f9.jpg',
                //     milleage: 58000,
                //     price: '35,750',
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddVehicleForm());
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class VehcileCard extends StatelessWidget {
  final String carDetail;
  final String pictureUrl;
  final int milleage;
  final String price;

  VehcileCard({
    @required this.carDetail,
    @required this.pictureUrl,
    @required this.milleage,
    @required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Material(
        elevation: 4,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Image.network(pictureUrl),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 10, right: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        carDetail,
                        style: TextStyle(fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          'Mileage : $milleage',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          'Price : \$$price',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
