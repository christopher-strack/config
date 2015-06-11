#!/usr/bin/env python

import os
from subprocess import check_output, CalledProcessError


def repository_root():
    toplevel = None

    while True:
        try:
            with open(os.devnull, 'w') as devnull:
                toplevel = check_output(
                    ['git', 'rev-parse', '--show-toplevel'],
                    stderr=devnull,
                    cwd=os.path.dirname(toplevel) if toplevel else '.',
                ).strip()

        except CalledProcessError:
            return toplevel


if __name__ == '__main__':
    print repository_root()
