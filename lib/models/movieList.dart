import 'package:learn_flutter/models/date.dart';
import 'package:learn_flutter/models/movie.dart';

class MovieList {
  List<Movie> movies;
  int page;
  int totalResults;
  Date dates;
  int totalPages;

  MovieList(
      {this.movies,
        this.page,
        this.totalResults,
        this.dates,
        this.totalPages});

  MovieList.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      movies = new List<Movie>();
      json['results'].forEach((v) {
        movies.add(new Movie.fromJson(v));
      });
    }
    page = json['page'];
    totalResults = json['total_results'];
    dates = json['dates'] != null ? new Date.fromJson(json['dates']) : null;
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.movies != null) {
      data['results'] = this.movies.map((v) => v.toJson()).toList();
    }
    data['page'] = this.page;
    data['total_results'] = this.totalResults;
    if (this.dates != null) {
      data['dates'] = this.dates.toJson();
    }
    data['total_pages'] = this.totalPages;
    return data;
  }
}