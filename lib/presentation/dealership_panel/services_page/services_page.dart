import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/presentation/core/widgets/tag_chip.dart';

class ServicesPage extends StatefulWidget {
  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Services',
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
          child: Column(
            children: [
              ServicesCard(
                name: 'VIN Decorder',
                description: '20 minutes of decoding with vin decoder',
                color: Colors.primaries[Random().nextInt(18)],
                price: 20,
                isDeafult: true,
              ),
              ServicesCard(
                name: '24/7 Customer Service',
                description: '20 minutes of decoding with vin decoder',
                color: Colors.primaries[Random().nextInt(18)],
                price: 20,
                isDeafult: true,
              ),
              ServicesCard(
                name: 'VIN Decorder',
                description: '20 minutes of decoding with vin decoder',
                color: Colors.primaries[Random().nextInt(18)],
                price: 20,
                isDeafult: false,
              ),
              ServicesCard(
                name: 'VIN Decorder',
                description: '20 minutes of decoding with vin decoder',
                color: Colors.primaries[Random().nextInt(18)],
                price: 20,
                isDeafult: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServicesCard extends StatelessWidget {
  final String name;
  final String description;
  final Color color;
  final double price;
  final bool isDeafult;

  ServicesCard({
    @required this.name,
    @required this.description,
    @required this.color,
    @required this.price,
    @required this.isDeafult,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Material(
        color: Colors.transparent,
        elevation: 4,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 8,
                height: 100,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 12, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name,
                            style: TextStyle(fontSize: 17),
                          ),
                          Text(
                            '\$${price.toInt()} / month',
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 10),
                        child: Row(
                          mainAxisAlignment: isDeafult
                              ? MainAxisAlignment.spaceBetween
                              : MainAxisAlignment.end,
                          children: [
                            if (isDeafult) TagChip(
                              text: 'Default',
                              colorIndex: 4,
                            ),
                            ServiceCount(
                              color: color,
                              isDeafult: isDeafult,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class ServiceCount extends StatefulWidget {
  final Color color;
  final bool isDeafult;

  ServiceCount({@required this.color, @required this.isDeafult});
  @override
  _ServiceCountState createState() => _ServiceCountState();
}

class _ServiceCountState extends State<ServiceCount> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              count++;
            });
          },
          child: Container(
            width: 30,
            height: 30,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: widget.color),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          count.toString(),
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            if (count > 0) {
              setState(() {
                count--;
              });
            }
          },
          child: Container(
            width: 30,
            height: 30,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: widget.color),
            child: Icon(Icons.remove, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
