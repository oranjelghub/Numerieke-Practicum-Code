function [val] = mijnkwadratuurregel(f)
    m = (length(f)-1)/2;
    h = 1/(2*m);
    val = (h/3)*(f(1)+f(end));

    for i = 1:length(f)-2
        val = val + ((4*h)/3)*f(i+1);
    end

    for i = 2:length(f)-3
        val = val + ((2*h)/3)*f(i+1);
    end
end

