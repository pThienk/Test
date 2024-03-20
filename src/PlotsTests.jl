module PlotsTest

using Plots, LaTeXStrings

export generateSomePlots2D, someParametricPlots, polarPlots, scatterPlotGinger, scatterPlots, scatterPlotGinger2, twoPlotsDecorated, plotXNs

function generateSomePlots2D()

    f(x) = sin(1/x)

    x = 0:5π/1000:5π

    p1 = plot([x; 5π .+ x], [sin.(x); -exp.(-x .* 0.2) .* sin.(x)])

    parabola = plot(x -> x^2)
    ps = plot(sin, 0, 2π)

    plot!(ps, cos)

    fPlot = plot(ps, p1, plot(f), parabola)
    fPlot
end

function someParametricPlots()
    spiral = plot(r -> r*cos(r), r -> r*sin(r), 0, 10π)

    circle = plot(sin, cos, 0, 2π)

    fPlot = plot(spiral, circle)
    fPlot
end

function polarPlots()

    star = plot(0:2π/1000:2π, θ -> 1 + 0.2*sin(8θ); proj=:polar)
    spiral = plot(0:2π/1000:2π, θ -> 0.2*θ; proj=:polar)

    fPlot = plot(star, spiral)
    fPlot
end

function ginger(x, y, a)
    x2 = 1 - y + a*abs(x)
    y2 = x
    x2, y2
end

function scatterPlotGinger()
    x = [20.0]; y = [9.0]
    for i ∈ 1:4000
        x2, y2 = ginger(x[end], y[end], 1.76)
        push!(x, x2)
        push!(y, y2)
    end

    fPlot = scatter(x, y; ms=0.5, legend=false)
    fPlot
end

function twoPlotsDecorated()
    p1 = plot(sin, cos, 0, 2π; grid=false, title="A circle", ratio=1, ticks=false, legend=false)
    p2 = plot(x -> x^2, -1, 1; grid=false, title="A parabola", gridalpha=0.4, gridstyle=:dot, legend=false)

    fPlot = plot(p1, p2; plot_title="Two shapes", plot_titlefontsize=20)
    fPlot
end

function plotXNs(n)
   pl = plot() 
   for i ∈ 1:n
        plot!(pl, x -> x^i; lw=3, ls=:auto, label=i)
   end

   fPlot = plot!(pl; legend=:topleft, legendtitle="Exponent") 
   fPlot
end

function scatterPlots() 
    x = [20.0]; y = [9.0]
    for i ∈ 1:20000
        x2, y2 = ginger(x[end], y[end], 1.60)
        push!(x, x2)
        push!(y, y2)
    end

    p1 = scatter(x, y; smooth=true, ms=1, xguide="x", yguide="y", legend=false, guidefontsize=18)

    p2 = plot(x[1:100],smooth=true, legend=false)
    p2 = plot!(p2, x[1:100]; lc=:lightgray, legend=false, xguide="iterations", yguide="x", guidefontsize=18)

    fPlot = plot(p1, p2; plot_title="Gingerbread map for a = 1.6", plot_titlefontsize=22) 
    fPlot
end

function scatterPlotGinger2()
    x = [20.0]; y = [9.0]
    for i ∈ 1:100000 
        x2, y2 = ginger(x[end], y[end], 1.40)
        push!(x, x2)
        push!(y, y2)
    end

    p1 = scatter(x, y; ms=0.1, legend=false)
    lens!(p1, [-26, -22], [31, 38]; inset=(1, bbox(0.1, 0, 0.3, 0.3)), ticks=false, framestyle=:box, subplot=2, linecolor=:green, linestyle=:dot)

    fPlot = p1
    fPlot
end

end