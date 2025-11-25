import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_model.dart';
import 'safety_tips_widget.dart' show SafetyTipsWidget;
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class SafetyTipsModel extends FlutterFlowModel<SafetyTipsWidget> {
  final unfocusNode = FocusNode();

  late ExpandableController expandableExpandableController1;
  late ExpandableController expandableExpandableController2;
  late ExpandableController expandableExpandableController3;
  late ExpandableController expandableExpandableController4;

  @override
  void initState(BuildContext context) {
    expandableExpandableController1 = ExpandableController();
    expandableExpandableController2 = ExpandableController();
    expandableExpandableController3 = ExpandableController();
    expandableExpandableController4 = ExpandableController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
    expandableExpandableController3.dispose();
    expandableExpandableController4.dispose();
  }
}
