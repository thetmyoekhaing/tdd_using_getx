import 'dart:io';

String jsonReader(String name) => File("test/json/$name").readAsStringSync();
