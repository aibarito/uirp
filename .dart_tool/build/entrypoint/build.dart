// ignore_for_file: directives_ordering
import 'package:build_runner_core/build_runner_core.dart' as _i1;
import 'package:web3dart/src/builder/builders.dart' as _i2;
import 'package:build/build.dart' as _i3;
import 'dart:isolate' as _i4;
import 'package:build_runner/build_runner.dart' as _i5;
import 'dart:io' as _i6;

final _builders = <_i1.BuilderApplication>[
  _i1.apply(r'web3dart:abi_generator', [_i2.abiGenerator],
      _i1.toDependentsOf(r'web3dart'),
      hideOutput: false,
      appliesBuilders: const [r'web3dart:delete_abi_source']),
  _i1.applyPostProcess(r'web3dart:delete_abi_source', _i2.deleteSource,
      defaultReleaseOptions: _i3.BuilderOptions({'enabled': true}))
];
void main(List<String> args, [_i4.SendPort? sendPort]) async {
  var result = await _i5.run(args, _builders);
  sendPort?.send(result);
  _i6.exitCode = result;
}
