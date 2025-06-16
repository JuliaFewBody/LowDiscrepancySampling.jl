using LowDiscrepancySampling
using Documenter

DocMeta.setdocmeta!(LowDiscrepancySampling, :DocTestSetup, :(using LowDiscrepancySampling); recursive=true)

makedocs(;
    modules=[LowDiscrepancySampling],
    authors="Shuhei Ohno, Martin Mikkelsen",
    sitename="LowDiscrepancySampling.jl",
    format=Documenter.HTML(;
        canonical="https://JuliaFewBody.github.io/LowDiscrepancySampling.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/JuliaFewBody/LowDiscrepancySampling.jl",
    devbranch="main",
)
