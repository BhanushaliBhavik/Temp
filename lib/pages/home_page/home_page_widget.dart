import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: 200.0,
                  height: 200.0,
                  child: custom_widgets.CircuarProgessBar(
                    width: 200.0,
                    height: 200.0,
                    progress: 0.12,
                  ),
                ),
              ),
              Container(
                width: 200.0,
                height: 200.0,
                child: custom_widgets.CircularPregressBarWithValue(
                  width: 200.0,
                  height: 200.0,
                  progress: 0.5,
                  thickness: 12,
                ),
              ),
              Container(
                width: 300.0,
                height: 300.0,
                child: custom_widgets.ImageWithLoadingIndicator(
                  width: 300.0,
                  height: 300.0,
                  url:
                      'https://cdn.pixabay.com/photo/2024/01/05/11/14/lake-8489336_640.jpg',
                  borderRadius: 12.0,
                ),
              ),
            ].divide(SizedBox(height: 20.0)).around(SizedBox(height: 20.0)),
          ),
        ),
      ),
    );
  }
}
