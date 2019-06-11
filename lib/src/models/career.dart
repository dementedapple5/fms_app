class Career {

  String name;

  Career.fromJson(Map<String, dynamic> json) {
      this.name = json['name'];
  }

}