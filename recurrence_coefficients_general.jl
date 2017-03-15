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


immutable RecurrenceCoefficientAlpha{T <: Number}
  pol::OrthogonalPolynomialSequence{T}
  n::Int
end
immutable RecurrenceCoefficientBeta{T <: Number} # OPQ.RecurrenceCoefficientAlpha{OPQ.HermitePolynomialSequence{Float64}}
  pol::OrthogonalPolynomialSequence{T} # OPQ.HermitePolynomialSequence{Float64}
  n::Int
end
Base.length(rc::RecurrenceCoefficientAlpha) = rc.n
Base.length(rc::RecurrenceCoefficientBeta) = rc.n
Base.eltype(rc::RecurrenceCoefficientAlpha) = eltype(rc.pol)
Base.eltype(rc::RecurrenceCoefficientBeta) = eltype(rc.pol)
Base.getindex{T}(r::RecurrenceCoefficientAlpha{T}, i::Int ) = recurrence_coefficient_alpha{T}(r.pol, i)
Base.getindex{T}(r::RecurrenceCoefficientBeta{T}, i::Int ) = recurrence_coefficient_beta{T}(r.pol, i)
