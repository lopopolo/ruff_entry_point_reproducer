# Bazel workspace created by @bazel/create 5.4.2

# Declares that this directory is the root of a Bazel workspace.
# See https://docs.bazel.build/versions/main/build-ref.html#workspace
workspace(name = "ruff_entry_point_reproducer")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "bazel_skylib",
    sha256 = "74d544d96f4a5bb630d465ca8bbcfe231e3594e5aae57e1edbf17a6eb3ca2506",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.3.0/bazel-skylib-1.3.0.tar.gz",
        "https://github.com/bazelbuild/bazel-skylib/releases/download/1.3.0/bazel-skylib-1.3.0.tar.gz",
    ],
)

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")

bazel_skylib_workspace()

# Python toolchain setup
# See https://github.com/bazelbuild/rules_python#getting-started

# This repository is the home of the core Python rules -- `py_library`,
# `py_binary`, `py_test`, and related symbols that provide the basis for
# Python support in Bazel.
#
# Setup instructions:
# - https://github.com/bazelbuild/rules_python/releases/tag/0.16.1
#
# Latest releases:
# - https://github.com/bazelbuild/rules_python/releases
http_archive(
    name = "rules_python",
    sha256 = "497ca47374f48c8b067d786b512ac10a276211810f4a580178ee9b9ad139323a",
    strip_prefix = "rules_python-0.16.1",
    url = "https://github.com/bazelbuild/rules_python/archive/refs/tags/0.16.1.tar.gz",
)

load("@rules_python//python:repositories.bzl", "python_register_toolchains")

python_register_toolchains(
    name = "python3_10",
    # Available versions are listed in @rules_python//python:versions.bzl.
    # We recommend using the same version your team is already standardized on.
    python_version = "3.10",
)

load("@python3_10//:defs.bzl", py3_10_interpreter = "interpreter")
load("@rules_python//python:pip.bzl", "pip_parse")

pip_parse(
    name = "py_deps_tools_ruff",
    extra_pip_args = ["--require-hashes"],
    python_interpreter_target = py3_10_interpreter,
    requirements_lock = "//tools/ruff:requirements.txt",
)

load("@py_deps_tools_ruff//:requirements.bzl", ruff_install_deps = "install_deps")

ruff_install_deps()
