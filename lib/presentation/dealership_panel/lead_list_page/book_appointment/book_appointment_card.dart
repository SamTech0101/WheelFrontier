import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/application/dealership_panel/lead/lead_bloc.dart';
import 'package:abs_customer_sites/domain/dealership-panel/lead/book_appointment/book_appointment.dart';
import 'package:abs_customer_sites/presentation/core/constants.dart';
import 'package:abs_customer_sites/presentation/core/widgets/status_tag.dart';
import 'package:abs_customer_sites/presentation/core/widgets/tag_chip.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/lead_list_page/book_appointment/book_appointment_details.dart';
import 'package:intl/intl.dart';

class BookAppointmentCard extends StatelessWidget {
  final BookAppointment bookAppointment;
  BookAppointmentCard({@required this.bookAppointment});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeadBloc, LeadState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: GestureDetector(
            onTap: () {
              if (bookAppointment.status == 'Not Seen') {
                context
                    .read<LeadBloc>()
                    .add(LeadPageUpdate(request: bookAppointment));
                context.read<LeadBloc>().add(LeadPageInitialized());
              }

              Get.to(BookAppointmentDetails(bookAppointment: bookAppointment));
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.primaries[leadColorIndex],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            '${bookAppointment.user.fName} ${bookAppointment.user.lName}',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            DateFormat.yMd()
                                .add_jm()
                                .format(bookAppointment.date),
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/book-appointment.svg',
                                color: Color.fromRGBO(255, 0, 0, 1),
                                semanticsLabel: 'book appointment',
                                height: 18,
                                width: 18,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Book Appointment',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        /*this widget set status icon to seen or not seen */
                        StatusTag(status: bookAppointment.status),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
