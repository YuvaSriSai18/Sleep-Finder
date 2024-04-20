import '/backend/backend.dart';
import '/backend/gemini/gemini.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'in_detail_model.dart';
export 'in_detail_model.dart';

class InDetailWidget extends StatefulWidget {
  const InDetailWidget({
    super.key,
    required this.diaryDoc,
    required this.diaryRef,
  });

  final DiaryRecord? diaryDoc;
  final DocumentReference? diaryRef;

  @override
  State<InDetailWidget> createState() => _InDetailWidgetState();
}

class _InDetailWidgetState extends State<InDetailWidget> {
  late InDetailModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InDetailModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(-1.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 0.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.diaryDoc?.title,
                    'Diary Note',
                  ),
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'Outfit',
                        fontSize: 25.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 0.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.diaryDoc?.diaryData,
                    'Today I enjoyed very much',
                  ),
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        fontSize: 15.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 15.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  text: 'OK',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await geminiGenerateText(
                      context,
                      '${widget.diaryDoc?.diaryData}Analyse this and give  suggestions for improving sleep and health in brief and short mannerwithout any headings',
                    ).then((generatedText) {
                      safeSetState(() => _model.suggestion = generatedText);
                    });

                    setState(() {});
                  },
                  child: Text(
                    'Suggestions  ??',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 17.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
            ),
            if (_model.suggestion != null && _model.suggestion != '')
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 30.0, 0.0, 0.0),
                  child: Text(
                    valueOrDefault<String>(
                      _model.suggestion,
                      'suggestions',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
          ].divide(SizedBox(height: 10.0)).around(SizedBox(height: 10.0)),
        ),
      ),
    );
  }
}
