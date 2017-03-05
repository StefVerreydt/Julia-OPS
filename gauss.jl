function gauss_quadrature(N::Int, a, b)
    @assert N >= length(a)
    J=zeros(N,N)
    for n=1:N
      J[n,n]=a[n]
    end
    for n=2:N
      J[n,n-1]=sqrt(b[n])
      J[n-1,n]=J[n,n-1]
    end
    D,V = eig(J)
    I = sortperm(D)
    D = sort(D)
    V=V[:,I]
    D, b[1]*V[1,:].^2
end
