function X_norm = unseenNormalize(X, mu, sigma)
X_norm = (X - mu) ./ sigma;
endfunction
