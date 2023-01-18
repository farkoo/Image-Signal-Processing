function out=dot_diffusion(f)
    [M, N] = size(f);
    if max(max(f)) > 1
       f = f/max(max(f)); 
    end
    CM = [59 12 46 60 28 14 32 3;
        21 25 44 11 58 45 43 30;
        24 20 13 42 33 5 54 8;
        64 52 55 40 63 47 7 18;
        35 57 9 15 50 48 4 36;
        41 17 6 61 22 49 62 34;
        2 53 19 56 39 23 26 51;
        16 37 1 31 29 27 38 10];
    S=8; 
    nn=64;
    DM=[1 2 1;
        2 0 2;
        1 2 1;];        
   CM = repmat(CM,floor(M/S),floor(N/S));
   [P, Q] = size(CM);
   CM = padarray(CM, [round((M-P)/2) round((N-Q)/2)] ,'both');
   H=zeros(M, N);            
  for ii=1:nn
      [p1,p2]=(find(CM==ii));
      i1=1;
      j1=1;
      for m1=1:1:size(p1,1)
            while(i1<=size(p1,1))
                  if(f(p1(i1),p2(j1))>0.5)
                      H(p1(i1),p2(j1))=1;
                  end
                  qerr=f(p1(i1),p2(j1))-H(p1(i1),p2(j1))    ;
                  cl=CM((p1(i1)-1):(p1(i1)+1),(p2(j1)-1):(p2(j1)+1));
                  k=cl>ii;
                  DM1=(DM.*k);
                  DM1=DM1/sum(DM1(:));
                  err=DM1*qerr;
                  f((p1(i1)-1):(p1(i1)+1),(p2(j1)-1):(p2(j1)+1))= f((p1(i1)-1):(p1(i1)+1),(p2(j1)-1):(p2(j1)+1))+err;
                  i1=i1+1;
                  j1=j1+1;
            end     
      end  
  end
  out=H;
end
      