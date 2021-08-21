class Movies {
  List<Result> result;
  QueryParam queryParam;
  int code;
  String message;

  Movies({this.result, this.queryParam, this.code, this.message});

  Movies.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = new List<Result>();
      json['result'].forEach((v) {
        result.add(new Result.fromJson(v));
      });
    }
    queryParam = json['queryParam'] != null
        ? new QueryParam.fromJson(json['queryParam'])
        : null;
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    if (this.queryParam != null) {
      data['queryParam'] = this.queryParam.toJson();
    }
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}

class Result {
  String sId;
  List<String> director;
  List<String> writers;
  List<String> stars;
  int releasedDate;
  List<String> productionCompany;
  String title;
  String language;
  int runTime;
  String genre;
  List<Voted> voted;
  int pageViews;
  String description;
  String poster;
  int totalVoted;
  int voting;
  List<String> upVoted;
  List<String> downVoted;

  Result(
      {this.sId,
      this.director,
      this.writers,
      this.stars,
      this.releasedDate,
      this.productionCompany,
      this.title,
      this.language,
      this.runTime,
      this.genre,
      this.voted,
      this.pageViews,
      this.description,
      this.poster,
      this.totalVoted,
      this.voting,
      this.upVoted,
      this.downVoted});

  Result.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    director = json['director'].cast<String>();
    writers = json['writers'].cast<String>();
    stars = json['stars'].cast<String>();
    releasedDate = json['releasedDate'];
    productionCompany = json['productionCompany'].cast<String>();
    title = json['title'];
    language = json['language'];
    runTime = json['runTime'] ?? 0;
    genre = json['genre'];
    if (json['voted'] != null) {
      voted = new List<Voted>();
      json['voted'].forEach((v) {
        voted.add(new Voted.fromJson(v));
      });
    }
    pageViews = json['pageViews'];
    description = json['description'];
    poster = json['poster'] ??
        "https://st4.depositphotos.com/14953852/22772/v/600/depositphotos_227725020-stock-illustration-image-available-icon-flat-vector.jpg";
    totalVoted = json['totalVoted'];
    voting = json['voting'];
    upVoted = json['upVoted']?.cast<String>();
    downVoted = json['downVoted']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['director'] = this.director;
    data['writers'] = this.writers;
    data['stars'] = this.stars;
    data['releasedDate'] = this.releasedDate;
    data['productionCompany'] = this.productionCompany;
    data['title'] = this.title;
    data['language'] = this.language;
    data['runTime'] = this.runTime;
    data['genre'] = this.genre;
    if (this.voted != null) {
      data['voted'] = this.voted.map((v) => v.toJson()).toList();
    }
    data['pageViews'] = this.pageViews;
    data['description'] = this.description;
    data['poster'] = this.poster;
    data['totalVoted'] = this.totalVoted;
    data['voting'] = this.voting;
    data['upVoted'] = this.upVoted;
    data['downVoted'] = this.downVoted;
    return data;
  }
}

class Voted {
  List<String> upVoted;
  List<String> downVoted;
  String sId;
  int updatedAt;
  String genre;

  Voted({this.upVoted, this.downVoted, this.sId, this.updatedAt, this.genre});

  Voted.fromJson(Map<String, dynamic> json) {
    upVoted = json['upVoted'].cast<String>();
    downVoted = json['downVoted'].cast<String>();
    sId = json['_id'];
    updatedAt = json['updatedAt'];
    genre = json['genre'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['upVoted'] = this.upVoted;
    data['downVoted'] = this.downVoted;
    data['_id'] = this.sId;
    data['updatedAt'] = this.updatedAt;
    data['genre'] = this.genre;
    return data;
  }
}

class QueryParam {
  String category;
  String language;
  String genre;
  String sort;

  QueryParam({this.category, this.language, this.genre, this.sort});

  QueryParam.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    language = json['language'];
    genre = json['genre'];
    sort = json['sort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['language'] = this.language;
    data['genre'] = this.genre;
    data['sort'] = this.sort;
    return data;
  }
}
