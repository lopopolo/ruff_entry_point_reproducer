load("@py_deps_tools_ruff//:requirements.bzl", "requirement")
load("@rules_python//python:defs.bzl", "py_binary")
load("//tools/ruff/internal:factory.bzl", "ruff_runner")
load(":constants.bzl", "PYTHON_FILE_GLOB")

def ruff(name = "ruff", **kwargs):
    tags = kwargs.get("tags", [])
    if "manual" not in tags:
        tags.append("manual")
        kwargs["tags"] = tags
    if "ruff" not in tags:
        tags.append("ruff")
        kwargs["tags"] = tags

    runner_target = "%s_runner.py" % name

    ruff_runner(
        name = runner_target,
        **kwargs
    )

    py_binary(
        name = name,
        srcs = [runner_target],
        deps = [
            requirement("ruff"),
        ],
        main = runner_target,
        args = ["."],
        legacy_create_init = False,
        **kwargs
    )
