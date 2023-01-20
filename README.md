# ruff_entry_point_reproducer

Minimal reproduction of [bazelbuild/rules_python#1000][ticket].

[ticket]: https://github.com/bazelbuild/rules_python/issues/1000

## Reproducer

```console
$ bazel run //:ruff
ERROR: /Users/lopopolo/dev/repos/ruff_entry_point_reproducer/tools/ruff/BUILD.bazel:18:6: no such target '@py_deps_tools_ruff_ruff//:rules_python_wheel_entry_point_ruff': target 'rules_python_wheel_entry_point_ruff' not declared in package '' defined by /private/var/tmp/_bazel_lopopolo/698235a6d86310c30fae5a78f4b7ba7c/external/py_deps_tools_ruff_ruff/BUILD.bazel (Tip: use `query "@py_deps_tools_ruff_ruff//:*"` to see all the targets in that package) and referenced by '//tools/ruff:entry'
ERROR: Analysis of target '//:ruff' failed; build aborted:
INFO: Elapsed time: 7.256s
INFO: 0 processes.
FAILED: Build did NOT complete successfully (5 packages loaded, 48 targets configured)
    Fetching repository @local_config_xcode; Fetching the default Xcode version
ERROR: Build failed. Not running target
```
