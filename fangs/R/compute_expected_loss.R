#' Estimate the expected FARO Loss for a Feature Allocation
#'
#' A Monte Carlo estimate of the expected FARO loss is computed for a feature allocation given a set of posterior samples.
#'
#' @inheritParams fangs
#' @param Z A feature allocation in binary matrix form, with items in
#'   the rows and features in the columns.
#'
#' @return The estimated expected FARO loss as a scalar value.
#'
#' @export
#'
#' @references
#' D. B. Dahl, D. J. Johnson, R. J. Andros (2023), 
#' Comparison and Bayesian Estimation of Feature Allocations,
#' Journal of Computational and Graphical Statistics,
#' \doi{10.1080/10618600.2023.2204136}.
#'
#' @examples
#' data(samplesFA)
#' Z <- matrix(sample(c(0,1), 60, replace=TRUE), byrow=TRUE, nrow=20)
#' compute_expected_loss(samplesFA, Z)
#'
compute_expected_loss <- function(samples, Z, a=1.0, nCores=0) {
  # mean(sapply(Zs, function(Z2) compute_loss(Z2,Z,a)))
  .Call(.compute_expected_loss, Z, samples, a, nCores)
}
