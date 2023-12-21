import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:abs_customer_sites/application/dealership_panel/camera_view/camera_view_bloc.dart';
import 'package:abs_customer_sites/application/dealership_panel/camera_view/flash_state.dart';

class FlashModeSelector extends StatelessWidget {
  final FlashState currentFlashState;

  FlashModeSelector({@required this.currentFlashState});
  @override
  Widget build(BuildContext context) {
    IconData currentModeIconData = currentFlashState.modeIconData();
    return BlocBuilder<CameraViewBloc, CameraViewState>(
      builder: (context, state) {
        return Container(
          width: 250,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color: Colors.white38,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  context.read<CameraViewBloc>().add(
                        CameraViewFlashStateChanged(
                            flashState: FlashState.auto),
                      );
                },
                icon: Icon(Icons.flash_auto),
                color: currentModeIconData == Icons.flash_auto
                    ? Colors.amber
                    : Colors.black,
              ),
              IconButton(
                onPressed: () {
                  context.read<CameraViewBloc>().add(
                        CameraViewFlashStateChanged(
                            flashState: FlashState.isOff),
                      );
                },
                icon: Icon(Icons.flash_off),
                color: currentModeIconData == Icons.flash_off
                    ? Colors.amber
                    : Colors.black,
              ),
              IconButton(
                onPressed: () {
                  context.read<CameraViewBloc>().add(
                        CameraViewFlashStateChanged(
                            flashState: FlashState.isOn),
                      );
                },
                icon: Icon(Icons.flash_on),
                color: currentModeIconData == Icons.flash_on
                    ? Colors.amber
                    : Colors.black,
              ),
              IconButton(
                onPressed: () {
                  context.read<CameraViewBloc>().add(
                        CameraViewFlashStateChanged(
                            flashState: FlashState.torch),
                      );
                },
                icon: Icon(Icons.highlight),
                color: currentModeIconData == Icons.highlight
                    ? Colors.amber
                    : Colors.black,
              ),
            ],
          ),
        );
      },
    );
  }
}
