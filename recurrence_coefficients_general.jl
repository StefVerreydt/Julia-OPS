function recurrence_coefficients(pol::OrthogonalPolynomialSequence, N::Int)
    @assert N >= 0
    a = zeros(N)
    b = zeros(N)
    for i in 1:N
        a[i] = recurrence_coefficient_alpha(pol, i-1)
        b[i] = recurrence_coefficient_beta(pol, i-1)
    end
    a,b
end

recurrence_coefficients(p::OrthogonalPolynomial) = recurrence_coefficients(p.ops, p.n)


immutable RecurrenceCoefficientAlpha{O <: OPS}
  pol::O
  n::Int
end
immutable RecurrenceCoefficientBeta{O <: OPS}
  pol::O
  n::Int
end
Base.length(rc::RecurrenceCoefficientAlpha) = rc.n
Base.length(rc::RecurrenceCoefficientBeta) = rc.n
Base.eltype(rc::RecurrenceCoefficientAlpha) = getPrecision(rc.pol)
Base.eltype(rc::RecurrenceCoefficientBeta) = getPrecision(rc.pol)
Base.getindex(r::RecurrenceCoefficientAlpha, i::Int ) = recurrence_coefficient_alpha(r.pol, i)
Base.getindex(r::RecurrenceCoefficientBeta, i::Int ) = recurrence_coefficient_beta(r.pol, i)
