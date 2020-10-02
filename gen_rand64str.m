%% random str for orders
clc, clear
alpha = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';

for i = 1:5
    v = randi(length(alpha), [1 64]);
    disp(alpha(v))
end
