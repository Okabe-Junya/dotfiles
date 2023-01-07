from os import listdir, path


def find_alias(dir_path: str, file_path: str) -> list:
    """find alias in file

    Args:
        dir_path (str): directory path
        file_path (str): file path

    Returns:
        list: alias list
    """
    aliases = []
    try:
        with open(path.join(dir_path, file_path), "r") as f:
            for line in f:
                if line.startswith("alias "):
                    aliases.append(line)
    except PermissionError:
        pass

    return aliases


def print_alias(dir_path: str, file_path: str, aliases: list) -> None:
    """print alias

    Args:
        dir_path (str): directory path
        file_path (str): file path
        aliases (list): alias list
    """
    print("---")
    print("file name:", path.join(dir_path, file_path))

    for alias in aliases:
        print(alias, end="")


def dfs(entry_path: str, suffix: tuple) -> None:
    """find alias with depth first search

    Args:
        entry_path (str): entry path
        suffix (tuple): suffix tuple
    """
    dir_stack = [entry_path]
    while dir_stack:
        dir = dir_stack.pop()
        for file in listdir(dir):
            if path.isdir(path.join(dir, file)):
                dir_stack.append(path.join(dir, file))
            elif file.endswith(suffix):
                tmp_alias = find_alias(dir, file)
                if tmp_alias:
                    print_alias(dir, file, tmp_alias)


def main():
    entry_path = "../"
    suffix = (".sh", ".zsh", ".bash")
    dfs(entry_path, suffix)


if __name__ == "__main__":
    main()
