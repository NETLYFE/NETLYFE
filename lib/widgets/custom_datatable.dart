import 'package:flutter/material.dart';
import 'package:netlyfe/Utils/list_objects.dart';

class CustomDataTable extends StatefulWidget {
  const CustomDataTable({Key? key}) : super(key: key);

  @override
  _CustomDataTableState createState() => _CustomDataTableState();
}

class _CustomDataTableState extends State<CustomDataTable> {
  // late List<BPData> pdata;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: getColumns(bpColumnList),
      rows: getRows(bpdataList),
      horizontalMargin: 1,
      columnSpacing: 25,
    );
  }

  List<DataColumn> getColumns(List<String> columns) => bpColumnList
      .map((String colName) => DataColumn(
            label: Text(colName),
          ))
      .toList();

  List<DataRow> getRows(List<BPData> bpdata) => bpdata.map((BPData data) {
        final rowCell = [
          data.date,
          data.time,
          data.systolic,
          data.diastolic,
          data.pulse
        ];

        return DataRow(cells: getCells(rowCell));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((celldata) => DataCell(Text('$celldata'))).toList();
}