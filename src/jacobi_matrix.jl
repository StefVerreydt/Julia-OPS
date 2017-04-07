function jacobi_matrix(N::Int, a, b)
  J=zeros(N,N)
  for n=1:N
    J[n,n]=a[n]
  end
  for n=2:N
    J[n,n-1]=sqrt(b[n])
    J[n-1,n]=J[n,n-1]
  end
  J
end
