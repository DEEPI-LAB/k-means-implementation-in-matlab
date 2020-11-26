% *********************************************
% Unsupervised Learning - K-Means algorithm
% Deep.I Inc.
% deepi.contact.us@gmail.com
% *********************************************

% load sample_data_set_1.mat

% 클러스터 개수
k = 2;                       
% 클러스터 위치 초기화 인덱스 선정
rand = randperm(length(X),k);
% 초기 Centroid 값
u = X(rand ,:);
% 학습 횟수
z = 10;

% 학습 시작
for z=1:10
    % 최대값 저장메모리 할당
    C = cell(k,1);
    for j=1:length(X)
        % 거리 구하기
        for i =1:k
            dist(i,1) = norm(X(j,:)-u(i,:));
        end
        % 중심점과 가장 유사도가 높은 데이터를 중심점 클러스터로 할당
        arg = find(dist==min(dist));
        C{arg}(end+1,:) = X(j,:);
    end
    
   % 업데이트
    for i = 1:k
        cluster = C{i};
        cluster = sum(cluster) ./ sum(cluster~=0,1);
        try
            u(i,:) = cluster;
        end
    end
    
    % 군집 확인
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

