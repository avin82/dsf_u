import numpy as np
import pandas as pd

# run the script with python 2.7 to get appropriate results

"""
NumPy arrays have a dtype which is the type of each element in the array. Now this also applies to two dimensional arrays. Each element of the array is expected to have the same data type. This can make it inconvenient to use unconventional NumPy arrays to represent the contents of a csv file.

"""


print np.array([1, 2, 3, 4, 5]).dtype  # run the script with python 2.7 to get appropriate results

enrollments = np.array([
                    ['account_key', 'status', 'join_date', 'days_to_cancel',    'is_udacity'],
                    [448, 'canceled', '2014-11-10', 65, True],
                    [448, 'canceled', '2014-11-05', 5, True],
                    [448, 'canceled', '2015-01-27', 0, True],
                    [448, 'canceled', '2014-11-10', 0, True],
                    [448, 'current', '2015-03-10', np.nan, True]
                    ])

print(enrollments.dtype)

try:
    print enrollments[:, 3].mean()
except TypeError:
    print "Here, we tried to take the mean of the 'days_to_cancel' column, but it doesn't work. Instead, NumPy says that it cannot perform the reduce with a flexible type, which means that it doesn't know how to take the mean when not all of the values are numbers."


"""
TypeError: cannot perform reduce with flexible type

Here, we tried to take the mean of the 'days_to_cancel' column, but it doesn't work. Instead, NumPy says that it cannot perform the reduce with a flexible type, which means that it doesn't know how to take the mean when not all of the values are numbers.

That's one benefit of Pandas dataframes over two dimensional NumPy arrays. A dataframe is also a two dimensional data structure, but each column is assumed to be a different type.

Another benefit is that dataframes have indexes similar to Pandas series. There is an index value for each row and a name for each column.

"""

enrollments_df = pd.DataFrame({
    'account_key': [448, 448, 448, 448, 448],
    'status': ['canceled', 'canceled', 'canceled', 'canceled', 'current'],
    'join_date': ['2014-11-10', '2014-11-05', '2015-01-27', '2014-11-10',
    '2015-03-10'],
    'days_to_cancel': [65, 5, 0, 0, np.nan],
    'is_udacity': [True, True, True, True, True]
    })

print enrollments_df

# Now if we take the mean of the dataframe, it takes the mean of each numerical column and ignores the others

print enrollments_df.mean()
