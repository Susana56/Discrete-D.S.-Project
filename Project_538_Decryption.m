% This is the decryption file
%It will take a message in cyphertext and return the message it should be
%The receiver should know b,x_0, and how the interval is being split up
prompt = 'What Ciphertext would you like to decrypt?  ';
cipher_text = input(prompt);


b = 3.8;
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

L = numel(cipher_text);
message_num = zeros(L,1);

 
for i=1:1:L
    if i ~= 1
        x_0 = current;
    end
    
    for j = 1:1:cipher_text(i)    % I am not really sure why it works for -1 but it does?? The enryption method starts at 1 so this seems weird to me 
        if j == 1
            current = f(x_0);
        else
            current = f(current);
        end
    end
    
    for k = 1:1:256
        int = intervals([1,2],k);
        if current > int(1) && current < int(2)
            message_num(i,1) = k;
            break
        end
    end
end

message = char(message_num);
disp(message)


