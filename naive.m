
%2x2 test : x = [4; 2]

A = [2, -3;
     5, -6]

b = [2;
     8]


%{
% 3x3 test : x = [1; 1; 1;]

A = [1, 2, -1;
     0, 3, 1;
     2, -1, 1]
b = [2;
     4;
     2]
%}

%{
% 4x4 test : x = [-1; -4; 10; -6]

A = [1, -1, 1, 2; 
     0, 2, 1, 0; 
     1, 3, 4, 4;
     4, 2, 1, -1]

b = [1; 
     2; 
     3;
     4]
%}

[n, ~] = size(A)

for(j = 1 : n - 1)
    for(i = j + 1 : n)
        
        if(A(j, j) == 0) 
            disp("Error: div by zero")
            return
        end
            
        m = A(i, j)/A(j, j)
        
        for(k = j : n)
            A(i, k) = A(i, k) - (m * A(j, k))
        end
        b(i) = b(i) - (m * b(j))
    end
end

for(i = n : -1 : 1)
    b(i) = b(i) / A(i, i)
    for(j = i - 1 : -1 : 1)
        b(j) = b(j) - A(j, i) * b(i)
    end
end

disp("Solution vector:")
disp(b)