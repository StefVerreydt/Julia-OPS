abstract OrthogonalPolynomialSequence

typealias OPS OrthogonalPolynomialSequence


# The monic generalized Hermite polynomials
# with parameter mu. These are orthogonal on [-Inf,Inf]
# relative to the weight function w(t)=|t|exp(-t^2).
immutable HermitePolynomialSequence{T <: Number} <: OrthogonalPolynomialSequence
end

HermitePolynomialSequence() = HermitePolynomialSequence{Float64}()

# The monic Jacobi polynomials with parameters
# a and b. These are orthogonal on [-1,1] relative to the
# weight function w(t)=(1-t)^a(1+t)^b.
immutable JacobiPolynomialSequence{T <: Number} <: OrthogonalPolynomialSequence #polJac = OPQ.JacobiPolynomialSequence(0.5,0.5) ??
  a :: T
  b :: T
  function JacobiPolynomialSequence(a, b)
      @assert a >= -1
      @assert b >= -1
      new(a,b)
  end

end

JacobiPolynomialSequence(a, b) = JacobiPolynomialSequence(promote(a,b)...)

JacobiPolynomialSequence{T}(a::T, b::T) = JacobiPolynomialSequence{T}(a,b)

# The monic generalized Laguerre polynomials
# with parameter a. These are orthogonal on [0,Inf] relative
# to the weight function w(t)=t^a exp(-t).
immutable LaguerrePolynomialSequence{T <: Number} <: OrthogonalPolynomialSequence
  a :: T
end


immutable OrthogonalPolynomial{P}
    ops ::  P
    n   ::  Int64

    function OrthogonalPolynomial(ops, n)
        @assert n >= 0
        new(ops, n)
    end
end

Base.getindex(ops::OrthogonalPolynomialSequence, n) = OrthogonalPolynomial(ops, n)


##??
immutable OPSWithPrecision{T}
  ops :: OPS
  typeIndicator :: T #1.0 of Float64?
end

immutable OPWithPrecision{T}
  op :: OrthogonalPolynomial
  n :: Int64
  typeIndicator :: T
end

Base.getindex(OPSWP::OPSWithPrecision, n) = OPWithPrecision(OrthogonalPolynomial(OPSWP.ops, n) , n)

# eval(p::OrthogonalPolynomial, x) = ...
# aan de hand van drietermsrecursiebetrekking

# jacobi_matrix(p::OrthogonalPolynomial) =

# roots(p::OrthogonalPolynomial) = ...
# via eigenwaarden van Jacobi matrix

# Quid Legendre, veeltermen met zelfberekende recursiecoefficiencent,

# plotten?

# gaussregel, bereken van integralen
