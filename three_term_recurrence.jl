function three_term_recurrence_old(a, b, x::Number)
  n = length(a)
  z = zeros(eltype(x),n+2)
  z[1] = 0
  z[2] = 1
  for i = 3:n+2
    z[i] = (x-a[i-2]) * z[i-1] - b[i-2]*z[i-2]
  end
  z[2:end]
end

function three_term_recurrence(a, b, x::Number)
  T = eltype(a)
  pkm2 = zero(T)
  pkm1 = one(T)
  pk = one(T)
  for k = 1:length(a)
    pk = (x-a[k]) * zkm1 - b[k]*zkm2
    pkm2 = zkm1
    pkm1 = zkm
  end
  zkm
end

function thee_term_recurrence(pol::OrthogonalPolynomial, x::Number)
  a,b = recurrence_coefficients(pol.ops, pol.n)
  three_term_recurrence(a,b,x)
end

immutable RecurrenceCoefficientAlpha{O <: OPS}
  pol::O
  n::Int
end
immutable RecurrenceCoefficientBeta{O <: OPS}
  pol::O
  n::Int
end
length(rc::RecurrenceCoefficientAlpha) = rc.n
length(rc::RecurrenceCoefficientBeta) = rc.n
eltype(rc::RecurrenceCoefficientAlpha) = eltype(rc.pol)
eltype(rc::RecurrenceCoefficientBeta) = eltype(rc.pol)
Base.getindex(r::RecurrenceCoefficientAlpha, i::Int ) = recurrence_coefficient_alpha(r.pol, i)
Base.getindex(r::RecurrenceCoefficientBeta, i::Int ) = recurrence_coefficient_beta(r.pol, i)
