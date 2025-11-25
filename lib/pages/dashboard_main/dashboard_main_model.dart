import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_model.dart';
import 'dashboard_main_widget.dart' show DashboardMainWidget;
import 'package:flutter/material.dart';

class DashboardMainModel extends FlutterFlowModel<DashboardMainWidget> {
  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
