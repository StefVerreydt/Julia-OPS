function gauss_quadrature(N::Int, a, b)
    @assert N >= length(a)
    J=jacobi_matrix(N,a,b)
    D,V = eig(J)
    I = sortperm(D)
    D = sort(D) # D = D[:,I]?
    V=V[:,I]
    D, b[1]*V[1,:].^2
end
