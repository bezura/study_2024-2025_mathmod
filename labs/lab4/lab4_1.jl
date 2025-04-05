using DifferentialEquations, Plots; gr()

tspan = (0,55)
u0 = [0, -2]
p1 = [0, 4]
step = 0.05

function f1(u, p, t)
	x, y = u
	g, w = p
	dx = y
	dy = -g .*y - w^2 .*x
	return [dx, dy]
end

problem1 = ODEProblem(f1, u0, tspan, p1)
sol1 = solve(problem1, Tsit5(), saveat = step)

plot(sol1)
savefig("lab4_1_sol.png")

plot(sol1, vars=(2,1))
savefig("lab4_1_ph.png")