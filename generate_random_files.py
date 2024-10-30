import os
import random
import string

# Configuration
num_files = 10  # Number of files to create
content_lines = 5  # Number of lines in each file
output_dir = "random_files"  # Directory to save the files

# Ensure output directory exists
os.makedirs(output_dir, exist_ok=True)

# Function to generate random file name
def random_filename():
    return ''.join(random.choices(string.ascii_lowercase, k=8)) + ".txt"

# Function to generate random content
def random_content():
    return "\n".join(
        ''.join(random.choices(string.ascii_letters + string.digits, k=20))
        for _ in range(content_lines)
    )

# Create files with random content
for _ in range(num_files):
    filename = random_filename()
    filepath = os.path.join(output_dir, filename)
    with open(filepath, "w") as file:
        file.write(random_content())
    print(f"Created file: {filepath}")
