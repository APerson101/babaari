// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String _$MultiPrintHash() => r'c68ad64fc56f2234ca5edccc32e723c5b54ecc16';

/// See also [MultiPrint].
final multiPrintProvider =
    AutoDisposeNotifierProvider<MultiPrint, List<List<PrintOptionsCorper>>>(
  MultiPrint.new,
  name: r'multiPrintProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$MultiPrintHash,
);
typedef MultiPrintRef
    = AutoDisposeNotifierProviderRef<List<List<PrintOptionsCorper>>>;

abstract class _$MultiPrint
    extends AutoDisposeNotifier<List<List<PrintOptionsCorper>>> {
  @override
  List<List<PrintOptionsCorper>> build();
}

String _$MultiPrintSiwesHash() => r'1996aa6a506164a5b8fdc18a1f4424fa2c669807';

/// See also [MultiPrintSiwes].
final multiPrintSiwesProvider =
    AutoDisposeNotifierProvider<MultiPrintSiwes, List<List<PrintOptonsSiwes>>>(
  MultiPrintSiwes.new,
  name: r'multiPrintSiwesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$MultiPrintSiwesHash,
);
typedef MultiPrintSiwesRef
    = AutoDisposeNotifierProviderRef<List<List<PrintOptonsSiwes>>>;

abstract class _$MultiPrintSiwes
    extends AutoDisposeNotifier<List<List<PrintOptonsSiwes>>> {
  @override
  List<List<PrintOptonsSiwes>> build();
}
