import 'package:flutter/material.dart';
import 'package:flutter_zoo/pages/teamList/team_list_item.dart';
import 'package:flutter_zoo/util/rem.dart';
import 'package:flutter_zoo/widget/zoo_refresh_list.dart';
const MAX_PAGE = 4;
class TeamListWidget extends StatefulWidget {

  TeamListWidget({Key key}): super(key: key);
  @override
  _TeamListWidgetState createState() => _TeamListWidgetState();
}

class _TeamListWidgetState extends State<TeamListWidget> {
  int _page = 1;
  List _datalist = [];
  bool _noData = false;
  @override
  void initState() {
   
    // TODO: implement initState
    super.initState();
     getData();
  }

  @override
  Widget build(BuildContext context) {
    return ZooRefreshList(
      onRefresh: getData,
      loadMore: _loadMore,
      hasMore: _page < MAX_PAGE,
      noData: _noData,
      itemBuilder:(_,index){
      // return SizedBox(
      //         height: 50,
      //         child: Text(_datalist[index]),
      //       );
      return TeamListItem('1389....412', '2020-04-23 10:43', 'Lv.3');
    } , itemCount: _datalist.length) ;
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
