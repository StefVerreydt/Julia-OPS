module OPQ
  include("orthogonal_polynomials.jl")
  include("recurrence_coefficients_hermite.jl")
  include("recurrence_coefficients_jacobi.jl")
  include("recurrence_coefficients_laguerre.jl")
  include("recurrence_coefficients_general.jl")
  include("three_term_recurrence.jl")
  include("three_term_recurrence_chebyshev.jl")
  include("jacobi_matrix.jl")
  include("gauss.jl")
  include("specify_polynomial.jl")
  include("plot.jl")
end
