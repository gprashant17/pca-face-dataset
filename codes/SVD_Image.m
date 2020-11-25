function rep = SVD_Image(subject)
    %{
        Function to form a representative image of a subject, by capturing 
        the characteristic features of 10 images.

        Arguments:
        subject - A cell array consisting of the 10 images of a subject

        Returns:
        rep - Representative image
    %}

    A = [];
    s = size(subject{1});
    for i = 1:10
        A = [A, reshape(subject{i},s(1)*s(2),1)];
    end

    % Mean Centering
    A = (A-mean(A,1));
    
    %SVD
    [U,S,V] = svd(A);
    %Multiplying the matrix with the principal direction to capture the
    %characteristic features
    rep = A*abs(V(:,1));
    
    %Eigenvalue decomposition of A'A - An alternative way to obtain
    %principal components
    
%     [V,D] = eig(A'*A);
%     ind = find(diag(D) == max(diag(D)));
%     rep = A*V(:,ind);    
     
     %Reshaping the vector to a matrix
     rep = reshape(rep,64,64);
     
     %Scaling values to the range (0,1)
     rep = mat2gray(rep);
     
end
