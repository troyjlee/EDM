% N is the size of the matrix
% Change this to play around

N = 5;

% Create the standard Euclidean distance matrix 
% M(i,j) = (i-j)^2 for 1 <= i,j <= N

v = [1:N]';
M=v*ones(1,N)-ones(N,1)*v';
M=M.*M;


% Now we build the factorization M = X*Y'

X=[];

k = N;
counter = 0;
while k > 1
	l = (k+1)/2;
	counter += 1;
	V = zeros(N,2);
	d=abs(v-l);
	mask = (v > l);
	V=[2*d.*mask, 2*d.*(1-mask)];
	v = v - 2*d.*mask;
	X=[X V];
	k = floor((k+1)/2);
endwhile

% Y will have the same columns as X, but the ordering 
% will be 2,1,4,3,6,5, etc.

R = kron(eye(counter), [0 1;1 0]);

Y = X*R;
T = X * Y';

disp("A nonnegative factorization of M is given by X*Y^t")
M
X
Y
