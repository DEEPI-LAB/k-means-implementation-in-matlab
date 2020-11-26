% *********************************************
% Unsupervised Learning 
% K-Means algorithm
% Deep.I Inc.
% https://deep-eye.tistory.com/24
% deepi.contact.us@gmail.com
% *********************************************

load sample_data_set_1.mat

% Number of Clusters
k = 2;                       
% Centroid Initialization
rand = randperm(length(X),k);
u = X(rand ,:);
% Number of iterations
z = 10;

for z=1:10
    % Create Cluster Set
    C = cell(k,1);
    for j=1:length(X)
        % Distance
        for i =1:k
            dist(i,1) = norm(X(j,:)-u(i,:));
        end
        % Assign each observation to the cluster with the nearest mean
        arg = find(dist==min(dist));
        C{arg}(end+1,:) = X(j,:);
    end
    
   % Update
    for i = 1:k
        cluster = C{i};
        cluster = sum(cluster) ./ sum(cluster~=0,1);
        try
            u(i,:) = cluster;
        end
    end
    
    % plot
    cla; hold on;
    for i = 1: k
        cluster = C{i};
        try
            scatter(cluster(:,1),cluster(:,2))
            scatter(u(:,1),u(:,2),'*r','LineWidth',5)
        end
    end
    pause(0.5)  
end


