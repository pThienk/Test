module Test

export greet, square
greet() = println("Hello World!")

function square(x)
    x^2
end

end # module Test

using .Test

greet()
square(2) |> println