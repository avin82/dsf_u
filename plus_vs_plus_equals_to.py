import numpy as np

"""
+= operates in-place while + does not
"""

a = np.array([1, 2, 3, 4])
b = a
a += np.array([1, 1, 1, 1])
print(b)

# Code Snippet 2

a = np.array([1, 2, 3, 4])
b = a
a = a + np.array([1, 1, 1, 1])
print(b)
