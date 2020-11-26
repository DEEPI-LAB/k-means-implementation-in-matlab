% *********************************************
% Unsupervised Learning - K-Means algorithm
% Deep.I Inc.
% deepi.contact.us@gmail.com
% *********************************************

% load sample_data_set_1.mat

% Ŭ������ ����
k = 2;                       
% Ŭ������ ��ġ �ʱ�ȭ �ε��� ����
rand = randperm(length(X),k);
% �ʱ� Centroid ��
u = X(rand ,:);
% �н� Ƚ��
z = 10;

% �н� ����
for z=1:10
    % �ִ밪 ����޸� �Ҵ�
    C = cell(k,1);
    for j=1:length(X)
        % �Ÿ� ���ϱ�
        for i =1:k
            dist(i,1) = norm(X(j,:)-u(i,:));
        end
        % �߽����� ���� ���絵�� ���� �����͸� �߽��� Ŭ�����ͷ� �Ҵ�
        arg = find(dist==min(dist));
        C{arg}(end+1,:) = X(j,:);
    end
    
   % ������Ʈ
    for i = 1:k
        cluster = C{i};
        cluster = sum(cluster) ./ sum(cluster~=0,1);
        try
            u(i,:) = cluster;
        end
    end
    
    % ���� Ȯ��
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

