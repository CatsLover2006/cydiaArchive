import sys
print("Args list:")
for arg in sys.argv:
    print(arg)
f = open('./tmp/DEBIAN/control', 'r')
lines = f.readlines()
newLines = [];
newLines.append("Section: " + sys.argv[1] + "\n")
for line in lines:
    if line.startswith("Section:"):
        line = "Old" + line
    newLines.append(line)
f.close()
f = open('./tmp/DEBIAN/control', 'w')
f.writelines(newLines)
f.close()
