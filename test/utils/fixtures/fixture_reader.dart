import 'dart:convert';
import 'dart:io';

String fixture(String name) =>
    File('test/utils/fixtures/response/$name').readAsStringSync();
Map<String, dynamic> fixtureJson(String name) => jsonDecode(
      File('test/utils/fixtures/response/$name').readAsStringSync(),
    );
