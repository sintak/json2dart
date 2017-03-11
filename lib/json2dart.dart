import 'package:code_builder/code_builder.dart';
import 'package:inflection/inflection.dart';
import 'package:recase/recase.dart';

String generateDart(Map map, {String className, bool owl: false}) =>
    prettyToSource(
        generateDartLibrary(map, className: className, owl: owl).buildAst());

LibraryBuilder generateDartLibrary(Map map,
    {String className, bool owl: false}) {
  var lib = new LibraryBuilder();

  if (owl == true)
    lib.addMember(new ImportBuilder('package:owl/annotation/json.dart'));

  return lib
    ..addMember(generateClass(map, lib, className: className, owl: owl));
}

ClassBuilder generateClass(Map map, LibraryBuilder lib,
    {String className, bool owl: false}) {
  var clazz = new ClassBuilder(className ?? 'RootObject');

  if (owl == true) {
    clazz.addAnnotation(new TypeBuilder('JsonClass').newInstance([]));
  }

  for (var key in map.keys.map<String>((k) => k.toString())) {
    var val = map[key];
    TypeBuilder type = resolveType(lib, key, val, owl: owl);

    if (type != null) {
      FieldBuilder field;

      if (owl == true) {
        var rc = new ReCase(key);
        var camel = rc.camelCase;

        field = varField(camel, type: type);

        if (camel != key) {
          field.addAnnotation(new TypeBuilder('JsonKey')
              .newInstance([], named: {'key': literal(key)}));
        }
      } else
        field = varField(key, type: type);

      clazz.addField(field);
    }
  }

  var constructor = new ConstructorBuilder();
  clazz.addConstructor(constructor);

  return clazz;
}

TypeBuilder resolveType(LibraryBuilder lib, String key, val, {bool owl}) {
  if (val == null)
    return new TypeBuilder('dynamic');
  else if (val is String)
    return new TypeBuilder('String');
  else if (val is int)
    return new TypeBuilder('int');
  else if (val is num)
    return new TypeBuilder('num');
  else if (val is bool)
    return new TypeBuilder('bool');
  else if (val is List && val.isEmpty)
    return new TypeBuilder('List');
  else if (val is List) {
    return new TypeBuilder('List', genericTypes: [
      resolveType(lib, SINGULAR.convert(key), val.first, owl: owl)
    ]);
  } else if (val is Map) {
    var rc = new ReCase(key);
    var className = rc.pascalCase;
    var clazz = generateClass(val, lib, className: className, owl: owl);
    lib.addMember(clazz);
    return new TypeBuilder(className);
  } else
    throw new ArgumentError('Cannot resolve JSON-encodable type for $val.');
}
