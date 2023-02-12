import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:http/http.dart' as http;


Future<Post> fetchPost() async {
  // 네트워크 요청하기
  String url = 'https://raw.githubusercontent.com/dev-yakuza/users/master/api.json';
  final response = await http.get(Uri.parse(url));

  // 네트워크 연결 되었는지 여부 확인
  if (response.statusCode == 200) {
    // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.
    return Post.fromJson(json.decode(response.body));
  } else {
    // 만약 요청이 실패하면, 에러를 던집니다.
    throw Exception('Failed to load post');
  }
}

// 위 네트워크 요청으로 받아온 json 파일을 dart 문법으로 변환하기
class Post {
  final int name;
  final int photo;

  Post({required this.name, required this.photo});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      name: json['name'],
      photo: json['photo'],
    );
  }
}





class import_stock_all_select extends StatefulWidget {
  const import_stock_all_select({Key? key}) : super(key: key);
  @override
  State<import_stock_all_select> createState() => _import_stock_all_selectState();
}

class _import_stock_all_selectState extends State<import_stock_all_select> {
  // 위에서 json -> dart로 바꾼 데이터 가져오기
  late Future<Post> post;
  void initState() {
    super.initState();
    post = fetchPost();
  }

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

          // 위에서 가져온 dart 네트워크 데이터 출력
          FutureBuilder<Post>(
          future: post,
          builder: (context, snapshot) {
          if (snapshot.hasData) {
          return
            // json 파일을 보면 "title": 이부분 뒤에 있는 내용을 출력하게 해준다.
            //Text(snapshot.data!.body);

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
                  ],

                  // 로우데이터 생성
                  rows: [
                    DataRow(
                        cells: [
                          // json 파일을 보면 "title": 이부분 뒤에 있는 내용을 출력하게 해준다. 인트값은 tostring 붙여서 형변환해줘야한다.
                          DataCell(Text(snapshot.data!.name.toString())),
                          DataCell(Text(snapshot.data!.photo.toString())),
                        ]
                    ),
                    DataRow(
                        cells: [
                          DataCell(Text(snapshot.data!.name.toString())),
                          DataCell(Text(snapshot.data!.photo.toString())),
                        ]
                    ),
                  ],
                )
            );
          } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
          }

          // 기본적으로 로딩 Spinner를 보여줍니다.
          return CircularProgressIndicator();
          },
          ),

        ],
      ),

    );
  }
}