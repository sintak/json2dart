# json2dart
Generate Dart classes from JSON. Also supports `package:owl_codegen`, and allows you to specify a custom class name.
This package works well for implementing API clients, and will be used in `package:twit`.

```bash
$ pub global activate json2dart
$ json2dart foo.json >> foo.dart
$ json2dart foo.json --owl -c Foo >> foo.dart
```

*Coming soon: Web-based generator*
