import 'package:flutter/material.dart';
import 'package:template_method/template_method/template_method.dart';
import 'package:template_method/widgets/layout_constant.dart';


import 'students_section.dart';

class TemplateMethodExample extends StatelessWidget {
  const TemplateMethodExample();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Template method demo", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: LayoutConstants.paddingL,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                StudentsSection(
                  bmiCalculator: StudentsXmlBmiCalculator(),
                  headerText: 'Students from XML data source:',
                ),
                const SizedBox(height: LayoutConstants.spaceL),
                StudentsSection(
                  bmiCalculator: StudentsJsonBmiCalculator(),
                  headerText: 'Students from JSON data source:',
                ),
                const SizedBox(height: LayoutConstants.spaceL),
                StudentsSection(
                  bmiCalculator: TeenageStudentsJsonBmiCalculator(),
                  headerText: 'Students from JSON data source (teenagers only):',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
