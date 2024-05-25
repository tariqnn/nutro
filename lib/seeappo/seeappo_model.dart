import '/flutter_flow/flutter_flow_util.dart';
import 'seeappo_widget.dart' show SeeappoWidget;
import 'package:flutter/material.dart';

class SeeappoModel extends FlutterFlowModel<SeeappoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
