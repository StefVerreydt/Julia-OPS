include("../src/OPQ.jl")

function test_r_jacobi_time(N, k)
  time = 0
  for i = 1:N
    a = 2*rand()  - 1
    b = 2*rand()  - 1
    ops = OPQ.JacobiPolynomialSequence(a,b)
    tic()
    OPQ.recurrence_coefficients(ops, k)
    time = time + toq()
  end
  time / N
end
