clc
clear all



   

%
Landmarks.x = [0 0 1 1];
Landmarks.y = [0 1 1 0];

%Incertidumbre 

%Pk_1 = [Qd 0; 0 Qb];

Qd = 0.001;
Qb = 0.002;

Qk_1 = diag([Qd,Qb]);

% para bucle iterativo
Xk_1 = Xk;
Pk_1 = Pk;

Xk_1 = [0.5 0.5 -pi]';
% medida Balizas
L_id = [2 3];
L_dist = [0.7071 0.7071];
L_angles = [pi/4 pi/4];

% medida Odometria

Uk = [0 0];

X_k = [(Xk_1(1) + Uk(1)*cos(Xk_1(3)+(Uk(2)/2)));
       (Xk_1(2) + Uk(1)*sin(Xk_1(3)+(Uk(2)/2)));
       (Xk_1(3) + Uk(2))];
  
Ak = [1 0 (-Uk(1)*sin(Xk_1(3)+Uk(2)/2));
      0 1 (Uk(1)*cos(Xk_1(3)+Uk(2)/2));
      0 0 1                             ];
Bk = [(cos(Xk_1(3)+Uk(2)/2)) (-0.5*Uk(1)*sin(Xk_1(3)+Uk(2)/2));
      (sin(Xk_1(3)+Uk(2)/2)) (0.5*Uk(1)*cos(Xk_1(3)+Uk(2)/2));
       0                     1                                 ];
P_k = Ak*Pk_1*((Ak)') + Bk*Qk_1*((Bk)');
       
% Prediccion de la medida
%calculate Z_k
Z_k = (1:2*length(L_id))';

for n_landmarks = 1:length(L_id)
    id = L_id(n_landmarks); 
    Z_k(2*(n_landmarks)-1) =  sqrt((Landmarks.x(id)-X_k(1))^2 + (Landmarks.y(id) - X_k(2))^2 );
    aux = atan2(Landmarks.y(id) - X_k(2),Landmarks.x(id) - X_k(1)) - X_k(3);
    if aux > pi
    aux = (aux - 2*pi);
    end    
    Z_k(2*(n_landmarks)) = aux; 
end









