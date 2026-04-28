# Find Duplicate API Responses
# Problem Statement

# You have a list of API response IDs:
# ids = [101, 102, 103, 101, 104, 102, 105]

# Write code to find duplicate IDs.

ids = [101, 102, 103, 101, 104, 102, 105, 102, 102]

seen = set()
duplicate = set()

for i in ids:
    print(f" emements: {i}")
    if i in seen:
        duplicate.add(i)
    else:
        seen.add(i)
print("method 1:")
print(f"duplicate elements: {duplicate}")
print(f"seen elements: {seen}")

################

unique_ids = set(ids)
print("method 2:")
print(f"Unique IDs using set: {unique_ids}")