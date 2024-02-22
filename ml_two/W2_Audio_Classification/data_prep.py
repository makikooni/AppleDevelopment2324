#data: https://github.com/karolpiczak/ESC-50


import os
#library allowing easy copypasting 
import shutil
import pandas as pd

classes_to_include =  [
    'dog', 'rooster', 'pig', 'cow', 'frog', 'cat', 'hen',
    'insects', 'sheep', 'crow']

sounds_directory = "/Users/wefalinska/Downloads/ESC-50-master/audio/"
output_directory = "/Users/wefalinska/Github/appleDevelopment2324/ml_two/W2_Audio_Classification/Organised_Data/"

#using os inside python file to create folders
try:
    os.makedirs(output_directory)
except OSError:
    if not os.path.isdir(output_directory):
        raise
    
for class_name in classes_to_include:
    class_directory = output_directory + class_name + '/'
    try:
        os.makedirs(class_directory)
    except OSError:
        if not os.path.isdir(class_directory):
            raise
        
#reading CSV file
input_classes_filename = '/Users/wefalinska/Downloads/ESC-50-master/meta/esc50.csv'

classes_file = pd.read_csv(
    input_classes_filename,
    encoding='utf-8',
    header = 'infer'
)


#Data exploration:

print(classes_file.shape)
#2000, 7 

print(classes_file.head(5))


for line in classes_file.itertuples(index = False):
    print(line)
    break

for line in classes_file.itertuples(index = False):
    print(line[0]) #file name
    print(line[3]) # category
    break

for line in classes_file.itertuples(index = False):
    fileCategory = line[3]
    
    if fileCategory in classes_to_include:
        fileName = line[0]
        file_src = sounds_directory + fileName
        file_dst = output_directory + fileCategory + "/" + fileName
        shutil.copy2(file_src, file_dst)