import 'package:flutter/material.dart';
import 'package:flutter_zoo/pages/extensionIncome/list_item.dart';
import 'package:flutter_zoo/pages/teamList/team_list_widget.dart';
import 'package:flutter_zoo/util/colors.dart';
import 'package:flutter_zoo/util/rem.dart';
import 'package:flutter_zoo/widget/zoo_refresh_list.dart';

class ExtensionIncome extends StatefulWidget {
  @override
  _ExtensionIncomeState createState() => _ExtensionIncomeState();
}

class _ExtensionIncomeState extends State<ExtensionIncome>{
  int _page = 1;
  List _datalist = [];
  bool _noData = false;
  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ZooColors.progressBgColor,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: ZooColors.whiteColor,
            textTheme: TextTheme(
                title: TextStyle(
                    color: ZooColors.fontColorBlack,
                    fontSize: Rem.getPxToRem(48),
                    fontWeight: FontWeight.w600)),
            iconTheme: IconThemeData(color: ZooColors.fontColorBlack),
            title: Text('推广收益')),
        body: Container(
          color: Colors.white,
          margin: EdgeInsets.only(top: Rem.getPxToRem(30)),
          child: ZooRefreshList(
            onRefresh: getData,
            loadMore: _loadMore,
            hasMore: _page < MAX_PAGE,
            noData: _noData,
            itemBuilder:(_,index){
            // return SizedBox(
            //         height: 50,
            //         child: Text(_datalist[index]),
            //       );
            return ExtensionIncomeListItem('观光团收益', '2020-04-23 10:43', '0.78');
          } , itemCount: _datalist.length)),
        );
  }

  Future getData() async {
    await Future.delayed(Duration(seconds: 2), () {
      // mounted用来判断当前页面是否还存在的标志
      if(mounted) {
        setState(() {
          // _noData = true;
          _page = 1;
          _datalist = List.generate(15, (i) => '哈喽,我是原始数据 $i');
        });
      }
    });
  }

  Future _loadMore() async {
    await Future.delayed(Duration(seconds: 3), () {
      print('加载更多');
      setState(() {
        _datalist.addAll(List.generate(5, (i) => "第$_page次拉上来的数据"));
        _page++;
      });
    });
  }
}
