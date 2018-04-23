import pandas as pd

# run the script with python 2.7 to get appropriate results
ridership_df = pd.DataFrame({
    'R003': [0, 1478, 1613, 1560, 1608, 1576, 95, 2, 1438, 1342],
    'R004': [0, 3877, 4088, 3392, 4802, 3933, 229, 0, 3785, 4043],
    'R005': [2, 3674, 3991, 3826, 3932, 3909, 255, 1, 3589, 4009],
    'R006': [5, 2328, 6461, 4787, 4477, 4979, 496, 27, 4174, 4665],
    'R007': [0, 2539, 2691, 2613, 2705, 2685, 201, 0, 2215, 3033]
    }, index=['05-01-11', '05-02-11', '05-03-11', '05-04-11', '05-05-11', '05-06-11', '05-07-11', '05-08-11', '05-09-11', '05-10-11']
    )

print ridership_df  # run the script with python 2.7 to get appropriate results

print ridership_df.loc['05-02-11']
print ridership_df.iloc[9]
print ridership_df.iloc[0, 3]
print ridership_df.loc['05-04-11', 'R004']
print ridership_df['R006']
print ridership_df.values
print ridership_df.values.mean()
