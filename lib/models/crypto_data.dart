class CryptoData {
  String? id;
  String? name;
  String? symbol;
  int? rank;
  bool? isNew;
  bool? isActive;
  String? type;
  List<Tags>? tags;
  List<Team>? team;
  String? description;
  String? message;
  bool? openSource;
  String? startedAt;
  String? developmentStatus;
  bool? hardwareWallet;
  String? proofType;
  String? orgStructure;
  String? hashAlgorithm;
  Links? links;
  List<LinksExtended>? linksExtended;
  Whitepaper? whitepaper;
  String? firstDataAt;
  String? lastDataAt;

  CryptoData({
    required this.id,
    required this.name,
    required this.symbol,
    required this.rank,
    required this.isNew,
    required this.isActive,
    required this.type,
    required this.tags,
    required this.team,
    required this.description,
    required this.message,
    required this.openSource,
    required this.startedAt,
    required this.developmentStatus,
    required this.hardwareWallet,
    required this.proofType,
    required this.orgStructure,
    required this.hashAlgorithm,
    required this.links,
    required this.linksExtended,
    required this.whitepaper,
    required this.firstDataAt,
    required this.lastDataAt,
  });

  CryptoData.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) id = json["id"];
    if (json["name"] is String) name = json["name"];
    if (json["symbol"] is String) symbol = json["symbol"];
    if (json["rank"] is int) rank = json["rank"];
    if (json["is_new"] is bool) isNew = json["is_new"];
    if (json["is_active"] is bool) isActive = json["is_active"];
    if (json["type"] is String) type = json["type"];
    if (json["tags"] is List) {
      tags = (json["tags"] == null
          ? null
          : (json["tags"] as List).map((e) => Tags.fromJson(e)).toList())!;
    }
    if (json["team"] is List) {
      team = (json["team"] == null
          ? null
          : (json["team"] as List).map((e) => Team.fromJson(e)).toList())!;
    }
    if (json["description"] is String) description = json["description"];
    if (json["message"] is String) message = json["message"];
    if (json["open_source"] is bool) openSource = json["open_source"];
    if (json["started_at"] is String) startedAt = json["started_at"];
    if (json["development_status"] is String) {
      developmentStatus = json["development_status"];
    }
    if (json["hardware_wallet"] is bool) {
      hardwareWallet = json["hardware_wallet"];
    }
    if (json["proof_type"] is String) proofType = json["proof_type"];
    if (json["org_structure"] is String) {
      orgStructure = json["org_structure"];
    }
    if (json["hash_algorithm"] is String) {
      hashAlgorithm = json["hash_algorithm"];
    }
    if (json["links"] is Map) {
      links = json["links"] == null ? null : Links.fromJson(json["links"]);
    }
    if (json["links_extended"] is List) {
      linksExtended = (json["links_extended"] == null
          ? null
          : (json["links_extended"] as List)
              .map((e) => LinksExtended.fromJson(e))
              .toList())!;
    }
    if (json["whitepaper"] is Map) {
      whitepaper = json["whitepaper"] == null
          ? null
          : Whitepaper.fromJson(json["whitepaper"]);
    }

    if (json["first_data_at"] is String) {
      firstDataAt = json["first_data_at"];
    }
    if (json["last_data_at"] is String) lastDataAt = json["last_data_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["symbol"] = symbol;
    data["rank"] = rank;
    data["is_new"] = isNew;
    data["is_active"] = isActive;
    data["type"] = type;
    if (tags != null) {
      data["tags"] = tags?.map((e) => e.toJson()).toList();
    }
    if (team != null) {
      data["team"] = team?.map((e) => e.toJson()).toList();
    }
    data["description"] = description;
    data["message"] = message;
    data["open_source"] = openSource;
    data["started_at"] = startedAt;
    data["development_status"] = developmentStatus;
    data["hardware_wallet"] = hardwareWallet;
    data["proof_type"] = proofType;
    data["org_structure"] = orgStructure;
    data["hash_algorithm"] = hashAlgorithm;
    if (links != null) data["links"] = links!.toJson();
    if (linksExtended != null) {
      data["links_extended"] = linksExtended?.map((e) => e.toJson()).toList();
    }
    if (whitepaper != null) data["whitepaper"] = whitepaper?.toJson();
    data["first_data_at"] = firstDataAt;
    data["last_data_at"] = lastDataAt;
    return data;
  }
}

class Whitepaper {
  String? link;
  String? thumbnail;

  Whitepaper({
    this.link,
    this.thumbnail,
  });

  Whitepaper.fromJson(Map<String, dynamic> json) {
    if (json["link"] is String) link = json["link"];
    if (json["thumbnail"] is String) thumbnail = json["thumbnail"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["link"] = link;
    data["thumbnail"] = thumbnail;
    return data;
  }
}

class LinksExtended {
  String? url;
  String? type;
  Stats? stats;

  LinksExtended({this.url, this.type, this.stats});

  LinksExtended.fromJson(Map<String, dynamic> json) {
    if (json["url"] is String) url = json["url"];
    if (json["type"] is String) type = json["type"];
    if (json["stats"] is Map) {
      stats = json["stats"] == null ? null : Stats.fromJson(json["stats"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["url"] = url;
    data["type"] = type;
    if (stats != null) data["stats"] = stats?.toJson();
    return data;
  }
}

class Stats {
  int? subscribers;
  int? contributors;
  int? stars, followers;
  Stats({this.subscribers, this.contributors, this.stars, this.followers});

  Stats.fromJson(Map<String, dynamic> json) {
    if (json["subscribers"] is int) subscribers == json["subscribers"];
    if (json["contributors"] is int) contributors = json["contributors"];
    if (json["stars"] is int) stars = json["stars"];
    if (json["followers"] is int) followers = json["followers"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["subscribers"] = subscribers;
    data["contributors"] = contributors;
    data["stars"] = stars;
    data["followers"] = stars;

    return data;
  }
}

class Links {
  List<String>? explorer;
  List<String>? facebook;
  List<String>? reddit;
  List<String>? sourceCode;
  List<String>? website;
  List<String>? youtube;

  Links(
      {this.explorer,
      this.facebook,
      this.reddit,
      this.sourceCode,
      this.website,
      this.youtube});

  Links.fromJson(Map<String, dynamic> json) {
    if (json["explorer"] is List) {
      explorer =
          json["explorer"] == null ? null : List<String>.from(json["explorer"]);
    }
    if (json["facebook"] is List) {
      facebook =
          json["facebook"] == null ? null : List<String>.from(json["facebook"]);
    }
    if (json["reddit"] is List) {
      reddit =
          json["reddit"] == null ? null : List<String>.from(json["reddit"]);
    }
    if (json["source_code"] is List) {
      sourceCode = json["source_code"] == null
          ? null
          : List<String>.from(json["source_code"]);
    }
    if (json["website"] is List) {
      website =
          json["website"] == null ? null : List<String>.from(json["website"]);
    }
    if (json["youtube"] is List) {
      youtube =
          json["youtube"] == null ? null : List<String>.from(json["youtube"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (explorer != null) data["explorer"] = explorer;
    if (facebook != null) data["facebook"] = facebook;
    if (reddit != null) data["reddit"] = reddit;
    if (sourceCode != null) data["source_code"] = sourceCode;
    if (website != null) data["website"] = website;
    if (youtube != null) data["youtube"] = youtube;
    return data;
  }
}

class Team {
  String? id;
  String? name;
  String? position;

  Team({this.id, this.name, this.position});

  Team.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) id = json["id"];
    if (json["name"] is String) name = json["name"];
    if (json["position"] is String) position = json["position"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["position"] = position;
    return data;
  }
}

class Tags {
  String? id;
  String? name;
  int? coinCounter;
  int? icoCounter;

  Tags({this.id, this.name, this.coinCounter, this.icoCounter});

  Tags.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) id = json["id"];
    if (json["name"] is String) name = json["name"];
    if (json["coin_counter"] is int) coinCounter = json["coin_counter"];
    if (json["ico_counter"] is int) icoCounter = json["ico_counter"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["coin_counter"] = coinCounter;
    data["ico_counter"] = icoCounter;
    return data;
  }
}
