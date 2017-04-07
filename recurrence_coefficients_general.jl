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

immutable RecurrenceCoefficientAlpha{T <: Number} # OPQ.RecurrenceCoefficientAlpha{OPQ.HermitePolynomialSequence{Float64}}
  pol::OrthogonalPolynomialSequence{T} # OPQ.HermitePolynomialSequence{Float64}
  n::Int
end


immutable RecurrenceCoefficientBeta{T <: Number} # OPQ.RecurrenceCoefficientAlpha{OPQ.HermitePolynomialSequence{Float64}}
  pol::OrthogonalPolynomialSequence{T} # OPQ.HermitePolynomialSequence{Float64}
  n::Int
end

#Make RecurrenceCoefficientAlpha and -Beta iterable:
Base.start(rec::RecurrenceCoefficientAlpha) = 1
Base.next(rec::RecurrenceCoefficientAlpha, n::Int) = getindex(rec,n) , n+1
Base.done(rec::RecurrenceCoefficientAlpha, n::Int) = n == rec.n

Base.start(rec::RecurrenceCoefficientBeta) = 1
Base.next(rec::RecurrenceCoefficientBeta, n::Int) = getindex(rec,n) , n+1
Base.done(rec::RecurrenceCoefficientBeta, n::Int) = n == rec.n



Base.length(rc::RecurrenceCoefficientAlpha) = rc.n
Base.length(rc::RecurrenceCoefficientBeta) = rc.n
Base.eltype(rc::RecurrenceCoefficientAlpha) = eltype(rc.pol)
Base.eltype(rc::RecurrenceCoefficientBeta) = eltype(rc.pol)
Base.getindex(r::RecurrenceCoefficientAlpha, i::Int ) = recurrence_coefficient_alpha(r.pol, i)
Base.getindex(r::RecurrenceCoefficientBeta, i::Int ) = recurrence_coefficient_beta(r.pol, i)
