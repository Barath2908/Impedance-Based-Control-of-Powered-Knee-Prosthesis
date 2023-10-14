import pandas as pd

# Read in the Excel file
df = pd.read_excel('C:/Users/ibra5/Desktop/pt.xlsx')

# Get the column of decimal numbers as a list
decimals = df['V'].tolist()

# Convert each decimal number in the list to a string
decimal_strings = [str(float(num)) for num in decimals]

# Join the list of strings with commas
output_str = ', '.join(decimal_strings)

# Print the output string
print(output_str)


