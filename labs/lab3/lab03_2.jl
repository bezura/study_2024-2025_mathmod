using DifferentialEquations, Plots;

#диф уравнение модели боевых действий между рег войсками
function reg_part(u, p, t)
    x, y = u
    a, b, c, h = p
    dx = -a*x - b*y + sin(2*t)
    dy = -c*x*y- h*y + 2*cos(t)
    return [dx, dy]
end

#нач условия
u0 = [50000, 39000]
p = [0.203, 0.705, 0.203, 0.801]
tspan = (0,1)

prob2 = ODEProblem(reg_part, u0, tspan, p)

sol2 = solve(prob2, Tsit5())

plt2 = plot(sol2, title = "Модель боевых действий #2", label = ["Армия X" "Армия Y"], xaxis = "Время", yaxis = "Численосить армиии", xlimit = [0,0.001])

savefig(plt2, "lab3_02.png")