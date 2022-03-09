import 'package:flutter/material.dart';
import 'package:netlyfe/Utils/list_objects.dart';

class CustomDiabetesDataTable extends StatefulWidget {
  const CustomDiabetesDataTable({Key? key}) : super(key: key);

  @override
  State<CustomDiabetesDataTable> createState() =>
      _CustomDiabetesDataTableState();
}

class _CustomDiabetesDataTableState extends State<CustomDiabetesDataTable> {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: getColumns(diabetesColumnList),
      rows: getRows(diabetesdataList),
      horizontalMargin: 1,
      columnSpacing: 25,
    );
  }

  List<DataColumn> getColumns(List<String> columns) => diabetesColumnList
      .map((String colName) => DataColumn(
            label: Text(colName),
          ))
      .toList();

  List<DataRow> getRows(List<DiabetesData> bpdata) =>
      bpdata.map((DiabetesData data) {
        final rowCell = [
          data.date,
          data.time,
          data.testtype,
          data.value,
        ];

        return DataRow(cells: getCells(rowCell));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((celldata) => DataCell(Text('$celldata'))).toList();
}
