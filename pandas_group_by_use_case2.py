import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sns

values = np.array([1, 3, 2, 4, 1, 6, 4])
example_df = pd.DataFrame({
    'value': values,
    'even': values % 2 == 0,
    'above_three': values > 3
}, index=['a', 'b', 'c', 'd', 'e', 'f', 'g'])

# Examine DataFrame
print(example_df)

# Examine groups
grouped_data = example_df.groupby('even')
# The groups attribute is a dictionary mapping keys to lists of row indexes
print(grouped_data.groups)

# Group by multiple columns
grouped_data = example_df.groupby(['even', 'above_three'])
print(grouped_data.groups)

# Get sum of each group
grouped_data = example_df.groupby('even')
print(grouped_data.sum())

# Limit columns in result
grouped_data = example_df.groupby('even')

# You can take one or more columns from the result DataFrame
print(grouped_data.sum()['value'])

print('\n') # Blank line to separate results

# You can also take a subset of columns from the grouped data before
# collapsing to a DataFrame. In this case, the result is the same.
print(grouped_data['value'].sum())

filename = 'nyc-subway-weather.csv'
subway_df = pd.read_csv(filename)

### Write code here to group the subway data by a variable of your choice, then
### either print out the mean ridership within each group or create a plot.
ridership_by_day = subway_df.groupby('day_week').mean()['ENTRIESn_hourly']
print(ridership_by_day)
ridership_by_day.plot()
plt.show()
