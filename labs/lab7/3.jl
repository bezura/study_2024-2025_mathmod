using DifferentialEquations, Plots;

N0 = 885
n0 = 3
tspan = (0.0, 2.0)

function ode_fn(n, p, t)
	du = (0.5 * t * + 0.3 * t * n)*(N0-n)
	return du
end

prob = ODEProblem(ode_fn, n0, tspan)
sol = solve(prob, Tsit5(), saveat = 0.001)


plt = plot(sol, dpi = 600, title = "Эф. рекламы (3)", yaxis = "N(t)", legend=false)
savefig(plt, "3.png")