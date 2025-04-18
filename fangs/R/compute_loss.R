#' Compute the FARO Loss Between Feature Allocations
#'
#' The FARO loss is computed between two feature allocations, each represented
#' in binary matrix form.
#'
#' @inheritParams fangs
#' @param Z1 A feature allocation in binary matrix form, with items in the rows
#'   and features in the columns.
#' @param Z2 A feature allocation in binary matrix form, with items in the rows
#'   and features in the columns.
#' @param augmented If \code{TRUE}, the column permutation (used by FARO loss to
#'   compare the feature allocations) is returned for each matrix.
#'
#' @return The FARO loss as a scalar value if `augmented = FALSE`, otherwise, a list
#'   of 3 elements including the loss and the two column permutations.
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
#' Z1 <- matrix(c(0,1,1,0,1,1,0,1,1,1,1,1), byrow=TRUE, nrow=6)
#' Z2 <- matrix(c(0,0,1,0,0,0,0,0,0,0,0,0,1,1,1,0,1,0), byrow=TRUE, nrow=6)
#' compute_loss(Z1,Z2)
#' x <- compute_loss(Z1,Z2,a=1,TRUE)
#' sum(cbind(Z1,0) != Z2)
#' sum(cbind(Z1,0)[,x$permutation1] != Z2)
#' sum(cbind(Z1,0) != Z2[,x$permutation2])
#'
compute_loss <- function(Z1, Z2, a=1.0, augmented=FALSE) {
  if ( ! is.numeric(Z1) ) stop("'Z1' should be numeric.")
  if ( ! is.numeric(Z2) ) stop("'Z2' should be numeric.")
  if ( ! is.matrix(Z1) ) stop("'Z1' should be a matrix.")
  if ( ! is.matrix(Z2) ) stop("'Z2' should be a matrix.")
  if ( nrow(Z1) != nrow(Z2) ) stop("'Z1' and 'Z2' must have the same number of rows.")
  if ( isTRUE(augmented) ) {
    .Call(.compute_loss_augmented,Z1,Z2,a)
  } else {
    .Call(.compute_loss,Z1,Z2,a)
  }
}

compute_loss_permutations <- function(Z1, Z2, a=1.0) {
  if ( ! is.numeric(Z1) ) stop("'Z1' should be numeric.")
  if ( ! is.numeric(Z2) ) stop("'Z2' should be numeric.")
  if ( ! is.matrix(Z1) ) stop("'Z1' should be a matrix.")
  if ( ! is.matrix(Z2) ) stop("'Z2' should be a matrix.")
  if ( nrow(Z1) != nrow(Z2) ) stop("'Z1' and 'Z2' must have the same number of rows.")
  .Call(.compute_loss_permutations,Z1,Z2,a)
}
