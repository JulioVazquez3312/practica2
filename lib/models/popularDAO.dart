class Popular {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;
}

class Results {
  int? voteCount;
  String? posterpath;
  String? backdrop_path;
  String? title;
  int? id;
  String? overWiew;
  String? release_date;

  Results(this.voteCount, this.posterpath, this.backdrop_path, this.title,
      this.id, this.overWiew, this.release_date);

  factory Results.fromMap(Map<String, dynamic> map) {
    return Results(
      map['vote_count'],
      map['poster_path'],
      map['backdrop_path'],
      map['title'],
      map['id'],
      map['overview'],
      map['release'],
    );
  }
}
