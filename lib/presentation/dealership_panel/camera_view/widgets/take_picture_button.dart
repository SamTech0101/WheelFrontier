import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/application/dealership_panel/camera_view/camera_view_bloc.dart';

class TakePictureButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CameraViewBloc, CameraViewState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            final currentState = state as CameraViewLivePreview;
            if (currentState.orientation == Orientation.landscape) {
              context
                  .read<CameraViewBloc>()
                  .add(CameraViewTakePicturePressed());
            } else {
              Get.snackbar(
                'Little reminder!',
                'Device should be in landscape mode for taking picture',
                backgroundColor: Colors.white,
              );
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueGrey[200],
                  border: Border.all(
                    color: Colors.white,
                    width: 5,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
