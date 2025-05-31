using Plots, DifferentialEquations
p_cr = 12
t1 = 19
p1 = 7.9
t2 = 29
p2 = 5.8
N = 39
q = 1

a1 = p_cr/(t1^2*p1^2*N*q)
a2 = p_cr/(t2^2*p2^2*N*q)
b = p_cr/(t1^2*t2^2*p1^2*p2^2*N*q)
c1 = (p_cr-p1)/(t1*p1)
c2 = (p_cr-p2)/(t2*p2)

u0 = [4.9,4.4]
p = [a1,a2,b,c1,c2]
tspan = (0.0,30.0)

function ode_fn(u,p,t)
	M01, M02 = u
	a1, a2, b, c1, c2 = p
	M1 = M01 -(b/c1)*M01*M02 - (a1/c1)*M01^2
	M2 = (c2/c1)*M02-(b/c1)*M01*M02-(a2/c1)*M02^2
	return [M1, M2]
end

prob = ODEProblem(ode_fn, u0, tspan, p)
sol = solve(prob, Tsit5(), saveat = 0.01)
plt = plot(sol, yaxis = "Оборотные средства предприятия", label = ["M1" "M2"], c = ["green" "purple"])
savefig(plt, "lab08_1.png")