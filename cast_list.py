"""
You're going to create a list of the actors who appeared in the television programme Monty Python's Flying Circus.

Write a function called create_cast_list that takes a filename as input and returns a list of actors' names. It will be run on the file flying_circus_cast.txt (this information was collected from imdb.com). Each line of that file consists of an actor's name, a comma, and then some (messy) information about roles they played in the programme. You'll need to extract only the name and add it to a list.
"""


def create_cast_list(filename):
    cast_list = []
    with open('flying_circus_cast.txt') as f:
        for line in f:
            cast_list.append(line.split(",")[0])
    return cast_list


cast_list = create_cast_list('flying_circus_cast.txt')
for actor in cast_list:
    print(actor)
