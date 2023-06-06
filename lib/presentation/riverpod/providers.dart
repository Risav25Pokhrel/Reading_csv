import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:read_csv/core/utils/utils.dart';

final utilsProvider = Provider.autoDispose<Utils>((ref) => Utils());
