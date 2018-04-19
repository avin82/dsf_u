import numpy as np

a = np.array([1, 2, 3, 4, 5])
slice = a[:3]
slice[0] = 100
print(a)
