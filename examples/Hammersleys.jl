using LowDiscrepancySampling
using CairoMakie

P = 300
N = 10

H = hammersley_set(P, N)'

let
    f = Figure(resolution = (1200, 400))
    ax1 = Axis(f[1, 1], title = "H1 vs H2", xlabel = "H1", ylabel = "H2")
    scatter!(ax1, H[1, :], H[2, :], color = :red, markersize = 5)

    ax2 = Axis(f[1, 2], title = "H1 vs H3", xlabel = "H1", ylabel = "H3")
    scatter!(ax2, H[1, :], H[3, :], color = :blue, markersize = 5)

    ax3 = Axis(f[1, 3], title = "H1 vs H4", xlabel = "H1", ylabel = "H4")
    scatter!(ax3, H[1, :], H[4, :], color = :magenta, markersize = 5)

    f
end

