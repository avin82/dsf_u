"""
Plotting in Pandas

If the variable data is a NumPy array or a Pandas Series, just like if it is a list, the code

import matplotlib.pyplot as plt
plt.hist(data)
will create a histogram of the data.

Pandas also has built-in plotting that uses matplotlib behind the scenes, so if data is a Series, you can create a histogram using data.hist().

There's no difference between these two in this case, but sometimes the Pandas wrapper can be more convenient. For example, you can make a line plot of a series using data.plot(). The index of the Series will be used for the x-axis and the values for the y-axis.

"""

import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# The following code reads all the Gapminder data into Pandas DataFrames. You'll
# learn about DataFrames next lesson.

employment = pd.read_csv('employment-above-15.csv', index_col='Country')
female_completion = pd.read_csv('female-completion-rate.csv', index_col='Country')
male_completion = pd.read_csv('male-completion-rate.csv', index_col='Country')
life_expectancy = pd.read_csv('life-expectancy.csv', index_col='Country')
gdp = pd.read_csv('gdp-per-capita.csv', index_col='Country')

# The following code creates a Pandas Series for each variable for the United States.
# You can change the string 'United States' to a country of your choice.

employment_us = employment.loc['United States']
female_completion_us = female_completion.loc['United States']
male_completion_us = male_completion.loc['United States']
life_expectancy_us = life_expectancy.loc['United States']
gdp_us = gdp.loc['United States']

# Uncomment the following line of code to see the available country names
# print employment.index.values

# Use the Series defined above to create a plot of each variable over time for
# the country of your choice. You will only be able to display one plot at a time
# with each "Test Run".

employment_us.plot()
plt.show()
