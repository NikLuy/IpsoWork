# Introduction to `awk`

`awk` is a powerful text-processing and pattern-matching tool in Unix/Linux. It is primarily used for **scanning**, **filtering**, **processing**, and **formatting** structured text like CSV or tabular data.

---

## **Basic Syntax**
```sh
awk 'pattern { action }' file.txt
```
- **`pattern`**: Defines which lines to process.
- **`action`**: A block `{}` that specifies what to do when the pattern matches.

### **Example: Print All Lines**
```sh
awk '{ print $0 }' file.txt
```
This prints every line in the file (`$0` represents the whole line).

---

## **Common Use Cases**

### **1. Print Specific Columns**
Print only the 2nd and 3rd columns of a CSV file:
```sh
awk -F, '{print $2, $3}' file.csv
```
- `-F,` → Sets **comma (`,`)** as the field separator.
- `$2, $3` → Prints the **2nd** and **3rd** columns.

### **2. Filter Lines Based on a Condition**
Print lines where the **value in the 3rd column** is greater than **100**:
```sh
awk -F, '$3 > 100 { print $0 }' file.csv
```
- `$3 > 100` → Filters lines where **column 3** is greater than **100**.
- `print $0` → Prints the entire matching line.

### **3. Compute Derived Values**
Calculate the **absolute value** of the **3rd column**:
```sh
awk -F, '{ print $1, $2, ($3 < 0 ? -$3 : $3) }' file.csv
```
- `($3 < 0 ? -$3 : $3)` → Converts negative values to positive.

### **4. Count Unique Entries**
Count occurrences of values in **column 2**:
```sh
awk -F, '{count[$2]++} END { for (val in count) print val, count[val] }' file.csv
```
- `count[$2]++` → Increments count for each unique value in **column 2**.
- `END { for (val in count) print val, count[val] }` → Prints each **unique value** and its count.

### **5. Sort by Absolute Deviation**
Find the top 10 absolute deviations:
```sh
awk -F, '{ print $1, $2, $3, ($3 < 0 ? -$3 : $3) }' file.csv | sort -k4,4n | head -10
```
- Computes **absolute deviation** of `delta` (column 3).
- Sorts by absolute deviation (smallest to largest).
- Prints **top 10 smallest deviations**.

### **6. Ensure Each Absolute Deviation Appears Once (Positive & Negative)**
```sh
awk -F, 'NR>1 {print $1, $2, $3, ($3 < 0 ? -$3 : $3)}' file.csv \
  | sort -k4,4n -t' ' \
  | awk '{if (!seen[$4, ($3 < 0 ? "-" : "+")]++) print $0}' \
  | head -10 \
  | cut -d ' ' -f1-3
```
- Tracks both `+N` and `-N` values separately.
- Ensures at least **one positive and one negative** for each deviation before moving to the next.
- Outputs **top 10 unique absolute deviations**.

---

## **Why Use `awk`?**
✅ **Fast:** Processes large files efficiently.  
✅ **Flexible:** Handles various text processing needs.  
✅ **Powerful:** Supports loops, conditions, arrays, and functions.

---

### **Conclusion**
`awk` is an essential tool for Unix/Linux users who need to process structured text efficiently. Whether you need to filter, sort, count, or transform data, `awk` provides a simple yet powerful way to achieve it.

Would you like more examples? Let me know! 🚀