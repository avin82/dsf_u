import pandas as pd

# DataFrame applymap()
df = pd.DataFrame({
    'a': [1, 2, 3],
    'b': [10, 20, 30],
    'c': [5, 10, 15]
})


def add_one(x):
    return x + 1


print(df.applymap(add_one))

grades_df = pd.DataFrame(
    data={'exam1': [43, 81, 78, 75, 89, 70, 91, 65, 98, 87],
          'exam2': [24, 63, 56, 56, 67, 51, 79, 46, 72, 60]},
    index=['Andre', 'Barry', 'Chris', 'Dan', 'Emilio',
           'Fred', 'Greta', 'Humbert', 'Ivan', 'James']
)


def get_grade(data):
    if 0 <= data <= 59:
        return 'F'
    elif 60 <= data <= 69:
        return 'D'
    elif 70 <= data <= 79:
        return 'C'
    elif 80 <= data <= 89:
        return 'B'
    elif 90 <= data <= 100:
        return 'A'


def convert_grades(grades):
    '''
    Fill in this function to convert the given DataFrame of numerical
    grades to letter grades. Return a new DataFrame with the converted
    grade.

    The conversion rule is:
        90-100 -> A
        80-89  -> B
        70-79  -> C
        60-69  -> D
        0-59   -> F
    '''
    return grades.applymap(get_grade)


print(convert_grades(grades_df))
