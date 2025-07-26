
% Read stock data from an Excel file.
% 'TSLA.xlsx' is assumed to be in the same directory.
% The code reads columns 'A2' to 'A250' and 'E2' to 'E250' for the x and y axes.
x = readtable('TSLA.xlsx', 'Range', 'A2:A250');
y = readtable('TLSA.xlsx', 'Range', 'E2:E250');

% Create a new figure to plot the data.
figure;

% Plot the closing prices over time.
plot(x{:,:}, y{:,:});

% Add labels and a title to the plot.
xlabel('Date');
ylabel('Closing Prices');
title('Plotted TSLA Stocks');

%% Section 2: Training the Prediction Network

% This section requires a pre-trained network. The code snippet in your image
% suggests using a 'ClosedLoop' network for prediction.
% This part of the code assumes you have already created and trained a
% neural network for time-series prediction. A common way to do this is
% with the Deep Learning Toolbox, for example, using a NARX network.
% For demonstration, let's assume 'net' is your trained network.

% Create a closed-loop version of the network for multi-step prediction.
% The 'netc' variable represents the closed-loop network.
netc = closeloop(net);
netc.name = [net.name ' - Closed Loop'];
view(netc);

% Prepare data for the closed-loop network.
% 'ts' and 'ys' would be your time-series input and target data.
% For this example, let's assume 'ts' and 'ys' are derived from your stock data.
[xc,xi,ai,ts] = preparets(net,ts,{},ys);

% Perform the prediction using the closed-loop network.
closedLoopPerformance = perform(net,tc,yc);

% If you want a step-ahead prediction network without the closed-loop,
% the following code would be used.
% This network returns the prediction for y(t+1) given y(t).
% It's useful for some applications, but may need further setup.
% This network is created by removing one delay.
nets = removeloop(net);
nets.name = [net.name ' - Predict One Step Ahead'];
view(nets);

% Prepare data for the step-ahead network.
[xs,xis,ais,ts] = preparets(nets,ts,{},ys);
ys = nets(xs,xis,ais);
stepAheadPerformance = perform(nets,ts,ys);

%% Section 3: Plotting the Prediction Results

% Create a new figure to plot the prediction points.
figure;


% We use plot(cell2mat(t), 'o-') as a generic way to plot the data points.
% 't' and 'y' would be the actual data from the evaluation.
plot(cell2mat(t), 'o-', 'DisplayName', 'Actual');

hold on;


% 'y' here would be the predicted data from the network.
plot(cell2mat(y), 'o--', 'DisplayName', 'Predicted');

% Add a title and labels to the plot.
title('Actual vs. Predicted');
xlabel('Time(days)');
ylabel('Closing Prices');

% Add a legend to distinguish the 'Actual' and 'Predicted' lines.
legend('Actual', 'Predicted');

% Release the hold on the plot so future plots don't overwrite it.
hold off;

% You may need to adjust the variables t, y, ts, ys, and the Excel file range
% to match your specific data and network setup. Also it runs kinda slow.