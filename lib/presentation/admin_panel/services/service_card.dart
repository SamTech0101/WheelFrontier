import 'package:flutter/material.dart';
import 'package:abs_customer_sites/presentation/core/widgets/tag_chip.dart';
import 'package:sliding_card/sliding_card.dart';

class ServiceCardAdmin extends StatefulWidget {
  final String name;
  final String description;
  final Color color;
  final double price;
  final bool isDeafult;

  ServiceCardAdmin({
    @required this.name,
    @required this.description,
    @required this.color,
    @required this.price,
    @required this.isDeafult,
  });

  @override
  _ServiceCardAdminState createState() => _ServiceCardAdminState();
}

class _ServiceCardAdminState extends State<ServiceCardAdmin> {
  bool isChecked = false;
  SlidingCardController slidingCardController;

  @override
  void initState() {
    super.initState();
    slidingCardController = SlidingCardController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: SlidingCard(
        slidingCardWidth: MediaQuery.of(context).size.width,
        backCardWidget: Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.green[50],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              widget.description,
              style: TextStyle(
                  color: Colors.green[900],
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
          ),
        ),
        hiddenCardHeight: 130,
        visibleCardHeight: 165,
        controller: slidingCardController,
        frontCardWidget: Container(
          color: Colors.white,
          child: Material(
            color: Colors.transparent,
            elevation: 4,
            borderRadius: BorderRadius.circular(15),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 130,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 8,
                    height: 165,
                    decoration: BoxDecoration(
                      color: widget.color,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        topLeft: Radius.circular(15),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, top: 12, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.name,
                                style: TextStyle(fontSize: 17),
                              ),
                              Text(
                                '\$${widget.price.toInt()} / month',
                                style: TextStyle(fontSize: 17),
                              ),
                            ],
                          ),
                          if (widget.isDeafult)
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: TagChip(
                                text: 'Default',
                                colorIndex: 5,
                              ),
                            ),
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: TagChip(
                                  text: 'Count Service',
                                  colorIndex: 8,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  if (slidingCardController
                                      .isCardSeparated) {
                                    slidingCardController.collapseCard();
                                  } else {
                                    slidingCardController.expandCard();
                                  }
                                  setState(() {});
                                },
                                color: Colors.black,
                                iconSize: 20,
                                icon: Icon(Icons.info),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
