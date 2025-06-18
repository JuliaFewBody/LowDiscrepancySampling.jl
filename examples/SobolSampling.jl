using Sobol
using CairoMakie

s = SobolSeq(2)
p = reduce(hcat, next!(s) for i = 1:1024)'
plot(p[:,1], p[:,2])