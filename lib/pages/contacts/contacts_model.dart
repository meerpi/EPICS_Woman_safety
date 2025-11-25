import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_model.dart';
import 'contacts_widget.dart' show ContactsWidget;
import 'package:flutter/material.dart';

class ContactsModel extends FlutterFlowModel<ContactsWidget> {
  final unfocusNode = FocusNode();

  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
