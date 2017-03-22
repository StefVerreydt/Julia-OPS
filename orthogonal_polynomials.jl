abstract OrthogonalPolynomialSequence

typealias OPS OrthogonalPolynomialSequence


# The monic generalized Hermite polynomials
# with parameter mu. These are orthogonal on [-Inf,Inf]
# relative to the weight function w(t)=|t|exp(-t^2).
immutable HermitePolynomialSequence{T <: Number} <: OrthogonalPolynomialSequence
end

# Nadeel: getPrecision nodig voor elk type OPS
function getPrecision{T}(pol::HermitePolynomialSequence{T})
  z = T
end

HermitePolynomialSequence() = HermitePolynomialSequence{Float64}()

# The monic Jacobi polynomials with parameters
# a and b. These are orthogonal on [-1,1] relative to the
# weight function w(t)=(1-t)^a(1+t)^b.
immutable JacobiPolynomialSequence{T <: Number} <: OrthogonalPolynomialSequence
  a :: T
  b :: T
  function JacobiPolynomialSequence(a, b)
      @assert a >= -1
      @assert b >= -1
      new(a,b)
  end
end

# JacobiPolynomialSequence(a, b) = JacobiPolynomialSequence(promote(a,b)...)

# JacobiPolynomialSequence{T}(a::T, b::T) = JacobiPolynomialSequence{T}(a,b)

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
