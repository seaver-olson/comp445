import sys
import csv

filename = sys.argv[1]

with open(filename + ".txt", "r") as inFile, open(filename + ".csv", "w", newline="") as outFile:
    csvWriter = csv.writer(outFile)

    for line in inFile:
        line = line.strip()
        if ": " in line:
            _, value = line.split(": ", 1)
            csvWriter.writerow([value])

print("Data transferred successfully")
