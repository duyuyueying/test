import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoo/util/rem.dart';

typedef RefreshCallback = Future<void> Function();
typedef LoadMoreCallback = Future<void> Function();

// 公告下拉刷新上拉加载组件
class ZooRefreshList extends StatefulWidget {
  // 下拉刷新回调
  final RefreshCallback onRefresh;
  // 上拉加载回调
  final LoadMoreCallback loadMore;
  // 数据列表长度
  final int itemCount;
  // 列表是否加载完毕
  final bool hasMore;
  // 列表项item
  final IndexedWidgetBuilder itemBuilder;
  // 加载每一页的数据
  final int pageSize;
  // 显示没有数据图标
  final bool noData;

  ZooRefreshList(
      {@required this.itemBuilder,
      @required this.itemCount,
      this.onRefresh,
      this.loadMore,
      this.hasMore,
      this.noData = false,
      this.pageSize = 20});

  @override
  _ZooRefreshListState createState() => _ZooRefreshListState();
}

class _ZooRefreshListState extends State<ZooRefreshList> {
  ScrollController _scrollController = ScrollController();
  // 是否正在加载数据
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (ScrollNotification note) {
        if (note.metrics.pixels == note.metrics.maxScrollExtent &&
            note.metrics.axis == Axis.vertical) {
          _loadMore();
        }
        return true;
      },
      child: RefreshIndicator(
          child: ListView.builder(
              controller: _scrollController,
              itemCount: widget.loadMore == null
                  ? widget.itemCount
                  : widget.itemCount + 1,
              itemBuilder: (BuildContext context, int index) {
                if (widget.loadMore == null) {
                  widget.itemBuilder(context, index);
                } else {
                  if(widget.noData) {
                    return SizedBox(
            height: 500,
            child: Center(child: Icon(Icons.rowing, size: 50,),),
          );
                  } else {
                    return index < widget.itemCount
                      ? widget.itemBuilder(context, index)
                      : MoreWidget(
                          widget.itemCount, widget.hasMore, widget.pageSize);
                  }
                }
              }),
          onRefresh: widget.onRefresh),
    );
  }

  Future _loadMore() async {
    if (widget.loadMore == null) {
      return;
    }
    if (_isLoading) {
      return;
    }
    if (!widget.hasMore) {
      return;
    }
    _isLoading = true;
    await widget.loadMore();
    _isLoading = false;
  }
}

class MoreWidget extends StatelessWidget {
  final int itemCount;
  final bool hasMore;
  final int pageSize;

  const MoreWidget(this.itemCount, this.hasMore, this.pageSize);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if (hasMore) CupertinoActivityIndicator(),
              Text(hasMore ? '正在加载中...' : (itemCount < pageSize) ? '' : '没有更多了')
            ]));
  }
}
