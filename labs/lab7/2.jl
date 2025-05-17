using DifferentialEquations, Plots;

N0 = 885
n0 = 3
tspan = (0.0, 0.1)

function ode_fn(n, p, t)
	du = (0.000024 + 0.29 * n)*(N0-n)
	return du
end

prob = ODEProblem(ode_fn, n0, tspan)
sol = solve(prob, Tsit5(), saveat = 0.0001)

max_dn = 0;
max_dn_t = 0;
max_dn_n = 0;

for (i,t) in enumerate(sol.t)
	if sol(t) > max_dn
		global max_dn = sol(t)
		global max_dn_t = t
		global max_dn_n = sol.u[i]
	end
end


plt = plot(sol, dpi = 600, title = "Эф. рекламы (2)", yaxis = "N(t)", legend=false)
scatter!(plt, (max_dn_t, max_dn_n), c=:purple, legend=false)
savefig(plt, "2.png")