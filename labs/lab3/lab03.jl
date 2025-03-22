using DifferentialEquations, Plots;

#диф уравнение модели боевых действий между рег войсками
function reg_part(u, p, t)
    x, y = u
    a, b, c, h = p
    dx = -a*x - b*y + sin(t+7) + 1
    dy = -c*x - h*y + cos(t+4) + 1
    return [dx, dy]
end

#нач условия
u0 = [50000, 39000]
p = [0.445, 0.806, 0.419, 0.703]
tspan = (0,1)

prob1 = ODEProblem(reg_part, u0, tspan, p)

sol1 = solve(prob1, Tsit5())

plt1 = plot(sol1, title = "Модель боевых действий #1", label = ["Армия X" "Армия Y"], xaxis = "Время", yaxis = "Численосить армиии")

savefig(plt1, "lab3_01.png")