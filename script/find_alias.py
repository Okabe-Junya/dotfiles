from os import listdir, path

entry_path = '../'
suffix = ('.sh', '.zsh', '.bash')
dir_stack = [entry_path]
while dir_stack:
    dir = dir_stack.pop()
    for file in listdir(dir):
        if path.isdir(path.join(dir, file)):
            dir_stack.append(path.join(dir, file))
        elif file.endswith(suffix):
            with open(path.join(dir, file), 'r') as f:
                tmp_alias = []
                for line in f:
                    if line.startswith('alias '):
                        tmp_alias.append(line)
                if tmp_alias:
                    print("---")
                    print("file name:", path.join(dir, file))
                    for line in tmp_alias:
                        print(line, end='')
