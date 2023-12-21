import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:abs_customer_sites/application/dealership_panel/camera_view/camera_view_bloc.dart';

class RecordVideoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CameraViewBloc, CameraViewState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<CameraViewBloc>().add(
                  CameraViewStartedVideoRecording(),
                );
          },
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
              border: Border.all(
                color: Colors.white,
                width: 6,
              ),
            ),
          ),
        );
      },
    );
  }
}
