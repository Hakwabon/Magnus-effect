function dYdt = ball (t, Y)
  global g S P R rho m
  dYdt=zeros(size(Y));
  x = Y(1); y = Y(2); z = Y(3);
  vx = Y(4);vy = Y(5); vz = Y(6);
  %a = cross(Y(8),Y(7))
  
  dYdt = [vx,vy,vz,P/m*vy,-P/m*vx,-g];
endfunction
