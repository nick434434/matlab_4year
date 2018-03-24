function C = Circulant(vec,direction)

if (nargin<1) || (nargin > 2)
  error('circulant takes only one or two input arguments')
end

if (nargin < 2) || isempty(direction)
  direction = 1;
elseif ~ismember(direction,[1,-1])
  error('direction must be either +1 or -1 if it is supplied')
end

if ~isvector(vec)
  error('vec must be a vector')
elseif length(vec) == 1
  C = vec;
  return
end

n = length(vec);
n1 = n-1;

if direction == -1
  C = repmat(0:n1,n,1);
  C = vec(mod(C+C',n)+1);
else   
  if size(vec,1) == 1
    rind = 1:n;
    cind =  n + 2 - rind' ;
    cind(cind == (n+1)) = 1;
  else
    cind = (1:n)';
    rind =  n + 2 - cind';
    rind(1) = 1;
  end
  C = vec(toeplitz(cind,rind));
  
end
return

