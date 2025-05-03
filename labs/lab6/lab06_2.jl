using Plots
using DifferentialEquations

N = 18000
I0 = 118 # заболевшие особи
R0 = 18 # особи с иммунитетом
S0 = N - I0 - R0 # здоровые, но восприимчивые особи
u0 = [S0, I0, R0]
p = [0.1, 0.05]
tspan = (0.0, 200.0)

function ode_fn(u,p,t)
    (S,I,R) = u
    (b, c) = p
    N = S+I+R
    dS = -(b*S*I)/N
    dI = (b*S*I)/N -c*I
    dR = c*I
    return [dS, dI, dR]
end

prob = ODEProblem(ode_fn, u0, tspan, p)
sol = solve(prob, Tsit5(), saveat = 0.1)

S = [u[1] for u in sol.u]
I = [u[2] for u in sol.u]
R = [u[3] for u in sol.u]
T = [t for t in sol.t]
plt = plot(dpi = 600, legend = :topright)
plot!(plt, T, S, label = "Восприимчивые особи", color = :blue)
plot!(plt, T, I, label = "Инфициорованные особи", color = :green)
plot!(plt, T, R, label = "Особи с имунитетом", color = :red)

savefig(plt, "lab06_2.png")



