import re


if __name__ == "__main__":

    txt = open("installed_texlive_packages.txt").read()
    regex = re.compile(r" (.*):")
    matches = re.finditer(r" (.*):", txt, re.MULTILINE)
    print(" ".join([k.group()[1:-1] for k in matches]))
