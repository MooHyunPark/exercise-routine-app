import 'package:flutter/material.dart';
import 'package:projectsampledata/ui/pages/user/plan_detail_page/widgets/plan_detail_body.dart';

import '../../../common_widgets/custom_navigator.dart';

class PlanDetailPage extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomNavigation(scaffoldKey),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("계획 상세", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: PlanDetailBody(),
    );
  }
}