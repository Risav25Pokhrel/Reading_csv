import 'package:flutter_riverpod/flutter_riverpod.dart';

final fileStatusProvider = StateProvider.autoDispose<bool>((ref) => false);
final loadingStatus = StateProvider.autoDispose<bool>((ref) => false);

final file = StateProvider<List<List<dynamic>>>((ref) => []);
 