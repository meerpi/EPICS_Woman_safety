import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'welcome_page2_model.dart';
export 'welcome_page2_model.dart';

class WelcomePage2Widget extends StatefulWidget {
  const WelcomePage2Widget({super.key});

  static String routeName = 'WelcomePage2';
  static String routePath = '/';

  @override
  State<WelcomePage2Widget> createState() => _WelcomePage2WidgetState();
}

class _WelcomePage2WidgetState extends State<WelcomePage2Widget> {
  late WelcomePage2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = WelcomePage2Model();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
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
                colors: [Color(0xFFF3E5F5), Color(0xFFE1BEE7)],
                stops: [0, 1],
                begin: AlignmentDirectional(0, -1),
                end: AlignmentDirectional(0, 1),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 40, 24, 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?w=500',
                          width: 280,
                          height: 215,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        'SafeGuard',
                        style: FlutterFlowTheme.of(context)
                            .displaySmall
                            .override(
                              fontFamily: 'Inter Tight',
                              color: Color(0xFF6A1B9A),
                              fontSize: 32,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Your Safety, Our Priority',
                        style: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily: 'Inter',
                              color: Color(0xFF757575),
                              fontSize: 16,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FFButtonWidget(
                        onPressed: () {
                          // Emergency call functionality
                          // In a real app, this would dial 1091
                          print('Calling emergency number 1091...');
                        },
                        text: '🚨 EMERGENCY CALL - 1091',
                        icon: Icon(Icons.phone, size: 24),
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.85,
                          height: 65,
                          padding: EdgeInsets.all(8),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          iconColor: Colors.white,
                          color: Color(0xFFD32F2F),
                          textStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: 'Inter Tight',
                                color: Colors.white,
                                fontSize: 18,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                          elevation: 4,
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      SizedBox(height: 16),
                      FFButtonWidget(
                        onPressed: () {
                          // Emergency call to 112
                          // In a real app, this would dial 112
                          print('Calling emergency number 112...');
                        },
                        text: 'Call 112',
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.85,
                          height: 55,
                          padding: EdgeInsets.all(8),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: Color(0xFFFF6F00),
                          textStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: 'Inter Tight',
                                color: Colors.white,
                                fontSize: 18,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                          elevation: 3,
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      SizedBox(height: 16),
                      FFButtonWidget(
                        onPressed: () async {
                          Navigator.pushNamed(context, '/login');
                        },
                        text: 'Login',
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.85,
                          height: 50,
                          padding: EdgeInsets.all(8),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: Colors.white,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: 'Inter Tight',
                                color: Colors.purple,
                                fontSize: 16,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                          elevation: 0,
                          borderSide: BorderSide(color: Colors.purple, width: 2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: Color(0xFF757575),
                                  fontSize: 14,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          SizedBox(width: 4),
                          InkWell(
                            onTap: () async {
                              Navigator.pushNamed(context, '/signup');
                            },
                            child: Text(
                              'Sign Up',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Colors.purple,
                                    fontSize: 14,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0xFFD32F2F),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.sos, color: Colors.white, size: 20),
                          ),
                          SizedBox(width: 24),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.location_on, color: Colors.white, size: 20),
                          ),
                          SizedBox(width: 24),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.contacts, color: Colors.white, size: 20),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Available 24/7 • Confidential',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Inter',
                              color: Color(0xFF757575),
                              fontSize: 12,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
