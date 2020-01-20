function laserVariance = calibrateLaserMeasures(n_iters)
apoloUpdate()
ret = apoloGetLaserLandMarks('LMS100','World 1');
laserMeasures.distance = zeros([length(ret.distance),n_iters]);
laserMeasures.angle = zeros([length(ret.angle),n_iters]);
laserVariance_distance = zeros([length(ret.distance)]);
laserVariance_angle= zeros([length(ret.angle)]);

for i= 1:n_iters
    apoloUpdate()
    ret = apoloGetLaserLandMarks('LMS100','World 1');
    for j = 1:length(ret.distance)
        laserMeasures.distance(i,j) = ret.distance(:,j);
        laserMeasures.angle(i,j) = ret.angle(:,j);
    end
    
end
for j = 1:length(ret.distance)
    laserVariance_distance(j) = var(laserMeasures.distance(:,j));
    laserVariance_angle(j) = var(laserMeasures.angle(:,j));
end

dist_mean = mean(laserVariance_distance);
angle_mean= mean(laserVariance_angle);

laserVariance.dist= dist_mean(1);
laserVariance.angle =angle_mean(1);

end