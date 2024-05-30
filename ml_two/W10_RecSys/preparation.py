# BEGIN recprep_import
import os
import re
import csv

from glob import glob
# END recprep_import

# BEGIN recprep_directories
# change working directory of script to enclosing directory
this_directory = os.path.dirname(os.path.abspath(__file__))
os.chdir(this_directory)

data_directory = this_directory + '/netflix-prize-data'
output_file = data_directory + '/netflix-prize-data.csv'
# END recprep_directories

# BEGIN recprep_read_data
movie_titles = {}
with open(data_directory + '/movie_titles.csv', 'r', encoding = "ISO-8859-1") as movies_file:\
    
    for row in csv.reader(movies_file):
        movie_id = int(row[0])
        title = row[2]
        movie_titles[movie_id] = title
# END recprep_read_data

# BEGIN recprep_parse
print('Beginning parse...')

movie_ids = {}
customer_id = 0
incrementor = 0

with open(output_file, 'w+') as outfile:

    writer = csv.writer(outfile)
    writer.writerow(['CustomerID', 'MovieID', 'Rating', 'Movie'])
    sorted_list = sorted(glob(data_directory + '/combined_data_*.txt'))

    for filename in sorted_list:        
        with open(filename, 'r') as data_file:

            for line in data_file:
                new_id = re.search('[0-9]+(?=:)', line)

                if new_id != None:
                    customer_id = int(new_id.group(0)) - 1
                    print('Logging activity of customer %d.' % customer_id)

                else:
                    csv_line = [customer_id] + line.split(',')[:2 ]
                    movie_number = int(csv_line[1])

                    if movie_number in movie_titles:
                        csv_line.append(movie_titles[movie_number])

                        if movie_number not in movie_ids:
                            movie_ids[movie_number] = incrementor
                            incrementor += 1

                        csv_line[1] = movie_ids[movie_number]
                        writer.writerow(csv_line)
# END recprep_parse
