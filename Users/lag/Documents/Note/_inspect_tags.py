import os, yaml, glob

for f in glob.glob('/Users/lag/Documents/Note/**/*.md', recursive=True):
    try:
        with open(f, encoding='utf-8') as fh:
            content = fh.read()
        if not content.startswith('---'):
            continue
        end = content.find('---', 3)
        fm = content[3:end]
        data = yaml.safe_load(fm) or {}
        if 'tags' in data:
            print(f, '->', data['tags'])
    except Exception as e:
        pass
