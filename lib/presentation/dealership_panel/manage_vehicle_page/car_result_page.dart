import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';

class CarResultPage extends StatelessWidget {
  final String carImage;
  final String carDetail;
  final int carMileage;
  final String carPrice;

  CarResultPage({
    this.carImage = '',
    this.carDetail = '',
    this.carMileage,
    this.carPrice = '',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * (1 / 3),
                    width: MediaQuery.of(context).size.width,
                    child: Swiper(
                      viewportFraction: 1,
                      scale: 0.95,
                      pagination: SwiperPagination(),
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(
                          'https://motoring.pxcrush.net/motoring/general/editorial/2020-mustang-ecoboost-hpp-08-1.jpg?width=1024',
                        );
                      },
                      itemCount: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white54),
                        child: Icon(
                          Icons.arrow_back_sharp,
                          size: 30,
                        ),
                      ),
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white54,
                        ),
                        child: Icon(
                          Icons.edit,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 55, right: 8),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white54,
                        ),
                        child: Icon(
                          Icons.delete,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 15, bottom: 10),
                child: Text(
                  carDetail,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 5, bottom: 10),
                child: Text('location | gategory'),
              ),
              Center(
                child: Container(
                  height: 0.2,
                  width: MediaQuery.of(context).size.width * (9.5 / 10),
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 30,
                      ),
                      child: Column(
                        children: [
                          Text('color'),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              'orange',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * (0.5 / 10),
                      width: 0.2,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30, left: 30),
                      child: Column(
                        children: [
                          Text('year'),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              '2020',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * (0.5 / 10),
                      width: 0.2,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Column(
                        children: [
                          Text('mileage'),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              carMileage.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  height: 0.2,
                  width: MediaQuery.of(context).size.width * (9.5 / 10),
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'make model',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('ford mustang v8 5lit')
                  ],
                ),
              ),
              Center(
                child: Container(
                  height: 0.2,
                  width: MediaQuery.of(context).size.width * (9.5 / 10),
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Body condition ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('exelent')
                  ],
                ),
              ),
              Center(
                child: Container(
                  height: 0.2,
                  width: MediaQuery.of(context).size.width * (9.5 / 10),
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'gearbox',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('automatic')
                  ],
                ),
              ),
              Center(
                child: Container(
                  height: 0.2,
                  width: MediaQuery.of(context).size.width * (9.5 / 10),
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'price',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(carPrice + '\$'),
                  ],
                ),
              ),
              Center(
                child: Container(
                  height: 0.2,
                  width: MediaQuery.of(context).size.width * (9.5 / 10),
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'summary',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
                  ],
                ),
              ),
              Center(
                child: Container(
                  height: 0.2,
                  width: MediaQuery.of(context).size.width * (9.5 / 10),
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'VIN details',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
                  ],
                ),
              ),
              Center(
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            child: Container(
                              child: Center(child: Text('button A')),
                              height: MediaQuery.of(context).size.height *
                                  (0.5 / 10),
                              width:
                                  MediaQuery.of(context).size.width * (4 / 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Colors.blue),
                            ),
                          ),
                          InkWell(
                            child: Container(
                              child: Center(child: Text('button B')),
                              height: MediaQuery.of(context).size.height *
                                  (0.5 / 10),
                              width:
                                  MediaQuery.of(context).size.width * (4 / 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Colors.blue),
                            ),
                          ),
                        ],
                      ))),
              Center(
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            child: Container(
                              child: Center(child: Text('button C')),
                              height: MediaQuery.of(context).size.height *
                                  (0.5 / 10),
                              width:
                                  MediaQuery.of(context).size.width * (4 / 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Colors.blue),
                            ),
                          ),
                          InkWell(
                            child: Container(
                              child: Center(child: Text('button D')),
                              height: MediaQuery.of(context).size.height *
                                  (0.5 / 10),
                              width:
                                  MediaQuery.of(context).size.width * (4 / 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Colors.blue),
                            ),
                          ),
                        ],
                      ))),
              Center(
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            child: Container(
                              child: Center(child: Text('button E')),
                              height: MediaQuery.of(context).size.height *
                                  (0.5 / 10),
                              width:
                                  MediaQuery.of(context).size.width * (4 / 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Colors.blue),
                            ),
                          ),
                          InkWell(
                            child: Container(
                              child: Center(child: Text('button F')),
                              height: MediaQuery.of(context).size.height *
                                  (0.5 / 10),
                              width:
                                  MediaQuery.of(context).size.width * (4 / 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Colors.blue),
                            ),
                          ),
                        ],
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
