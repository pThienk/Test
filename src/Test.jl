include("PlotsTests.jl")

module Test

using Plots

export greet, square

greet() = println("Hello World!")

function square(x)
    x^2
end

end

using .Test, .PlotsTest, Plots

figInd = 'a'

greet()
square(2) |> println

savefig(generateSomePlots2D(), "../plot_figures/" * figInd)
gui()
figInd += 1
readline()

savefig(someParametricPlots(), "../plot_figures/" * figInd)
gui()
figInd += 1
readline()

savefig(polarPlots(), "../plot_figures/" * figInd)
gui()
figInd += 1
readline()

savefig(scatterPlotGinger(), "../plot_figures/" * figInd)
gui()
figInd += 1
readline()

savefig(twoPlotsDecorated(), "../plot_figures/" * figInd)
gui()
figInd += 1
readline()

savefig(plotXNs(5), "../plot_figures/" * figInd)
gui()
figInd += 1
readline()

savefig(scatterPlots(), "../plot_figures/" * figInd)
gui()
figInd += 1
readline()

savefig(scatterPlotGinger2(), "../plot_figures/" * figInd)
gui()
figInd += 1
readline()
