function A = cspace(robot,q1,q2)
A = zeros(length(q1),length(q2));
for i = 1 :length(q1)
    for j = 1 :length(q2)
      A(i,j)=apoloCheckRobotJoints(robot,[q1(i),q2(j)]) ;
      apoloUpdate;
    end
end
end