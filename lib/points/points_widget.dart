import '/backend/backend.dart';
import '/components/modul_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'points_model.dart';
export 'points_model.dart';

class PointsWidget extends StatefulWidget {
  const PointsWidget({
    super.key,
    required this.id,
  });

  final DocumentReference? id;

  @override
  State<PointsWidget> createState() => _PointsWidgetState();
}

class _PointsWidgetState extends State<PointsWidget> {
  late PointsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PointsModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        queryBuilder: (usersRecord) => usersRecord.where(
          'uid',
          isEqualTo: widget.id?.id,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<UsersRecord> pointsUsersRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final pointsUsersRecord = pointsUsersRecordList.isNotEmpty
            ? pointsUsersRecordList.first
            : null;
        return Title(
            title: 'points',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                appBar: AppBar(
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  automaticallyImplyLeading: false,
                  leading: FlutterFlowIconButton(
                    borderRadius: 30.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      context.safePop();
                    },
                  ),
                  title: Text(
                    FFLocalizations.of(context).getText(
                      'p233e9r2' /* Points Overview */,
                    ),
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Outfit',
                          letterSpacing: 0.0,
                        ),
                  ),
                  actions: const [],
                  centerTitle: false,
                  elevation: 0.0,
                ),
                body: SafeArea(
                  top: true,
                  child: Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 16.0, 16.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'a8wfddhz' /* Add Points */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .override(
                                        fontFamily: 'Outfit',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'uyt0mbgf' /* User Points */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: 'Outfit',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 1.0, 16.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 0.0,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        offset: const Offset(
                                          0.0,
                                          1.0,
                                        ),
                                        spreadRadius: 0.0,
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 12.0, 12.0, 12.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '592kpl4r' /* Current Points */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            pointsUsersRecord?.points
                                                .toString(),
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '7x8tnxpf' /* 0 */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 1.0, 16.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 0.0,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        offset: const Offset(
                                          0.0,
                                          1.0,
                                        ),
                                        spreadRadius: 0.0,
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 12.0, 12.0, 12.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '6jdf3wjv' /* Add Points */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                            width: 100.0,
                                            child: TextFormField(
                                              controller: _model.textController,
                                              focusNode:
                                                  _model.textFieldFocusNode,
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'go48p7z9' /* Enter points... */,
                                                ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    const UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                errorBorder:
                                                    const UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedErrorBorder:
                                                    const UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                contentPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(12.0, 0.0,
                                                            16.0, 12.0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                              validator: _model
                                                  .textControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await pointsUsersRecord!.reference.update({
                                      ...mapToFirestore(
                                        {
                                          'points': FieldValue.increment(
                                              int.parse(
                                                  _model.textController.text)),
                                        },
                                      ),
                                    });
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'qd09lwxz' /* Update Points */,
                                  ),
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 50.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 2.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            width: double.infinity,
                            constraints: const BoxConstraints(
                              maxWidth: 970.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: const Color(0xFFE5E7EB),
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 12.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'wy0b94db' /* Milestones */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: const Color(0xFF15161E),
                                            fontSize: 22.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                  ListView(
                                    padding: const EdgeInsets.fromLTRB(
                                      0,
                                      16.0,
                                      0,
                                      16.0,
                                    ),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        constraints: const BoxConstraints(
                                          maxWidth: 570.0,
                                        ),
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  width: 32.0,
                                                  height: 32.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .success,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: const Color(0xFF6F61EF),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                ),
                                                Theme(
                                                  data: ThemeData(
                                                    checkboxTheme:
                                                        CheckboxThemeData(
                                                      visualDensity:
                                                          VisualDensity.compact,
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.0),
                                                      ),
                                                    ),
                                                    unselectedWidgetColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                  ),
                                                  child: Checkbox(
                                                    value:
                                                        _model.checkboxValue ??=
                                                            false,
                                                    onChanged:
                                                        (newValue) async {
                                                      setState(() =>
                                                          _model.checkboxValue =
                                                              newValue!);
                                                      if (newValue!) {
                                                        await pointsUsersRecord!
                                                            .reference
                                                            .update(
                                                                createUsersRecordData(
                                                          milestone:
                                                              createMilestonesStruct(
                                                            status: _model
                                                                .checkboxValue,
                                                            clearUnsetFields:
                                                                false,
                                                          ),
                                                        ));
                                                      } else {
                                                        await pointsUsersRecord!
                                                            .reference
                                                            .update(
                                                                createUsersRecordData(
                                                          milestone:
                                                              createMilestonesStruct(
                                                            status: _model
                                                                .checkboxValue,
                                                            clearUnsetFields:
                                                                false,
                                                          ),
                                                        ));
                                                      }
                                                    },
                                                    side: BorderSide(
                                                      width: 2,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                    activeColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    checkColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Builder(
                                                    builder: (context) =>
                                                        Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () => _model
                                                                          .unfocusNode
                                                                          .canRequestFocus
                                                                      ? FocusScope.of(
                                                                              context)
                                                                          .requestFocus(_model
                                                                              .unfocusNode)
                                                                      : FocusScope.of(
                                                                              context)
                                                                          .unfocus(),
                                                                  child:
                                                                      ModulWidget(
                                                                    index: 0,
                                                                    id: widget
                                                                        .id!,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));
                                                        },
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            pointsUsersRecord
                                                                ?.milestone
                                                                .name,
                                                            'none',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Plus Jakarta Sans',
                                                                color: const Color(
                                                                    0xFF15161E),
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    pointsUsersRecord
                                                        ?.milestone.status
                                                        .toString(),
                                                    'false',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            const Color(0xFF606A85),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      18.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 10.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      blurRadius: 0.0,
                                                      color: Color(0xFF6F61EF),
                                                      offset: Offset(
                                                        -2.0,
                                                        0.0,
                                                      ),
                                                    )
                                                  ],
                                                  border: Border.all(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        constraints: const BoxConstraints(
                                          maxWidth: 570.0,
                                        ),
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        constraints: const BoxConstraints(
                                          maxWidth: 570.0,
                                        ),
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        constraints: const BoxConstraints(
                                          maxWidth: 570.0,
                                        ),
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        constraints: const BoxConstraints(
                                          maxWidth: 570.0,
                                        ),
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ].divide(const SizedBox(height: 0.0)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
