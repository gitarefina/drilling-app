import 'dart:convert';

enum ProgressStatus {
  completed,
  incompleted;

  String get value {
    switch (this) {
      case ProgressStatus.completed:
        return 'COMPLETE';
      case ProgressStatus.incompleted:
        return 'NOT_COMPLETE';
    }
  }
}

enum WorkflowStatus {
  draft,
  submitted;

  String get value {
    switch (this) {
      case WorkflowStatus.draft:
        return 'DRAFT';
      case WorkflowStatus.submitted:
        return 'SUBMIT';
    }
  }
}


class DrillingFields {
  static const String tableName = 'drilling';

  static const String id = 'id'; // ✅ fix
  static const String holeId = 'hole_id';
  static const String accelerometer = 'accelerometer';
  static const String gyroscope = 'gyroscope';
  static const String createdTime = 'created_time';
  static const String picture = 'picture';
  static const String statusProgress = 'status_progress';
  static const String statusWorkflow = 'status_workflow';
}
class DrillingModel {
  final int? id;
  final String hole_id;
  final String? accelerometerData;
  final String? gyroscopeData;
  final DateTime created_time;
  final String? picturePath;
  final String progressStatus;
  final String workflowStatus;

  DrillingModel({
    required this.id,
    required this.hole_id,
    required this.accelerometerData,
    required this.gyroscopeData,
    required this.created_time,
    required this.picturePath,
    required this.progressStatus,
    required this.workflowStatus,
  });

  // ===== TO MAP =====
  Map<String, dynamic> toMap() {
    return {
      DrillingFields.id: id,
      DrillingFields.holeId: hole_id,
      DrillingFields.accelerometer:
         accelerometerData,
      DrillingFields.gyroscope:gyroscopeData,
      DrillingFields.createdTime: created_time.toIso8601String(),
      DrillingFields.picture: picturePath,
      DrillingFields.statusProgress: progressStatus, // ✅ pakai value
      DrillingFields.statusWorkflow: workflowStatus, // ✅ pakai value
    };
  }

  // ===== FROM MAP =====
  factory DrillingModel.fromMap(Map<String, dynamic> map) {
    return DrillingModel(
      id: map[DrillingFields.id],
      hole_id: map[DrillingFields.holeId],
      accelerometerData: map[DrillingFields.accelerometer] ,
      gyroscopeData: map[DrillingFields.gyroscope] ,
      created_time: DateTime.parse(map[DrillingFields.createdTime]),
      picturePath: map[DrillingFields.picture],

      // 🔥 convert dari VALUE (COMPLETE, NOT_COMPLETE)
      progressStatus: map[DrillingFields.statusProgress],

      workflowStatus: map[DrillingFields.statusWorkflow],
    );
  }
}