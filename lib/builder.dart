import 'dart:async';
import 'dart:convert';
import 'package:build/build.dart';
import 'package:json2dart/json2dart.dart';

class Json2DartBuilder implements Builder {
  final String className;
  final bool owl;

  const Json2DartBuilder({this.className, this.owl: false});

  @override
  List<AssetId> declareOutputs(AssetId inputId) =>
      [inputId.changeExtension('.g.dart')];

  @override
  Future build(BuildStep buildStep) async {
    var asset = buildStep.inputId;
    var contents = await buildStep.readAsString(asset);
    var json = JSON.decode(contents);

    if (json is! Map) throw new InvalidInputException(asset);

    var generated = generateDart(json, className: className, owl: owl == true);
    buildStep.writeAsString(asset.changeExtension('.g.dart'), generated);
  }
}
