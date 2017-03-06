import 'dart:convert';
import 'dart:io';
import 'package:args/args.dart';
import 'package:json2dart/json2dart.dart';

final ArgParser PARSER = new ArgParser(allowTrailingOptions: true)
  ..addFlag('help',
      abbr: 'h',
      help: 'Shows this help information.',
      defaultsTo: false,
      negatable: false)
  ..addFlag('owl',
      help: 'Determines whether to add `package:owl_codegen` annotations.',
      defaultsTo: false,
      negatable: false)
  ..addOption('class',
      abbr: 'c',
      help: 'Defines an explicit class name for the generated root class.');

main(List<String> args) async {
  var result = PARSER.parse(args);

  if (result['help']) {
    print('usage: json2dart [options...] <file>');
    print('\nOptions:');
    print(PARSER.usage);
    exit(0);
    return;
  }

  if (result.rest.isEmpty) {
    stderr.writeln('fatal error: no input file');
    exit(1);
    return;
  }

  var file = new File(result.rest.first);
  var json = JSON.decode(await file.readAsString());

  if (json is! Map) {
    stderr.writeln('fatal error: input JSON is not a map');
    exit(1);
    return;
  }

  var generated =
      generateDart(json, className: result['class'], owl: result['owl']);
  print(generated);
}
