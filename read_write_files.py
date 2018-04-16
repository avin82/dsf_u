f = open('some_file.txt', 'r')
file_data = f.read()
f.close()

print(file_data, '\n')

f = open('my_file.txt', 'w')
f.write('Hello there!')
f.close()

with open('some_file.txt', 'r') as f:
    data = f.read()

print(data, '\n')

with open('camelot.txt') as song:
    print(song.read(2))
    print(song.read(8))
    print(song.read())
    print()

camelot_lines = []
with open("camelot.txt") as f:
    for line in f:
        camelot_lines.append(line.strip())

print(camelot_lines)

with open("mission.txt") as f:
    for line in f:
        print(f.readline())
