class ApiData {
  List<ApiItem> items;

  ApiData({required this.items});

  factory ApiData.fromJson(Map<String, dynamic> json) {
    List<ApiItem> items = (json['item'][0]['item'] as List)
        .map((item) => ApiItem.fromJson(item))
        .toList();
    return ApiData(items: items);
  }
}

class ApiItem {
  String name;
  Request request;

  ApiItem({required this.name, required this.request});

  factory ApiItem.fromJson(Map<String, dynamic> json) {
    return ApiItem(
      name: json['name'],
      request: Request.fromJson(json['request']),
    );
  }
}

class Request {
  String method;
  String url;

  Request({required this.method, required this.url});

  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
      method: json['method'],
      url: json['url']['raw'],
    );
  }
}
