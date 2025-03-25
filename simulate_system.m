function simulate_system()
    % 시스템 파라미터
    m = 1;      % 질량 (kg)
    k = 10;     % 스프링 상수 (N/m)
    c = 0.5;    % 감쇠 계수 (Ns/m)

    % 초기 조건
    x0 = [10; 0]; % 초기 변위 1m, 초기 속도 0m/s

    % 시간 설정
    tspan = [0 10];

    % ODE 솔버 실행
    [t, x] = ode45(@(t, x) mass_spring_damper(t, x, m, k, c), tspan, x0);

    % 결과 플로팅
    figure;
    plot(t, x(:, 1), 'b', 'LineWidth', 2);
    xlabel('Time (s)');
    ylabel('Displacement (m)');
    title('Mass-Spring-Damper System');
    grid on;
end

function dxdt = mass_spring_damper(~, x, m, k, c)
    % 상태 공간 표현
    dxdt = [x(2); (-k*x(1) - c*x(2)) / m];
end
