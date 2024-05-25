import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'modul_widget.dart' show ModulWidget;
import 'package:flutter/material.dart';

class ModulModel extends FlutterFlowModel<ModulWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for newmilestoone widget.
  FocusNode? newmilestooneFocusNode;
  TextEditingController? newmilestooneTextController;
  String? Function(BuildContext, String?)? newmilestooneTextControllerValidator;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    newmilestooneFocusNode?.dispose();
    newmilestooneTextController?.dispose();
  }
}
