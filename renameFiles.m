% This mat script renames the files

directory = '/Users/Hong/Downloads/Data/breast-histopathology-images/';
% directory = 'C:/Users/74453/deep learning/final project/breast-histopathology-images/';
patients = dir(directory);
class = [];
counter = 1;

for i = 1:length(patients)
    % get all the patient folder's names
    patient = patients(i).name;
    patient1 = str2double(patient);
    % skip if empty
    if isnan(patient1)
    else
        % find positive and negative folders
        positive = dir([directory patient '/1/']);
        negative = dir([directory patient '/0/']);
        for j = 3:length(positive)
            % obtain the old file name and new file name
            % rename using movefile function
            name = positive(j).name;
            oldname = [directory patient '/1/' name];
            newname = [directory num2str(counter) '.png'];
            movefile(oldname,newname);
            % save classification
            class{counter} = 1;
            counter = counter +1;
            
        end
        for j = 3:length(negative)
            % same as above loop but for negative files
            name = negative(j).name;
            oldname = [directory patient '/0/' name];
            newname = [directory num2str(counter) '.png'];
            movefile(oldname,newname);
            class{counter} = 0;
            counter = counter +1;
        end
    end

end
% write the classification result into a csv
csvwrite('classification.csv',class');
