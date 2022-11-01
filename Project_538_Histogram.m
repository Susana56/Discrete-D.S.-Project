% This is the code for the plot

message = 'The film wants us to feel all the emotions going through Lila and learn with her the truth about what happened to her sister and to the Private Investigator, Arbogast. The setting of the clip is two distinct staircases which lead Lila to the fruit cellar where she finds Mrs. Bates. The area n which all the action occurred was a relatively small space which added to the feeling of overwhelming anxiety that Norman would quickly find her. Norman''s character had a dramatic costuming and hair transformation that revealed to us who the killer was. Early in the clip, he was dressed normally as we had known him; a white-button down shirt, formal dress pants, and combed hair. When he enters the fruit cellar scene, he is dressed in a long dress with a grey wig resembling Mrs. Bates. From that costume change, we realize that Norman has taken on a new personality, his mother, and he is in a different mental state than he was before.Throughout the film, the knife is used as a metaphorical prop for death. Thus, the familiar knife raising stance Norman performed in the clip made the audience believe, for a second, that Lila was about to die. This entrance to the fruit cellar was accompanied by significant non-diegetic and semi-diegetic sounds. As he is holding the knife in the air, we hear the same screeching sound that was played when Marion died. We also hear, in Mrs. Bate''s voice, " I am Mrs. Bates!" followed by screams as Norman is resisting being detained. This is interpreted as Normans thoughts and how he is stuck with Mrs. Bates personality. The close-up of Lila''s face, following Norman''s entrance and Mrs. Bates corpse, revealed her fear. After Sam entered the scene, there was a close-up of the knife and the wig on the floor which emphasized their significance to the scene. Norman''s wig falling on the ground re-emphasized dramatically that it was him behind all the murders, under the mind of Mrs.Bates. Mrs. Bates was a prop in the film that until this clip was believed to be a serial killer.This scene at the beginning of the film tells us that a young man has just been kidnapped while he was lost in a residential neighborhood, which was lit only by the houses and the street lamps. He was talking on the phone with a romantic partner who seemed to have known where he was and that he was on his way to a specific location. We heard this conversation from his side only. He jokingly told her that it was her fault for him finding himself in this confusing neighborhood. It seemed that she had to end the call so we quickly hear the young man say his goodbyes. Shortly after, the steadicam camera rotates to face his back and a driving car becomes visible in the frame. We can imagine the line of action to be the sidewalk that the man finds himself walking on. The scene obeys the 180-rules by rotating the camera around to face the character''s front or back. The character leaves the line of 1 2 3 4 5 6 7 8 9 0 0 9 8 76756463526173647565847362375859547636352647364875!@#$%&*()1223345566685948398856767849859456798498!@#$%^&*&^%%$##~~~~~~~~~~~~~~~~~~58475846676283783455';
%variable we need
b = 3.78;
etta = 0.7;
N_0 = 250;
x_0 = 0.8675473845757929;

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

histogram(cipher_text, 100);
hold on


b = 3.8;
etta = 0.0;
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

histogram(cipher_text, 100);
title('Frequency distribution for an English text with 3100 characters')
xlabel('Ciphertext, the number of iterations ') 
ylabel('Frequency') 
legend('etta = 0.7', 'etta = 0.0');
