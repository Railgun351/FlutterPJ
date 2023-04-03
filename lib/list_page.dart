import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_connect_test/post_dto.dart';
import 'package:flutter_connect_test/post_repository.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

class ListPage extends HookWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final listState = useState<List<MovieDTO>?>(null);

    useEffect(() {
     PostRepository.instance.getDTOList().then((value){
       listState.value = value;
     });
    },[]);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: listState.value?.map((e) => ListItem(movieDTOTable: e)).toList()??[],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {

  MovieDTO movieDTOTable;

  ListItem({Key? key, required this.movieDTOTable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.black)),
      child: Column(
        children: [
          Text("랭크 : ${movieDTOTable.rank}"),
          Divider(),
          Text("관객수 : ${movieDTOTable.audiCnt}"),
          Divider(),
          Text("영화이름 : ${movieDTOTable.movieNm}"),
          Divider(),
          Text("개봉일 : ${movieDTOTable.openDt}"),
        ],
      ),
    );
  }
}
