include("../src/OPQ.jl")

function recurrence_coefficients_hermite(ops::HermitePolynomialSequence, N)
    @assert N >= 0
    a = zeros(N)
    b = zeros(N)
    T = eltype(ops)
    for i in 1:N
        a[i] = T(0)
        b[i] = (i == 0 ? gamma(T(1)/2) : (T(1)/2)*i)
    end
    a,b
end

function test_specific(N, k)
  ops = HermitePolynomialSequence()
  time = 0
  for i = 1:N
    tic()
    recurrence_coefficients_hermite(ops, k)
    time = time + toq()
  end
  time / N
end

function test_generic(N, k)
  ops = OPQ.HermitePolynomialSequence()
  time = 0
  for i = 1:N
    tic()
    OPQ.recurrence_coefficients(ops, k)
    time = time + toq()
  end
  time / N
end
