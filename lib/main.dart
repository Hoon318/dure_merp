import 'package:flutter/material.dart';
import 'package:untitled2/guest_goods_detail/guest_select.dart';
import 'package:untitled2/in_out_detail/Import_stock_select.dart';
import 'package:untitled2/in_out_detail/import_stock_all_select.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(  // MaterialApp 이 Scaffold를 포함한다
      routes: {
        '/import_stock_all_select' : (context) => import_stock_all_select(), // 데이터 값을 전달해주기 위해 해당 경로의 이름을 설정해준다 '' 안에 있는게 이름
      },
      home: MainAppbar(),
    );

  }
}


class MainAppbar extends StatefulWidget {
  const MainAppbar({Key? key}) : super(key: key);

  @override
  State<MainAppbar> createState() => _MainAppbarState();
}

class _MainAppbarState extends State<MainAppbar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,  // 4개의 네비게이터
        child: Scaffold(
          appBar: AppBar(title: Text('Main Merp'),
            bottom: TabBar(
              tabs: <Widget>[
                Text('조합원\n생활재'),
                Text('주문\n관리'),
                Text('입출고\n관리'),
                Text('분석\n자료')
              ],
            ),
          ),
          //body: bodybasic(),
          body: TabBarView( // 네비게이터 선택시 어디로 갈지
            children: <Widget>[
              Container(child: guest_goods_list(),),
              Container(child: order_list(),),
              Container(child: in_out_list(),),
              Container(child: analyze_list(),),
            ],
          ),
        )
    );
  }
}





// 조합원 생활재  리스트
class guest_goods_list extends StatefulWidget {
  const guest_goods_list({Key? key}) : super(key: key);

  @override
  State<guest_goods_list> createState() => _guest_goods_listState();
}

class _guest_goods_listState extends State<guest_goods_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical, // 스크롤

        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.add),
            // onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => guest_select()));},             // 전체 화면
            // onTap: () {Navigator.push(context, DialogRoute(context: context, builder: (context) => guest_select()));},    //투명색
            // onTap: () => {TabBarView( children: [Container(child: guest_select(),)],)},
            onTap: () {setState(() {

            });},
            title: Text('조합원'),),

          ListTile(
            leading: const Icon(Icons.add),
            onTap: () {},
            title: Text('조합원_신규가입(매장)'),),

          ListTile(
            leading: const Icon(Icons.add),
            onTap: () {},
            title: Text('출자/외상금'),),

          ListTile(
            leading: const Icon(Icons.add),
            onTap: () {},
            title: Text('수동연체관리'),),

          ListTile(
            leading: const Icon(Icons.add),
            onTap: () {},
            title: Text('생활재조회'),),

          ListTile(
            leading: const Icon(Icons.add),
            onTap: () {},
            title: Text('생활재가격표'),),

          ListTile(
            leading: const Icon(Icons.add),
            onTap: () {},
            title: Text('몰_상세정보(조회)'),),

        ],
      ),
    );
  }
}



// 주문관리 리스트
class order_list extends StatefulWidget {
  const order_list({Key? key}) : super(key: key);

  @override
  State<order_list> createState() => _order_listState();
}

class _order_listState extends State<order_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical, // 스크롤

        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.add),
            onTap: () {},
            title: Text('매장주문'),),

          ListTile(
            leading: const Icon(Icons.add),
            onTap: () {},
            title: Text('그루터기예약'),),

          ListTile(
            leading: const Icon(Icons.add),
            onTap: () {},
            title: Text('택배예약'),),

          ListTile(
            leading: const Icon(Icons.add),
            onTap: () {},
            title: Text('택배예약(엑셀)'),),


        ],
      ),
    );
  }
}



// 입출고 관리 리스트
class in_out_list extends StatefulWidget {
  const in_out_list({Key? key}) : super(key: key);

  @override
  State<in_out_list> createState() => _in_out_listState();
}

class _in_out_listState extends State<in_out_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical, // 스크롤

        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.add),
            onTap: () {},
            title: Text('연합검수'),),

          ListTile(
            leading: const Icon(Icons.add),
            onTap: () {},
            title: Text('연합검수확정'),),

          ListTile(
            leading: const Icon(Icons.add),
            onTap: () {},
            title: Text('반품(그루터기)'),),

          ListTile(
            leading: const Icon(Icons.add),
            onTap: () {},
            title: Text('공급명세서(그루터기)'),),

          ListTile(
            leading: const Icon(Icons.add),
            onTap: () {},
            title: Text('재고폐기'),),

          ListTile(
            leading: const Icon(Icons.add),
            onTap: () {},
            title: Text('재고폐기요청'),),

          ListTile(
            leading: const Icon(Icons.add),
            onTap: () {},
            title: Text('재고폐기 확정'),),

          ListTile(
            leading: const Icon(Icons.add),
            onTap: () {},
            title: Text('재고이동'),),

          ListTile(
            leading: const Icon(Icons.add),
            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => import_stock_select()));},             // 전체 화면
            title: Text('재고실사입력'),),

          ListTile(
            leading: const Icon(Icons.add),
            onTap: () {},
            title: Text('매장별 재고내역'),),

        ],
      ),
    );
  }
}



// 분석자료 리스트
class analyze_list extends StatefulWidget {
  const analyze_list({Key? key}) : super(key: key);

  @override
  State<analyze_list> createState() => _analyze_listState();
}

class _analyze_listState extends State<analyze_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical, // 스크롤

        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.add),
            onTap: () {},
            title: Text('POS매출'),),

          ListTile(
            leading: const Icon(Icons.add),
            onTap: () {},
            title: Text('월별매출(달력)'),),

          ListTile(
            leading: const Icon(Icons.add),
            onTap: () {},
            title: Text('시간대별 매출분석'),),

          ListTile(
            leading: const Icon(Icons.add),
            onTap: () {},
            title: Text('분류별 매출현황'),),

          ListTile(
            leading: const Icon(Icons.add),
            onTap: () {},
            title: Text('당일 매출분석'),),

          ListTile(
            leading: const Icon(Icons.add),
            onTap: () {},
            title: Text('전일 매출분석'),),

          ListTile(
            leading: const Icon(Icons.add),
            onTap: () {},
            title: Text('전년대비성장율(업장)'),),

          ListTile(
            leading: const Icon(Icons.add),
            onTap: () {},
            title: Text('전년대비성장율(단협)'),),

          ListTile(
            leading: const Icon(Icons.add),
            onTap: () {},
            title: Text('생활재별 판매합계'),),

        ],
      ),
    );
  }
}