import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'sign_up_model.dart';
import 'package:women_safety_app/services/auth_service.dart';
export 'sign_up_model.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  static String routeName = 'SignUp';
  static String routePath = '/signUp';

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  late SignUpModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignUpModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();

    _model.textController5 ??= TextEditingController();
    _model.textFieldFocusNode5 ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFFF0F5), Colors.white],
                stops: [1, 1],
                begin: AlignmentDirectional(0, -1),
                end: AlignmentDirectional(0, 1),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(25),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlutterFlowIconButton(
                            borderRadius: 20,
                            buttonSize: 40,
                            icon: Icon(
                              Icons.arrow_back_rounded,
                              color: Color(0xFF6A1B9A),
                              size: 24,
                            ),
                            onPressed: () async {
                              Navigator.pushNamed(context, '/');
                            },
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.shield,
                                color: Color(0xFF6A1B9A),
                                size: 24,
                              ),
                              Text(
                                'SafeGuard',
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF6A1B9A),
                                      fontSize: 28,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                              ),
                            ].divide(SizedBox(width: 8)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Create Account',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF6A1B9A),
                                  fontSize: 26,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                ),
                          ),
                          Text(
                            'Sign up to get started',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF757575),
                                  fontSize: 15,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ].divide(SizedBox(height: 8)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            TextFormField(
                              controller: _model.textController1,
                              focusNode: _model.textFieldFocusNode1,
                              autofocus: false,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Full Name',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF757575),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFE0E0E0),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF6A1B9A),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    50, 0, 16, 0),
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                  color: Color(0xFF757575),
                                  size: 20,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 16,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              keyboardType: TextInputType.name,
                              validator: _model.textController1Validator
                                  .asValidator(context),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[a-zA-Z\s]')),
                              ],
                            ),
                            TextFormField(
                              controller: _model.textController2,
                              focusNode: _model.textFieldFocusNode2,
                              autofocus: false,
                              textCapitalization: TextCapitalization.none,
                              textInputAction: TextInputAction.next,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Email Address',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF757575),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFE0E0E0),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF6A1B9A),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    50, 0, 16, 0),
                                prefixIcon: Icon(
                                  Icons.mail_outline,
                                  color: Color(0xFF757575),
                                  size: 20,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 16,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              keyboardType: TextInputType.emailAddress,
                              validator: _model.textController2Validator
                                  .asValidator(context),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[a-zA-Z0-9@._-]')),
                              ],
                            ),
                            TextFormField(
                              controller: _model.textController3,
                              focusNode: _model.textFieldFocusNode3,
                              autofocus: false,
                              textInputAction: TextInputAction.next,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Phone Number',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF757575),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFE0E0E0),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF6A1B9A),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    50, 0, 16, 0),
                                prefixIcon: Icon(
                                  Icons.phone_outlined,
                                  color: Color(0xFF757575),
                                  size: 20,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 16,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              keyboardType: TextInputType.phone,
                              validator: _model.textController3Validator
                                  .asValidator(context),
                            ),
                            TextFormField(
                              controller: _model.textController4,
                              focusNode: _model.textFieldFocusNode4,
                              autofocus: false,
                              textInputAction: TextInputAction.next,
                              obscureText: !_model.passwordVisibility1,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF757575),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFE0E0E0),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF6A1B9A),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    50, 0, 16, 0),
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: Color(0xFF757575),
                                  size: 20,
                                ),
                                suffixIcon: InkWell(
                                  onTap: () => safeSetState(
                                    () => _model.passwordVisibility1 =
                                        !_model.passwordVisibility1,
                                    context: context,
                                  ),
                                  focusNode: FocusNode(skipTraversal: true),
                                  child: Icon(
                                    _model.passwordVisibility1
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: Color(0xFF757575),
                                    size: 20,
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 16,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              keyboardType: TextInputType.visiblePassword,
                              validator: _model.textController4Validator
                                  .asValidator(context),
                            ),
                            // TextFormField(
                            //   controller: _model.textController5,
                            //   focusNode: _model.textFieldFocusNode5,
                            //   autofocus: false,
                            //   textInputAction: TextInputAction.done,
                            //   obscureText: !_model.passwordVisibility2,
                            //   decoration: InputDecoration(
                            //     hintText: 'Confirm Password',
                            //     hintStyle: FlutterFlowTheme.of(context)
                            //         .bodyMedium
                            //         .override(
                            //           font: GoogleFonts.inter(
                            //             fontWeight: FlutterFlowTheme.of(context)
                            //                 .bodyMedium
                            //                 .fontWeight,
                            //             fontStyle: FlutterFlowTheme.of(context)
                            //                 .bodyMedium
                            //                 .fontStyle,
                            //           ),
                            //           color: Color(0xFF757575),
                            //           letterSpacing: 0.0,
                            //           fontWeight: FlutterFlowTheme.of(context)
                            //               .bodyMedium
                            //               .fontWeight,
                            //           fontStyle: FlutterFlowTheme.of(context)
                            //               .bodyMedium
                            //               .fontStyle,
                            //         ),
                            //     enabledBorder: OutlineInputBorder(
                            //       borderSide: BorderSide(
                            //         color: Color(0xFFE0E0E0),
                            //         width: 1,
                            //       ),
                            //       borderRadius: BorderRadius.circular(12),
                            //     ),
                            //     focusedBorder: OutlineInputBorder(
                            //       borderSide: BorderSide(
                            //         color: Color(0xFF6A1B9A),
                            //         width: 1,
                            //       ),
                            //       borderRadius: BorderRadius.circular(12),
                            //     ),
                            //     errorBorder: OutlineInputBorder(
                            //       borderSide: BorderSide(
                            //         color: Color(0x00000000),
                            //         width: 1,
                            //       ),
                            //       borderRadius: BorderRadius.circular(12),
                            //     ),
                            //     focusedErrorBorder: OutlineInputBorder(
                            //       borderSide: BorderSide(
                            //         color: Color(0x00000000),
                            //         width: 1,
                            //       ),
                            //       borderRadius: BorderRadius.circular(12),
                            //     ),
                            //     filled: true,
                            //     fillColor: Colors.white,
                            //     contentPadding: EdgeInsetsDirectional.fromSTEB(
                            //         50, 0, 16, 0),
                            //     prefixIcon: Icon(
                            //       Icons.lock_outline,
                            //       color: Color(0xFF757575),
                            //       size: 20,
                            //     ),
                            //     suffixIcon: InkWell(
                            //       onTap: () => safeSetState(
                            //         () => _model.passwordVisibility2 =
                            //             !_model.passwordVisibility2,
                            //         context: context,
                            //       ),
                            //       focusNode: FocusNode(skipTraversal: true),
                            //       child: Icon(
                            //         _model.passwordVisibility2
                            //             ? Icons.visibility_outlined
                            //             : Icons.visibility_off_outlined,
                            //         color: Color(0xFF757575),
                            //         size: 20,
                            //       ),
                            //     ),
                            //   ),
                            //   style: FlutterFlowTheme.of(context)
                            //       .bodyMedium
                            //       .override(
                            //         font: GoogleFonts.inter(
                            //           fontWeight: FlutterFlowTheme.of(context)
                            //               .bodyMedium
                            //               .fontWeight,
                            //           fontStyle: FlutterFlowTheme.of(context)
                            //               .bodyMedium
                            //               .fontStyle,
                            //         ),
                            //         fontSize: 16,
                            //         letterSpacing: 0.0,
                            //         fontWeight: FlutterFlowTheme.of(context)
                            //             .bodyMedium
                            //             .fontWeight,
                            //         fontStyle: FlutterFlowTheme.of(context)
                            //             .bodyMedium
                            //             .fontStyle,
                            //       ),
                            //   keyboardType: TextInputType.visiblePassword,
                            //   validator: _model.textController5Validator
                            //       .asValidator(context),
                            // ),
                          ].divide(SizedBox(height: 18)),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    //   child: Row(
                    //     mainAxisSize: MainAxisSize.max,
                    //     children: [
                    //       Theme(
                    //         data: ThemeData(
                    //           checkboxTheme: CheckboxThemeData(
                    //             visualDensity: VisualDensity.compact,
                    //             materialTapTargetSize:
                    //                 MaterialTapTargetSize.shrinkWrap,
                    //             shape: RoundedRectangleBorder(
                    //               borderRadius: BorderRadius.circular(4),
                    //             ),
                    //           ),
                    //         ),
                    //         child: Checkbox(
                    //           value: _model.checkboxValue ??= false,
                    //           onChanged: (newValue) async {
                    //             safeSetState(
                    //                 () => _model.checkboxValue = newValue!,
                    //                 context: context);
                    //           },
                    //           activeColor: Color(0xFF6A1B9A),
                    //           checkColor: Colors.white,
                    //         ),
                    //       ),
                    //       Expanded(
                    //         // FIX: Removed the InkWell wrapper here.
                    //         // We use Padding for spacing instead.
                    //         child: Padding(
                    //           padding:
                    //               EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                    //           child: RichText(
                    //             textScaler: MediaQuery.of(context).textScaler,
                    //             text: TextSpan(
                    //               children: [
                    //                 TextSpan(
                    //                   text: 'I agree to ',
                    //                   style: FlutterFlowTheme.of(context)
                    //                       .bodyMedium
                    //                       .override(
                    //                         font: GoogleFonts.inter(),
                    //                         color: Color(0xFF757575),
                    //                         fontSize: 13,
                    //                       ),
                    //                   // LOGIC: Tapping "I agree to" toggles the checkbox
                    //                   recognizer: TapGestureRecognizer()
                    //                     ..onTap = () {
                    //                       safeSetState(
                    //                         () => _model.checkboxValue =
                    //                             !(_model.checkboxValue ??
                    //                                 false),
                    //                         context: context,
                    //                       );
                    //                     },
                    //                 ),
                    //                 TextSpan(
                    //                   text: 'Terms & Conditions',
                    //                   style: TextStyle(
                    //                     color: Color(0xFF6A1B9A),
                    //                     fontWeight: FontWeight.w500,
                    //                     fontSize: 13,
                    //                   ),
                    //                   // LOGIC: Tapping "Terms" navigates
                    //                   recognizer: TapGestureRecognizer()
                    //                     ..onTap = () {
                    //                       print('Terms clicked'); // Debug print
                    //                       Navigator.pushNamed(
                    //                           context, '/terms');
                    //                     },
                    //                 )
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Padding(
                    //   padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    //   child: Row(
                    //     mainAxisSize: MainAxisSize.max,
                    //     crossAxisAlignment:
                    //         CrossAxisAlignment.center, // Ensure alignment
                    //     children: [
                    //       // 1. The Checkbox (Removed Theme wrapper to fix touch area)
                    //       // Checkbox(
                    //       //   value: _model.checkboxValue ??= false,
                    //       //   onChanged: (newValue) async {
                    //       //     safeSetState(() {
                    //       //       _model.checkboxValue = newValue ?? true;
                    //       //     }, context: context);
                    //       //   },
                    //       //   activeColor: Color(0xFF6A1B9A),
                    //       //   checkColor: Colors.white,
                    //       //   side: BorderSide(
                    //       //     color: Color(0xFF757575), // Default border color
                    //       //     width: 2,
                    //       //   ),
                    //       // ),

                    //       // 2. The Text
                    //       // Expanded(
                    //       //   child: Padding(
                    //       //     padding:
                    //       //         EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                    //       //     child: RichText(
                    //       //       textScaler: MediaQuery.of(context).textScaler,
                    //       //       text: TextSpan(
                    //       //         children: [
                    //       //           TextSpan(
                    //       //             text: 'I agree to ',
                    //       //             style: FlutterFlowTheme.of(context)
                    //       //                 .bodyMedium
                    //       //                 .override(
                    //       //                   font: GoogleFonts.inter(),
                    //       //                   color: Color(0xFF757575),
                    //       //                   fontSize: 13,
                    //       //                 ),
                    //       //             // Logic: Tapping "I agree to" also toggles the box
                    //       //             recognizer: TapGestureRecognizer()
                    //       //               ..onTap = () {
                    //       //                 safeSetState(() {
                    //       //                   _model.checkboxValue =
                    //       //                       !(_model.checkboxValue ??
                    //       //                           false);
                    //       //                 }, context: context);
                    //       //               },
                    //       //           ),
                    //       //           TextSpan(
                    //       //             text: 'Terms & Conditions',
                    //       //             style: TextStyle(
                    //       //               color: Color(0xFF6A1B9A),
                    //       //               fontWeight: FontWeight.w600,
                    //       //               fontSize: 13,
                    //       //               decoration: TextDecoration
                    //       //                   .underline, // Added underline for clarity
                    //       //             ),
                    //       //             // Logic: Tapping "Terms" navigates
                    //       //             recognizer: TapGestureRecognizer()
                    //       //               ..onTap = () {
                    //       //                 Navigator.pushNamed(
                    //       //                     context, '/terms');
                    //       //               },
                    //       //           )
                    //       //         ],
                    //       //       ),
                    //       //     ),
                    //       //   ),
                    //       // ),
                    //     ],
                    //   ),
                    // ),

                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            return;
                          } // 2. Show Dialog to Force Agreement
                          bool? agreed = await showDialog<bool>(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: const Text('Terms of Service'),
                                // We use a Column inside SingleChildScrollView to hold the text and the link
                                content: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'To create an account, you must agree to our Terms & Conditions.',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      const SizedBox(height: 12),
                                      // Clickable Link to read terms
                                      InkWell(
                                        onTap: () {
                                          // Navigate to Terms page
                                          Navigator.pushNamed(
                                              context, '/terms');
                                        },
                                        child: const Text(
                                          'Read Terms & Conditions',
                                          style: TextStyle(
                                            color: Color(0xFF6A1B9A),
                                            fontWeight: FontWeight.bold,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  // Cancel Button

// [Image of no entry sign]

                                  TextButton(
                                    onPressed: () => Navigator.pop(
                                        alertDialogContext, false),
                                    child: const Text('Cancel',
                                        style: TextStyle(color: Colors.grey)),
                                  ),
                                  // Agree Button

// [Image of check mark]

                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext, true),
                                    child: const Text(
                                      'I Agree',
                                      style: TextStyle(
                                        color: Color(0xFF6A1B9A),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                          // If they clicked Cancel or clicked outside, stop here.
                          if (agreed != true) {
                            // User did not agree
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('You must agree to continue.')),
                            );
                            return;
                          }

                          // if (_model.checkboxValue != true) {
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     SnackBar(
                          //         content: Text(
                          //             'Please agree to Terms & Conditions')),
                          //   );
                          //   return;
                          // }

                          // --- FIX: Add .trim() to password to prevent "invisible space" errors ---
                          final name =
                              _model.textController1?.text.trim() ?? '';
                          final email = _model.textController2?.text.trim();
                          final phone = _model.textController3?.text.trim();
                          final password =
                              _model.textController4?.text.trim() ??
                                  ''; // Added .trim()

                          if (name.isEmpty ||
                              password.isEmpty ||
                              (email == null && phone == null)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('Please fill required fields')),
                            );
                            return;
                          }

                          // Call backend signup
                          try {
                            await AuthService().signup(
                              fullName: name,
                              phone: phone ?? '',
                              password: password,
                              email: email,
                            );

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content:
                                      Text('Signup successful. Please login.')),
                            );
                            Navigator.pushNamed(context, '/login');
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.toString())),
                            );
                          }
                        },
                        text: 'SIGN UP',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 60,
                          padding: EdgeInsets.all(8),
                          iconPadding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: Colors.purple,
                          textStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 17,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                          elevation: 3,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 25),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 80,
                            height: 1,
                            decoration: BoxDecoration(
                              color: Color(0xFFE0E0E0),
                            ),
                          ),
                          Text(
                            'OR',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF757575),
                                  fontSize: 14,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          Container(
                            width: 80,
                            height: 1,
                            decoration: BoxDecoration(
                              color: Color(0xFFE0E0E0),
                            ),
                          ),
                        ].divide(SizedBox(width: 12)),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: 'Google',
                          icon: Icon(
                            Icons.g_translate,
                            size: 20,
                          ),
                          options: FFButtonOptions(
                            width: 140,
                            height: 45,
                            padding: EdgeInsets.all(8),
                            iconPadding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            iconColor: Color(0xFFEA4335),
                            color: Colors.white,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.black,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            elevation: 1,
                            borderSide: BorderSide(
                              color: Color(0xFFE0E0E0),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: 'Facebook',
                          icon: Icon(
                            Icons.facebook,
                            size: 20,
                          ),
                          options: FFButtonOptions(
                            width: 140,
                            height: 45,
                            padding: EdgeInsets.all(8),
                            iconPadding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            iconColor: Colors.white,
                            color: Color(0xFF1877F2),
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            elevation: 1,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Already have an account? ',
                                    style: TextStyle(),
                                  ),
                                  TextSpan(
                                    text: 'Login',
                                    style: TextStyle(
                                      color: Color(0xFF6A1B9A),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF757575),
                                      fontSize: 14,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
