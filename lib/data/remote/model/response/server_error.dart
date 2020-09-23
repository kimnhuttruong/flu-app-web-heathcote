class ServerError {
  String resourceType;
  List<Issue> issue;

  ServerError({this.resourceType, this.issue});

  ServerError.fromJson(Map<String, dynamic> json) {
    resourceType = json['resourceType'];
    if (json['issue'] != null) {
      issue = new List<Issue>();
      json['issue'].forEach((v) {
        issue.add(new Issue.fromJson(v));
      });
    }
  }
}

class Issue {
  String severity;
  String code;
  Details details;
  String error;

  Issue({this.severity, this.code, this.details});

  Issue.fromJson(Map<String, dynamic> json) {
    severity = json['severity'];
    code = json['code'];
    details = json['details'] != null ? new Details.fromJson(json['details']) : null;
    dynamic diagnostics = json['diagnostics'];
    if (diagnostics is Map) {
      diagnostics = new Diagnostics.fromJson(json['diagnostics']);
      error = diagnostics?.error;
    } else {
      error = diagnostics;
    }
  }
}

class Details {
  String text;

  Details({this.text});

  Details.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    return data;
  }
}

class Diagnostics {
  int statusCode;
  String error;

  Diagnostics({this.statusCode, this.error});

  Diagnostics.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['error'] = this.error;
    return data;
  }
}
