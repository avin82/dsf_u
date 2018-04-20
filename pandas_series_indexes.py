import numpy as np
import pandas as pd

# Let us see the benefits of using pandas series instead of a numpy array

a = np.array([1, 2, 3, 4])
s = pd.Series([1, 2, 3, 4])

# Pandas series have some extra functions not available for NumPy arrays like the describe function
print(s.describe())

"""
However, the main difference between a Pandas series and a NumPy array is that a Pandas series has something called an index

In NumPy series, we need to create one array to hold the actual data points and one to hold the country names

country = np.array(['Albania', 'Algeria', 'Andorra', 'Angola'])
life_expectancy = np.array([74.7, 75., 83.4, 57.6])


# In Pandas, we need to create only one series and use the data points as the values of that series, then use the country names as the index for the series
"""

life_expectancy = pd.Series([74.7, 75., 83.4, 57.6], index=['Albania', 'Algeria', 'Andorra', 'Angola'])

print(life_expectancy)

"""
You can verify that pandas is matching up each index value to the correspoding data point

NumPy arrays are like souped-up Python lists
A Pandas series is like a cross between a list and a dictionary
"""

print(life_expectancy[0])
print(life_expectancy.loc['Angola'])
print(pd.Series([74.7, 75., 83.4, 57.6]))
print(life_expectancy.iloc[0])


countries = [
    'Afghanistan', 'Albania', 'Algeria', 'Angola',
    'Argentina', 'Armenia', 'Australia', 'Austria',
    'Azerbaijan', 'Bahamas', 'Bahrain', 'Bangladesh',
    'Barbados', 'Belarus', 'Belgium', 'Belize',
    'Benin', 'Bhutan', 'Bolivia', 'Bosnia and Herzegovina',
]


employment_values = [
    55.70000076,  51.40000153,  50.5       ,  75.69999695,
    58.40000153,  40.09999847,  61.5       ,  57.09999847,
    60.90000153,  66.59999847,  60.40000153,  68.09999847,
    66.90000153,  53.40000153,  48.59999847,  56.79999924,
    71.59999847,  58.40000153,  70.40000153,  41.20000076,
]

# Employment data in 2007 for 20 countries
employment = pd.Series(employment_values, index=countries)

def max_employment(employment):
    '''
    Fill in this function to return the name of the country
    with the highest employment in the given employment
    data, and the employment in that country.

    The input will be a Pandas series where the values
    are employment and the index is country names.

    Try using the Pandas idxmax() function. Documention can
    be found here:
    http://pandas.pydata.org/pandas-docs/stable/generated/pandas.Series.idxmax.html
    '''
    max_country = employment.idxmax()
    max_value = employment.loc[max_country]

    return (max_country, max_value)


print(max_employment(employment))
