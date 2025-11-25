import 'package:flutter/material.dart';

/// Base class for all page models
/// Provides lifecycle management for page state
abstract class FlutterFlowModel<T> extends ChangeNotifier {
  /// Initialize the model with the given context
  void initState(BuildContext context);

  /// Dispose of any resources used by the model
  @override
  void dispose();
}

/// Helper function to create and initialize a model
/// Usage: final model = createModel(context, () => MyPageModel());
T createModel<T extends FlutterFlowModel>(
  BuildContext context,
  T Function() create,
) {
  final model = create();
  model.initState(context);
  return model;
}
