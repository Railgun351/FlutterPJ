import 'dart:convert';

class MovieDTO {
  final String rank;
  final String audiCnt;
  final String movieNm;
  final String openDt;

  MovieDTO({required this.rank, required this.audiCnt, required this.movieNm, required this.openDt});

  factory MovieDTO.fromJson(dynamic json) => MovieDTO(rank: json["rank"], audiCnt: json["audiCnt"], movieNm: json["movieNm"], openDt: json["openDt"]);

  static List<MovieDTO> fromJsonList(List jsonList){
    return jsonList.map((json) => MovieDTO.fromJson(json)).toList();
  }
}