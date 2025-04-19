
using Plots
using DifferentialEquations

function ode_fn(du, u, p, t)
    x, y = u
    dx = -0.24*u[1] + 0.044 * x * y
    dy = 0.44 * u[2] - 0.024 * x * y
    du = [dx, dy]
end

v0 = [4, 10]
tspan = (0.0, 60.0)
prob = ODEProblem(ode_fn, v0, tspan)
sol = solve(prob, dtmax=0.05)
X = [u[1] for u in sol.u]
Y = [u[2] for u in sol.u]
T = [t for t in sol.t]

plt = plot(dpi=300,legend=false)

plot!(plt, X, Y, color=:blue)

savefig(plt, "lab05_1.png")

plt2 = plot( dpi=300, legend=true)

plot!(plt2, T, X, label="Численность жертв", color=:red)

plot!(plt2, T, Y, label="Численность хищников", color=:green)

savefig(plt2, "lab05_2.png")
