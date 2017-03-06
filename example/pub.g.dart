class Environment {
  String sdk;

  Environment({this.sdk});
}

class DevDependencies {
  String unittest;

  DevDependencies({this.unittest});
}

class Pubspec {
  Environment environment;

  String version;

  String description;

  String author;

  DevDependencies dev_dependencies;

  String homepage;

  String name;

  Pubspec(
      {this.environment,
      this.version,
      this.description,
      this.author,
      this.dev_dependencies,
      this.homepage,
      this.name});
}

class RootObject {
  String url;

  String package_url;

  String archive_url;

  String version;

  Pubspec pubspec;

  int downloads;

  String created;

  List<String> libraries;

  String uploader;

  RootObject(
      {this.url,
      this.package_url,
      this.archive_url,
      this.version,
      this.pubspec,
      this.downloads,
      this.created,
      this.libraries,
      this.uploader});
}

