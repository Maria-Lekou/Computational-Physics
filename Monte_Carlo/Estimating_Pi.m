close all; clear all; clc

%Αρχικός αριθμός των τυχαίων σημείων
Npoints=10000;
%Δημιουργία τυχαίων συντεταγμένων με |x|,|y|,|z|<=1
X=-1+2*rand(1,Npoints);
Y=-1+2*rand(1,Npoints);
Z=-1+2*rand(1,Npoints);

%3D αναπαράσταση σημείων όπου φαίνεται και ο μοναδιαίος κύκλος 
scatter3(X,Y,Z);
hold on;
xlabel("x")
ylabel("y")
zlabel("z")
[x,y,z]=sphere;
Sphere3D=surf(x,y,z);
hold off;


%Η while αυτή θα τρέχει μέχρι να πετύχουμε ακρίβεια 4 δεκαδικών ψηφείων (μέσω της if ... break;).
%Ο υπολογιστής όμως συνήθως δεν μπορεί να φτάσει αυτή την ακρίβεια
%γιατι το Npoints γίνεται πολύ μεγάλο και δεν μπορεί λόγω μνήμης 
%να φτιάξει τόσο μεγάλο πίνακα (για τα Χ,Y,Z) και σταματάει 
%Οπότε η ακρίβεια που φτάνει είναιμερικές φορές στα 3 και μερικές
%στα 4 δεκαδικά και για κάθε επανάληψη υπολογίζεται ο χρόνος που χρειάζεται

%Όταν υπολογίζει με ακρίβεια 4 δεκαδικών συνήθως χρειάζεται 30-40s

while(1)
    tic;
    X=-1+2*rand(1,Npoints);
    Y=-1+2*rand(1,Npoints);
    Z=-1+2*rand(1,Npoints);
    num=zeros(Npoints,1);
    R=X.^2+Y.^2+Z.^2;
    
    for i=1:Npoints
        if R(i)<=1
            num(i)=1;
        end
    end
    
    %Υπολογισμός του π και του σφάλματος από τα παραπάνω δεδομένα 
    format long %για να δείξει περισσότερα δεκαδικά
    myPI=6*sum(num)/Npoints
    error=6*std(num)/sqrt(Npoints)
    fprintf('Η ακριβής τιμή του π αναμένεται στην περιοχή (%f,%f)\n',myPI-error,myPI+error);
    accuracy=abs(pi-myPI) %pi είναι η πραγματική τιμή του π
    toc;
    t=toc;
    fprintf('Για ακρίβεια %f χρειαζόμαστε %f δευτερόλεπτα',accuracy,t);
    if(abs(accuracy)<0.0001)
        break;
    end
    %Αυξάνουμε τα σημεία για καλύτερη ακρίβεια
    Npoints=Npoints*10;
end