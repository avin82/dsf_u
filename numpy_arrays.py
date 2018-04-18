import numpy as np

# First 20 countries with employment data
countries = np.array([
    'Afghanistan', 'Albania', 'Algeria', 'Angola', 'Argentina',
    'Armenia', 'Australia', 'Austria', 'Azerbaijan', 'Bahamas',
    'Bahrain', 'Bangladesh', 'Barbados', 'Belarus', 'Belgium',
    'Belize', 'Benin', 'Bhutan', 'Bolivia',
    'Bosnia and Herzegovina'
])

# Employment data in 2007 for those 20 countries
employment = np.array([
    55.70000076,  51.40000153,  50.5       ,  75.69999695,
    58.40000153,  40.09999847,  61.5       ,  57.09999847,
    60.90000153,  66.59999847,  60.40000153,  68.09999847,
    66.90000153,  53.40000153,  48.59999847,  56.79999924,
    71.59999847,  58.40000153,  70.40000153,  41.20000076
])

print(countries[0])
print(countries[3])

print(countries[0:3])
print(countries[:3])
print(countries[17:])
print(countries[:])

print(countries.dtype)
print(employment.dtype)
print(np.array([0, 1, 2, 3]).dtype)
print(np.array([1.0, 1.5, 2.0, 2.5]).dtype)
print(np.array([True, False, True]).dtype)
print(np.array(['AL', 'AK', 'AZ', 'AR', 'CA']).dtype)

for country in countries:
    print('Examining country {}'.format(country))

for i in range(len(countries)):
    country = countries[i]
    country_employment = employment[i]
    print('Country {} has employment {}'.format(country,
            country_employment))

print(employment.mean())
print(employment.std())
print(employment.max())
print(employment.sum())


def max_employment(countries, employment):
    '''
    This function returns the name of the country
    with the highest employment in the given employment
    data, and the employment in that country.
    '''

    max_country = None
    max_value = employment.max()

    for i in range(len(employment)):
        if employment[i] == max_value:
            max_country = countries[i]

    return (max_country, max_value)


print(max_employment(countries, employment))
