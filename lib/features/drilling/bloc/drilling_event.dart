
import 'package:core/database/drilling_model.dart';

abstract class DrillingEvent {}

class insertDrilling extends DrillingEvent{
  final DrillingModel model;
  insertDrilling(this.model);
}