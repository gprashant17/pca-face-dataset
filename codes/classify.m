function class = classify(face,REPS)
    %{
        Function to classify the input image by finding the least norm 
        with the representative images and the input image and 

        Arguments:
        face - Input image
        REPS - Cell array containing the representative images

        Returns:
        class - The class the input image belongs to 
    %}
    
    %Flattening the matrices and taking 2-norm of the difference (or Frobenius norm of the difference in matrices)
    err = zeros(length(REPS),1);
    for i = 1:length(REPS)
        err(i) = norm(reshape(face,4096,1)-reshape(REPS{i},4096,1));
    end
    
    %Returning the index of the minimum norm
    [val,class] = min(err);
end