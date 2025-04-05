using DifferentialEquations, Plots; gr()

tspan = (0,55)
u0 = [0, -2]
p1 = [3, 4]
step = 0.05

f(t) = 5*sin(2*t)

function f1(u, p, t)
	x, y = u
	g, w = p
	dx = y
	dy = -g .*y - w^2 .*x .+f(t)
	return [dx, dy]
end

problem3 = ODEProblem(f1, u0, tspan, p1)
sol3 = solve(problem3, Tsit5(), saveat = step)

plot(sol3)
savefig("lab4_3_sol.png")

plot(sol3, vars=(2,1))
savefig("lab4_3_ph.png")