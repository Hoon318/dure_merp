import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';

import 'Import_stock_select.dart';



class import_stock_all_select extends StatefulWidget {
  const import_stock_all_select({Key? key}) : super(key: key);
  @override
  State<import_stock_all_select> createState() => _import_stock_all_selectState();
}

class _import_stock_all_selectState extends State<import_stock_all_select> {
  @override
  Widget build(BuildContext context) {
    final f_full_data = ModalRoute.of(context)!.settings.arguments; // 앞에 조회페이지로 부터 값들을 받아온다!
    List list = '${f_full_data}'.split(',');  // 받아온값을 리스트화 시켜준다 "," 를 기준으로 리스트화 시킴

    return Scaffold(
      appBar: AppBar(title: Text('재고실사조회'),),
      body: Column (
        children: [
          SizedBox(child: Text('${f_full_data}'),),   // 받아온값 전체 출력
          //SizedBox(child: Text('${f_full_data}'[1]),), // 받아온값에서 왼쪽 기준 몇번째 문자 한개출력
          //SizedBox(child: Text(list[2])), // 받아온 값이 리스트에 저장되어 몇번째 인덱스에 있는지 출력

          // 재고실사리스트 출력시 선택매장 표시 (왼쪽 정렬을 위해 align 추가)
          Align(child: SizedBox(child: Text(' 매장 : ' + list[1]),), alignment: Alignment.centerLeft,),

          // 조회를 위한 테이블 화면상 가로세로 스크롤을 위해 SingleChildScrollView, scrollDirection: Axis.horizontal 추가
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                // 컬럼에 색추가를 위한 작업
                headingRowColor: MaterialStateColor.resolveWith((states) => Colors.lightBlue),

                // 컬럼 생성
                columns: [
                  DataColumn(label: Text('생활재'),),
                  DataColumn(label: Text('실재고')),
                  DataColumn(label: Text('실사재고')),
                  DataColumn(label: Text('실사수량')),
                  DataColumn(label: Text('차이수량')),
                  DataColumn(label: Text('원가')),
                  DataColumn(label: Text('부가세')),
                  DataColumn(label: Text('폐기사유')),
                  DataColumn(label: Text('비고')),
                  DataColumn(label: Text('실사일자')),
                  DataColumn(label: Text('재고반영')),
                  DataColumn(label: Text('반영일자')),
                ],

                // 로우데이터 생성
                rows: [
                  DataRow(
                      cells: [
                        DataCell(Text('A177')),
                        DataCell(Text('B1')),
                        DataCell(Text('A1')),
                        DataCell(Text('B1')),
                        DataCell(Text('A1')),
                        DataCell(Text('B1')),
                        DataCell(Text('A1')),
                        DataCell(Text('B1')),
                        DataCell(Text('A1')),
                        DataCell(Text('B1')),
                        DataCell(Text('A1')),
                        DataCell(Text('B1')),
                      ]
                  ),
                  DataRow(
                      cells: [
                        DataCell(Text('A2')),
                        DataCell(Text('B2')),
                        DataCell(Text('A1')),
                        DataCell(Text('B1')),
                        DataCell(Text('A1')),
                        DataCell(Text('B1')),
                        DataCell(Text('A1')),
                        DataCell(Text('B1')),
                        DataCell(Text('A1')),
                        DataCell(Text('B1')),
                        DataCell(Text('A1')),
                        DataCell(Text('B1')),

                      ]
                  ),
                ],
              )
          ),

        ],
      ),

    );
  }
}