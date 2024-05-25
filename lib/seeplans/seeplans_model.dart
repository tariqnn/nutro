import '/flutter_flow/flutter_flow_util.dart';
import 'seeplans_widget.dart' show SeeplansWidget;
import 'package:flutter/material.dart';

class SeeplansModel extends FlutterFlowModel<SeeplansWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
