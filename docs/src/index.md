```@meta
CurrentModule = LowDiscrepancySampling
```

# LowDiscrepancySampling

Documentation for [LowDiscrepancySampling](https://github.com/JuliaFewBody/LowDiscrepancySampling.jl).

Here are two examples of how to use the package

```@example Hammersley
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
```

```@example Halton
using LowDiscrepancySampling
using CairoMakie

n = 1000 

corput_points = [ (corput(i, 2), corput(i, 3)) for i in 1:n ]

hammersley_points = hammersley_set(n, 2)

let 
    f = Figure(resolution = (800, 400))
    ax1 = Axis(f[1, 1], title = "Corput Sequence (2D)", xlabel = "x", ylabel = "y")
    scatter!(ax1, first.(corput_points), last.(corput_points), color = :dodgerblue, markersize = 8)

    ax2 = Axis(f[1, 2], title = "Hammersley Set (2D)", xlabel = "x", ylabel = "y")
    scatter!(ax2, hammersley_points[:, 1], hammersley_points[:, 2], color = :orangered, markersize = 8)
    f
end

```

```@autodocs
Modules = [LowDiscrepancySampling]
```