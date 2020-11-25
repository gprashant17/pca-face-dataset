load("subjects.mat");

%Getting the representative images for each subject
REP1 = SVD_Image(subjects(1,:));
REP2 = SVD_Image(subjects(2,:));
REP3 = SVD_Image(subjects(3,:));
REP4 = SVD_Image(subjects(4,:));
REP5 = SVD_Image(subjects(5,:));
REP6 = SVD_Image(subjects(6,:));
REP7 = SVD_Image(subjects(7,:));
REP8 = SVD_Image(subjects(8,:));
REP9 = SVD_Image(subjects(9,:));
REP10 = SVD_Image(subjects(10,:));
REP11 = SVD_Image(subjects(11,:));
REP12 = SVD_Image(subjects(12,:));
REP13 = SVD_Image(subjects(13,:));
REP14 = SVD_Image(subjects(14,:));
REP15 = SVD_Image(subjects(15,:));

class_mat = repmat([1:15]',1,10);
pred_mat = zeros(15,10);
REPS = {REP1,REP2,REP3,REP4,REP5,REP6,REP7,REP8,REP9,REP10,REP11,REP12,REP13,REP14,REP15};

for i = 1:15
    for j = 1:10
        pred_mat(i,j) = classify(subjects{i,j},REPS);
    end
end


correct = sum(sum((pred_mat-class_mat)==0));

%Accuracy percentage
accuracy = correct*100/150;

fprintf("\nNumber of images classified correctly = %d out of 150\n",correct)
fprintf("Accuracy = %f %%\n\n",accuracy)

%Use imshow(REPS{i}), where 1<=i<=15, to view the representative images.

%Displaying all representative images
figure;
for i =1:15
    subplot(5,3,i)
    imshow(REPS{i})
    xlabel(i)
end

