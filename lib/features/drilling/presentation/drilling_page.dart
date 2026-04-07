import 'dart:math';

import 'package:core/database/drilling_model.dart';
import 'package:drilling_app/core/helper/custom_button.dart';
import 'package:drilling_app/core/helper/custom_dropdown.dart';
import 'package:drilling_app/core/helper/custom_picture_button.dart';
import 'package:drilling_app/core/helper/custom_text_field.dart';
import 'package:drilling_app/features/drilling/bloc/drilling_bloc.dart';
import 'package:drilling_app/features/drilling/bloc/drilling_event.dart';
import 'package:drilling_app/features/drilling/bloc/drilling_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sensors/sensors_service.dart';

class DrillingPage extends StatefulWidget {
  const DrillingPage({super.key});

  @override
  State<DrillingPage> createState() => _DrillingPageState();
}

class _DrillingPageState extends State<DrillingPage> {
  final TextEditingController holeIdController = TextEditingController();
  ProgressStatus? selectedProgress;
  WorkflowStatus? selectedWorkflow;
  bool isLoadingAccelerometer = false;
  bool isLoadingGyroscope = false;
  bool isLoadingPicture = false;
  String? picturePath;
  String accelerometerData = "";
  String gyroscopeData = "";
  final sensorService = SensorsService();


   final SensorsService sensorsService = SensorsService();

  @override
  void initState() {
    super.initState();
    sensorService.startSensors();
  }

  String formatXYZ(List<double> xyz) =>
      "X: ${xyz[0].toStringAsFixed(2)}, "
      "Y: ${xyz[1].toStringAsFixed(2)}, "
      "Z: ${xyz[2].toStringAsFixed(2)}";

  // Later, after some time:
  @override
  Widget build(BuildContext context) {
    final progressItems = ProgressStatus.values.map((status) {
      return DropdownMenuItem<ProgressStatus>(
        value: status,
        child: Text(status.value),
      );
    }).toList();

    final workflowItems = WorkflowStatus.values.map((status) {
      return DropdownMenuItem<WorkflowStatus>(
        value: status,
        child: Text(status.value),
      );
    }).toList();
    return Scaffold(
      body: BlocConsumer<DrillingBloc, DrillingState>(
        builder: (context, state) {
          return Container(
            child: Column(
              children: [
                CustomTextField(
                  controller: holeIdController,
                  hintText: "Hole ID",
                ),

                const Text(
                  "Accelerometer Data",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ValueListenableBuilder<List<double>>(
                  valueListenable: sensorService.accelerometer,
                  builder: (context, value, child) {

                    return isLoadingAccelerometer ? Text(formatXYZ (value)) : Text("");
                  },
                ),
                CustomButton(
                  width: MediaQuery.of(context).size.width * 0.5,
                  text: "Accelerometer",
                  onPressed: () {
                    setState(() {
                      sensorService.startSensors();
                      if (isLoadingAccelerometer == true) {
                        accelerometerData = "";
                      } else {
                        accelerometerData = "";
                      }
                      isLoadingAccelerometer = !isLoadingAccelerometer;
                    });
                  },
                  isLoading: isLoadingAccelerometer,
                ),
                 Text(
                  "Gyroscope Data",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ValueListenableBuilder<List<double>>(
                  valueListenable: sensorService.gyroscope,
                  builder: (context, value, child) {
                    return isLoadingGyroscope ? Text(formatXYZ (value)) : Text("");
                  },
                ),  

                CustomButton(
                  width: MediaQuery.of(context).size.width * 0.5,
                  text: "Gyroscope",
                  onPressed: () {
                    setState(() {
                      if (isLoadingGyroscope == true) {
                        gyroscopeData = "";
                      } else {
                        gyroscopeData = "";
                      }

                      isLoadingGyroscope = !isLoadingGyroscope;
                    });
                  },
                  isLoading: isLoadingGyroscope,
                ),
                picturePath != null
                    ? Text(picturePath ?? "")
                    : CustomPictureButton(
                        text: "Take A Picture",
                        onPictureTaken: (path) {
                          setState(() {
                            picturePath = path;
                          });
                          print("Gambar disimpan di: $path");
                        },
                      ),

                CustomDropdown<ProgressStatus>(
                  value: selectedProgress,
                  items: progressItems,
                  onChanged: (value) {
                    setState(() {
                      selectedProgress = value;
                    });
                  },
                  hintText: "Pilih Progress Status",
                ),
                CustomDropdown<WorkflowStatus>(
                  value: selectedWorkflow,
                  items: workflowItems,
                  onChanged: (value) {
                    setState(() {
                      selectedWorkflow = value;
                    });
                  },
                  hintText: "Pilih Workflow Status",
                ),

                Spacer(),
                CustomButton(
                  text: "Save As Draft",
                  onPressed: () {
                    onPressed:
                    () {
                      context.read<DrillingBloc>().add(
                        InsertDrilling(
                          DrillingModel(
                            hole_id: holeIdController.text,
                            created_time: DateTime.now(),
                            progressStatus:
                                selectedProgress?.value ??
                                ProgressStatus.incompleted.value,
                            workflowStatus:
                                WorkflowStatus.draft.value,
                            id: Random().nextInt(10000),
                            accelerometerData: accelerometerData,
                            gyroscopeData: gyroscopeData,
                            picturePath: picturePath ?? "",
                          ),
                        ),
                      );
                      print("masuk ga datanya");
                    };
                  },
                ),
                CustomButton(
                  text: "Submit",
                  onPressed: () {
                    context.read<DrillingBloc>().add(
                      InsertDrilling(
                        DrillingModel(
                          hole_id: holeIdController.text,
                          created_time: DateTime.now(),
                          progressStatus:
                              selectedProgress?.value ??
                              ProgressStatus.incompleted.value,
                          workflowStatus:
                              WorkflowStatus.submitted.value,
                          id: Random().nextInt(10000),
                          accelerometerData: accelerometerData,
                          gyroscopeData: gyroscopeData,
                          picturePath: picturePath ?? "",
                        ),
                      ),
                    );
                    print("masuk ga datanya");
                  },
                ),
              ],
            ),
          );
        },
        listener: (context, state) {
          print("masuk listener");
          if (state.status == DrillingStatus.error) {
            print(state.message);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message ?? "Data gagal disimpan")),
            );
          } else {
            print(state.message);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message ?? "Data berhasil disimpan"),
              ),
            );
          }
        },
      ),
    );
  }
}
