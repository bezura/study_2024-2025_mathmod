using DifferentialEquations, Plots;

N0 = 885
n0 = 3
tspan = (0.0, 30.0)

function ode_fn(n, p, t)
	du = (0.83 + 0.00013 * n)*(N0-n)
	return du
end

prob = ODEProblem(ode_fn, n0, tspan)
sol = solve(prob, Tsit5(), saveat = 0.01)

plt = plot(sol, dpi = 600, title = "Эф. рекламы (1)", yaxis = "N(t)", legend=false)
savefig(plt, "1.png")