using DifferentialEquations, Plots; gr()

tspan = (0,55)
u0 = [0, -2]
p1 = [4, 8]
step = 0.05

function f1(u, p, t)
	x, y = u
	g, w = p
	dx = y
	dy = -g .*y - w^2 .*x
	return [dx, dy]
end

problem2 = ODEProblem(f1, u0, tspan, p1)
sol2 = solve(problem2, Tsit5(), saveat = step)

plot(sol2)
savefig("lab4_2_sol.png")

plot(sol2, vars=(2,1))
savefig("lab4_2_ph.png")