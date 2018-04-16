'''
Right now, running the code below will cause an error during the second call to the create_groups function because it runs into a ZeroDivisionError exception.

Edit the function below to handle this exception. If it runs into this exception during the first line of the function, it should print a warning message and return an empty list. Otherwise, it should run the rest of the function's code. At the end, this function should always print how many groups were returned.

Edit the script to handle the Zero Division Error. Doing this correctly should output:

Creating 6 groups...
6 groups returned.
[0, 1, 2, 3, 4]
[5, 6, 7, 8, 9]
[10, 11, 12, 13, 14]
[15, 16, 17, 18, 19]
[20, 21, 22, 23, 24]
[25, 26, 27, 28, 29]
[30, 31]

Creating 0 groups...
WARNING: Returning empty list. Please use a nonzero number.
0 groups returned.
'''


def create_groups(items, n):
    """Splits items into n groups of equal size, although the last one may be shorter."""
    size = 0
    groups = []
    # determine the size each group should be
    try:
        size = len(items) // n  # this line could cause a ZeroDivisionError
    except ZeroDivisionError:
        print('WARNING: Returning empty list. Please use a nonzero number.')
    else:
        # create each group and append to a new list
        for i in range(0, len(items), size):
            groups.append(items[i:i + size])

    # print the number of groups and return groups
    print("{} groups returned.".format(n))
    return groups

print("Creating 6 groups...")
for group in create_groups(range(32), 6):
    print(list(group))

print("\nCreating 0 groups...")
for group in create_groups(range(32), 0):
    print(list(group))
