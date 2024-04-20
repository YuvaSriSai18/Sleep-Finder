import '/backend/backend.dart';
import '/backend/gemini/gemini.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'in_detail_widget.dart' show InDetailWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InDetailModel extends FlutterFlowModel<InDetailWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Gemini - Generate Text] action in Text widget.
  String? suggestion;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
