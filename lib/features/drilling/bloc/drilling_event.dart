
import 'package:core/database/drilling_model.dart';

abstract class DrillingEvent {}

class InsertDrilling extends DrillingEvent{
  final DrillingModel model;
  InsertDrilling(this.model);
}