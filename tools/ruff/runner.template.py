#!/usr/bin/env python3

import os
import subprocess
import sys
from pathlib import Path


def main():
    # Try to chdir to the workspace root so we can write to the workspace
    # sources.
    workspace_root = os.getenv("BUILD_WORKSPACE_DIRECTORY")
    if workspace_root is not None:
        os.chdir(workspace_root)

    ruff = Path("@@RUFF_BIN@@").resolve()
    proc = subprocess.run([str(ruff), "--fix", ".])
    return proc.returncode


if __name__ == "__main__":
    sys.exit(main())
