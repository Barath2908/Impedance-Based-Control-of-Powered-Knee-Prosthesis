if ~exist('simlog_sh_cyl_single_acting', 'var')
    sim('sh_cyl_single_acting')
end

% Reuse figure if it exists, else create new figure
if ~exist('h1_sh_cyl_single_acting', 'var') || ...
        ~isgraphics(h1_sh_cyl_single_acting, 'figure')
    h1_sh_cyl_single_acting = figure('Name', 'sh_cyl_single_acting');
end
figure(h1_sh_cyl_single_acting)
clf(h1_sh_cyl_single_acting)

% Get simulation results
simlog_t = simlog_sh_cyl_single_acting.Valve_Actuator.P.series.time;
simlog_valveP = simlog_sh_cyl_single_acting.Valve_Actuator.P.series.values('m');
simlog_cylP = simlog_sh_cyl_single_acting.Cylinder.P.series.values('m');

% Plot results
simlog_handles(1) = subplot(2, 1, 1);
plot(simlog_t, simlog_cylP, 'LineWidth', 1)
grid on
title('Piston Position')
ylabel('Position (m)')
simlog_handles(2) = subplot(2, 1, 2);
plot(simlog_t, simlog_valveP, 'LineWidth', 1)
grid on
title('Valve Position')
ylabel('Position (m)')
xlabel('Time (s)')

linkaxes(simlog_handles, 'x')

% Save results to Excel file
excel_file = 'simulation_results.xlsx';
xlswrite(excel_file, [{'Time (s)', 'Piston Position (m)', 'Valve Position (m)'}; num2cell([simlog_t, simlog_cylP, simlog_valveP])]);

% Remove temporary variables
clear simlog_valveP simlog_cylP simlog_handles