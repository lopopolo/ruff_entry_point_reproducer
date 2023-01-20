def _ruff_attr_factory():
    attrs = {
        "_runner": attr.label(
            default = Label("//tools/ruff:runner.template.py"),
            allow_single_file = True,
        ),
        "_ruff": attr.label(
            default = Label("//tools/ruff:entry"),
            executable = True,
            cfg = "exec",
        ),
    }

    return attrs

def _ruff_runner_impl(ctx):
    runner = ctx.actions.declare_file(ctx.label.name)
    substitutions = {
        "@@RUFF_BIN@@": ctx.file._ruff.short_path,
    }
    ctx.actions.expand_template(
        template = ctx.file._runner,
        output = runner,
        substitutions = substitutions,
        is_executable = True,
    )

    return DefaultInfo(
        files = depset([runner]),
        executable = runner,
    )

ruff_runner = rule(
    _ruff_runner_impl,
    attrs = _ruff_attr_factory(),
)
