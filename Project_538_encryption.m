prompt= 'What message would you like to encrypt?  ';
message = input(prompt,'s');

%variable we need
b = 3.8;
etta = 0.7;
N_0 = 250;
x_0 = 0.23232300000000;

% define our logistic function
f = @(x) b*x*(1-x);

%split up the interval [0.2, 0.8] into 256 intervals
intervals = zeros(2, 256);
epsilon = (0.8-0.2)/256;  % The length of the intervals which is defined natrually is the variable called epsilon in the article, so interesting!
start = 0.2;
for i = 1:1:256
    intervals([1,2],i) = [start; start+epsilon];
    start = start + epsilon;
end


%Introduce string 
numerical_val = double(message);
L = numel(numerical_val);
cipher_text = zeros(L,1);

for i = 1:1:L
    int = intervals([1,2],numerical_val(i));
    %disp(message(i))
    if i ~= 1
        x_0 = current;
        
    end
    current  = f(x_0);
    k=1;
    while k < N_0 || kappa < etta
        if k>=N_0   % this means the reason it's re-entering the loop is because kappa< etta
            current = f(current);   % forces it to keep iterating in the next while loop
            k = k+1;
        end
        while current < int(1) || current > int(2)
            current = f(current);
            k = k+1;                             % k is the ciphertext
        end
        if k < N_0 % To avoid infinite loop, we are going to go to the next iteration 
            current = f(current);
            k = k+1;
        end
        kappa = rand(1,1);
    end
    cipher_text(i,1) = k;
end

g=sprintf('%d ', cipher_text);
fprintf('Vector1 : [ %s', g);
fprintf(']\n');



