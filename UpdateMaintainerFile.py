f = open('./tmp/DEBIAN/control', 'r')
lines = f.readlines()
newLines = [];
for line in lines:
    if line.startswith("Maintainer:"):
        line = "Maintainer: Hanabi <chancelorne@icloud.com>\n"
    newLines.append(line)
f.close()
f = open('./tmp/DEBIAN/control', 'w')
f.writelines(newLines)
f.close()
