# butterhaus

A simple bash-inspired prompt for [ZIM], the ZSH-IMproved shell.

![Screenshot](./screenshot.png "butterhause theme")

This theme is based on [oblong](https://github.com/Ansimorph/oblong) and [minimal](https://github.com/zimfw/minimal).

## What does it show?

- Red `λ` when last command failed, green otherwise.
- Current user.
- Current working directory, relative to the git root when in a git repo.
- Current git branch name, or commit short hash when in ['detached HEAD' state].
- Red `◍` when in a dirty git working tree, green `◍` when in a clean one.

## Advanced settings

This theme can customized by changing the following git-info module context
formats, after the theme has been initialized:

| Context name | Description       | Default value |
| ------------ | ----------------- | ------------- |
| branch       | Branch name       | `%b`          |
| commit       | Commit short hash | `%c`          |
| clean        | Clean state       | `%F{green} ◍` |
| dirty        | Dirty state       | `%F{red}  ◍`  |

Use the following command to change the value of a context format:

    zstyle ':zim:git-info:<context_name>' format '<new_value>'

For detailed information, check the [git-info documentation].

## Requirements

Requires Zim's [git-info] module to show git information.

['detached head' state]: http://gitfaq.org/articles/what-is-a-detached-head.html
[git-info documentation]: https://github.com/zimfw/git-info/blob/master/README.md#theming
[git-info]: https://github.com/zimfw/git-info
[zim]: https://github.com/zimfw/zimfw
[gitster]: https://github.com/zimfw/gitster
[basher]: https://gitlab.com/Spriithy/basher
[venv]: https://docs.python.org/3/library/venv.html
