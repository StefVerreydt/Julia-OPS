Pkg.add("Plots")
using Plots

function plot_ops{T}(ops:: OrthogonalPolynomialSequence{T}, N::Int, from::Number, to::Number, points::Int)
  a,b = recurrence_coefficients(ops, N)
  yvals = zeros(T, points)
  step = (to-from)/points
  xvals = from:step:to
  for i = 1:length(yvals)
    yvals[i] = three_term_recurrence(a,b,xvals[i])
    println(yvals[i])
  end
  plot(xvals,yvals,#=title = string(typeof(ops), " : ", from, ":", points,":",to) , =#xlabel = "X", ylabel = "Y", label=string(typeof(ops)#=, " : ", from, ":", points,":",to=#))
end
