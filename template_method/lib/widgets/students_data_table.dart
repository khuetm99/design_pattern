import 'package:flutter/material.dart';
import 'package:template_method/template_method/template_method.dart';
import 'package:template_method/widgets/layout_constant.dart';



class StudentsDataTable extends StatelessWidget {
  final List<Student> students;

  const StudentsDataTable({
    required this.students,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: LayoutConstants.spaceM,
        horizontalMargin: LayoutConstants.marginM,
        headingRowHeight: LayoutConstants.spaceXL,
        dataRowHeight: LayoutConstants.spaceXL,
        columns: const <DataColumn>[
          DataColumn(
            label: Text(
              'Name',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
          ),
          DataColumn(
            label: Text(
              'Age',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            numeric: true,
          ),
          DataColumn(
            label: Text(
              'Height',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            numeric: true,
          ),
          DataColumn(
            label: Text(
              'Weight',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            numeric: true,
          ),
          DataColumn(
            label: Text(
              'BMI',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            numeric: true,
          ),
        ],
        rows: <DataRow>[
          for (var student in students)
            DataRow(
              cells: <DataCell>[
                DataCell(Text(student.fullName)),
                DataCell(Text(student.age.toString())),
                DataCell(Text(student.height.toString())),
                DataCell(Text(student.weight.toString())),
                DataCell(
                  Text(
                    student.bmi.toStringAsFixed(2),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
