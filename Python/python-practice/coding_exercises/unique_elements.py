ids = [101, 102, 103, 101, 104, 102, 105, 102, 102]


unique_ids = set(ids)
print("method 1:")
print(f"Unique IDs using set: {unique_ids}")

############

print("method 2:")
unique_elements = set()
duplicate_elements = set()

for num in ids:
    if num in unique_elements:
        duplicate_elements.add(num)
    else:
        unique_elements.add(num)

print(f"Unique elements: {unique_elements}" )