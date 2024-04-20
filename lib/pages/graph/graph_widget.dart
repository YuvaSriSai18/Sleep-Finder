import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'graph_model.dart';
export 'graph_model.dart';

class GraphWidget extends StatefulWidget {
  const GraphWidget({super.key});

  @override
  State<GraphWidget> createState() => _GraphWidgetState();
}

class _GraphWidgetState extends State<GraphWidget> {
  late GraphModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GraphModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Align(
            alignment: AlignmentDirectional(-1.0, -1.0),
            child: Text(
              'Infographics',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Outfit',
                    color: Colors.white,
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: CircularPercentIndicator(
                    percent: 0.5,
                    radius: 75.0,
                    lineWidth: 20.0,
                    animation: true,
                    animateFromLastPercent: true,
                    progressColor: FlutterFlowTheme.of(context).primary,
                    backgroundColor: FlutterFlowTheme.of(context).alternate,
                    center: Text(
                      '50%',
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Outfit',
                                letterSpacing: 0.0,
                              ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 13.0, 0.0, 13.0),
                child: Text(
                  'Sleep Score',
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'Outfit',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 230.0,
                  child: FlutterFlowBarChart(
                    barData: [
                      FFBarChartData(
                        yData: List.generate(random_data.randomInteger(0, 0),
                            (index) => random_data.randomInteger(2, 8)),
                        color: FlutterFlowTheme.of(context).primary,
                      )
                    ],
                    xLabels: List.generate(random_data.randomInteger(3, 7),
                            (index) => random_data.randomDate())
                        .map((e) => e.toString())
                        .toList(),
                    barWidth: 16.0,
                    barBorderRadius: BorderRadius.circular(0.0),
                    groupSpace: 8.0,
                    alignment: BarChartAlignment.spaceAround,
                    chartStylingInfo: ChartStylingInfo(
                      backgroundColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      showGrid: true,
                      borderColor: FlutterFlowTheme.of(context).secondaryText,
                      borderWidth: 1.0,
                    ),
                    axisBounds: AxisBounds(),
                    xAxisLabelInfo: AxisLabelInfo(),
                    yAxisLabelInfo: AxisLabelInfo(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 13.0, 0.0, 13.0),
                child: Text(
                  'Sleep Per Day',
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'Outfit',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
