using LowDiscrepancySampling
using CairoMakie

n = 1000

corput_points = [ (corput(i, 2), corput(i, 3)) for i in 1:n ]

hammersley_points = hammersley_set(n, 2)

f = Figure(resolution = (800, 400))
ax1 = Axis(f[1, 1], title = "Corput Sequence (2D)", xlabel = "x", ylabel = "y")
scatter!(ax1, first.(corput_points), last.(corput_points), color = :dodgerblue, markersize = 8)

ax2 = Axis(f[1, 2], title = "Hammersley Set (2D)", xlabel = "x", ylabel = "y")
scatter!(ax2, hammersley_points[:, 1], hammersley_points[:, 2], color = :orangered, markersize = 8)

f
