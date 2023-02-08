import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/in_out_detail/import_stock_all_select.dart';

// 매장 목록
final maejang = ['전체 ','점포1','점포2'];
String f_maejang = '';
// 대분류 목록
final firstcode = ['전체 ','대분류1','대분류2'];
String f_firstcode = '';
// 중분류 목록
final secondcode = ['전체 ','중분류1','중분류2'];
String f_secondcode = '';

// 체크박스 상태
var jaego = false; //(-)재고
var chae = false; // 차이
var mesilsa = false; // 미실사
var jeoe = false; // 0제외
var noreason = false; // 폐기사유없는실사

// 텍스트필드값 얻어오기
final goodscode = TextEditingController();
final goodsname = TextEditingController();
final barcode = TextEditingController();


// 입력값을 받아야 하는데 조회시 입력값 없을때 포커스 주려고 객체를 생성해준다. focus를 통해 빈공간 이동하게함
//FocusNode tfocus = FocusNode();


class import_stock_select extends StatefulWidget {
  const import_stock_select({Key? key}) : super(key: key);

  @override
  State<import_stock_select> createState() => _import_stock_selectState();
}

class _import_stock_selectState extends State<import_stock_select> {
  // 뒤로가기 후 다시 들어오면 조회조건 초기화 되도록 설정
  void initState() {
    super.initState();
    setState(() {
      jaego = false; chae = false; mesilsa = false; jeoe = false; noreason = false;
      f_maejang = maejang[0]; f_firstcode = firstcode[0]; f_secondcode = secondcode[0];
      goodscode.clear(); goodsname.clear(); barcode.clear();
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: Text('재고실사입력 조회'), ),
        body: SingleChildScrollView( // 키보드 출력시 오류 나오는거 해결
          child : Column(
            children: [
              // 매장 셀렉 박스
              SizedBox(
                height: 70, // 칸의 여백
                child : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('매장'),
                    DropdownButton(
                      //focusNode: tfocus,  // 포커스를 잡아주기 위해 해당 필드 포커스네임 설정
                      value: f_maejang,
                      items: maejang
                          .map((e) => DropdownMenuItem(
                        value: e, // 선택 시 onChanged 를 통해 반환할 value
                        child: Text(e),
                      ))
                          .toList(),
                      onChanged: (value) { // items 의 DropdownMenuItem 의 value 반환
                        setState(() {
                          f_maejang = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),

              // 대분류 셀렉 박스
              SizedBox(
                  height: 70, // 칸의 여백
                  child :Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('대분류'),
                      DropdownButton(
                        value: f_firstcode,
                        items: firstcode
                            .map((e) => DropdownMenuItem(
                          value: e, // 선택 시 onChanged 를 통해 반환할 value
                          child: Text(e),
                        ))
                            .toList(),
                        onChanged: (value) { // items 의 DropdownMenuItem 의 value 반환
                          setState(() {
                            f_firstcode = value!;
                          });
                        },
                      ),
                    ],
                  )
              ),

              // 중분류 셀렉 박스
              SizedBox(
                  height: 70, // 칸의 여백
                  child :Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('중분류'),
                      DropdownButton(
                        value: f_secondcode,
                        items: secondcode
                            .map((e) => DropdownMenuItem(
                          value: e, // 선택 시 onChanged 를 통해 반환할 value
                          child: Text(e),
                        ))
                            .toList(),
                        onChanged: (value) { // items 의 DropdownMenuItem 의 value 반환
                          setState(() {
                            f_secondcode = value!;
                          });
                        },
                      ),
                    ],
                  )
              ),

              // 생활재 코드 입력
              SizedBox(
                height: 70,
                child:
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '생활재 코드 입력',
                  ),
                  controller: goodscode, // 입력값 저장
                ),
              ),


              // 생활재명 입력
              SizedBox(
                height: 70,
                child:
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '생활재명 입력'
                  ),
                  controller: goodsname, // 입력값 저장
                ),
              ),

              // 바코드 입력
              SizedBox(
                height: 70,
                child:
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '바코드 입력'
                  ),
                  controller: barcode, // 입력값 저장
                ),
              ),

              // 각종 체크 박스(재고, 차이, 미실사, 0제외, 폐기사유없는실사
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('(-)재고'),
                  Checkbox(value: jaego, onChanged: (value){setState(() { jaego = value!; }); }),
                  Text('차이'),
                  Checkbox(value: chae, onChanged: (value){setState(() { chae = value!; }); }),
                  Text('미실사'),
                  Checkbox(value: mesilsa, onChanged: (value){setState(() { mesilsa = value!; }); }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('(0)제외'),
                  Checkbox(value: jeoe, onChanged: (value){setState(() { jeoe = value!; }); }),
                  Text('폐기사유없는실사'),
                  Checkbox(value: noreason, onChanged: (value){setState(() { noreason = value!; }); }),
                ],
              ),


              // 조회 버튼
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // 값 넘길 때 변수 :
                  // [f_maejang, f_firstcode, f_secondcode] 셀렉박스에서 선택한 값으로 값 전달
                  // [goodscode, goodsname, barcode] 저장된 값으로 전달
                  // [jaego, chae, mesilsa, jeoe, noreason] ture/ false 로 값전달
                  CupertinoButton(child: const Text('조회'), onPressed: () {selectt();}),
                  CupertinoButton(child: const Text('초기화'), onPressed: () {
                    setState(() {
                      jaego = false; chae = false; mesilsa = false; jeoe = false; noreason = false;
                      f_maejang = maejang[0]; f_firstcode = firstcode[0]; f_secondcode = secondcode[0];
                      goodscode.clear(); goodsname.clear(); barcode.clear(); ;
                    });
                  }),
                ],
              ),

            ],
          ),
        )
    );
  }


  void selectt() {
    //print(jaego); // 값 찍어보기
    String f_maejang_data =f_maejang; // 매장정보 저장하기
    String f_firstcode_data =f_firstcode; // 대분류정보 저장하기
    String f_secondcode_data =f_secondcode; // 중분류정보 저장하기
    String goodscode_data = goodscode.text; // 생활재코드정보 저장하기
    String goodsname_data = goodsname.text; // 생활재명정보 저장하기
    String barcode_data = barcode.text; // 바코드코드정보 저장하기
    var jaego_data = jaego; // 재고정보 저장하기
    var chae_data = chae; // 차이정보 저장하기
    var mesilsa_data = mesilsa; // 미실사정보 저장하기
    var jeoe_data = jeoe; // (0)제외정보 저장하기
    var noreason_data = noreason; // 폐기사유없는실사정보 저장하기

    // 최소 조건은 맞추기 위한 if 문 (매장 선택 필수)
    if((f_maejang_data).trim() == '전체')
    {
      // 매장 미선택시 매장선택 팝업창을 띄우기 위해출력
      _majang_select_Q();
    }
    else
    {
      // arguments로 값을 넘길때 앞뒤로 '' 준것은 뒷단에서 리스트화 시킬때 [ ] 이것이 포함되어 제거하기 위해 추가
      // '/import_stock_all_select' 이것은 main 에 선언한 재고실사조회화면 별칭 <- 지정해줘야 값넘김
      Navigator.pushNamed
        (context, '/import_stock_all_select',
          arguments: ['',
            f_maejang_data,
            f_firstcode_data,
            f_secondcode_data,
            goodscode_data,
            goodsname_data,
            barcode_data,
            jaego_data,
            chae_data,
            mesilsa_data,
            jeoe_data,
            noreason_data, '']);
    }
  }

  // 매장 미선택시 팝업창 띄우는 화면
  Future<void> _majang_select_Q() async {
    return showDialog<void>(
      //다이얼로그 위젯 소환
      context: context,
      barrierDismissible: false, // 다이얼로그 이외의 바탕 눌러도 안꺼지도록 설정
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('매장 확인'),
          content: SingleChildScrollView(
            child: ListBody(
              //List Body를 기준으로 Text 설정
              children: <Widget>[Text('매장을 선택해 주세요.'),],
            ),
          ),
          actions: [
            // 확인 클릭시 뒤로가기 실행됨
            TextButton(
              child: Text('확인'),
              onPressed: () { Navigator.of(context).pop();},
            ),
          ],
        );
      },
    );
  }

}
