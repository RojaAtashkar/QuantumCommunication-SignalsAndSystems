function [A_positive] = PositiveMatrix(A)
  % Find all eigenvalues and eigenvectors
  [V, D] = eig(A);

  % Find indices of positive eigenvalues
  positive_idx = D > 0;

  % Extract positive eigenvalues and corresponding eigenvectors
  positive_eigenvalues = diag(D(positive_idx, positive_idx));
  positive_eigenvectors = V(:, positive_idx);
  A_positive = positive_eigenvectors * positive_eigenvalues * positive_eigenvectors.';
end