# json2dart
Generates Dart classes from JSON.

# Installation
```bash
pub global activate json2dart
```

# Usage
From the command-line:

```bash
json2dart foo.json >> foo.dart
json2dart --owl bar.json >> bar.dart # Generate `package:owl_codegen` metadata as well
json2dart -c ArbitraryClassName baz.json >> arbitrary.dart
```

This package also supports a `package:build` builder in `package:json2dart/builder.dart`.