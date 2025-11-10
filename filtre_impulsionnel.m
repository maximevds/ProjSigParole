function h = filtre_impulsionnel(k0)
    h = zeros(1, k0+1);
    h(1) = 1;
    h(k0+1) = 1;
end