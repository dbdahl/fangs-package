% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/compute_expected_loss.R
\name{compute_expected_loss}
\alias{compute_expected_loss}
\title{Estimate the expected FARO Loss for a Feature Allocation}
\usage{
compute_expected_loss(samples, Z, a = 1, nCores = 0)
}
\arguments{
\item{samples}{An object of class \sQuote{list} containing posterior samples
from a feature allocation distribution. Each list element encodes one
feature allocation as a binary matrix, with items in the rows and features
in the columns.}

\item{Z}{A feature allocation in binary matrix form, with items in
the rows and features in the columns.}

\item{a}{A numeric scalar for the cost parameter of generalized Hamming
distance used in FARO loss.  The other cost parameter, \eqn{b}, is equal to
\eqn{2 - a}.}

\item{nCores}{The number of CPU cores to use, i.e., the number of
simultaneous calculations at any given time. A value of zero indicates to
use all cores on the system.}
}
\value{
The estimated expected FARO loss as a scalar value.
}
\description{
A Monte Carlo estimate of the expected FARO loss is computed for a feature allocation given a set of posterior samples.
}
\examples{
data(samplesFA)
Z <- matrix(sample(c(0,1), 60, replace=TRUE), byrow=TRUE, nrow=20)
compute_expected_loss(samplesFA, Z)

}
\references{
D. B. Dahl, D. J. Johnson, R. J. Andros (2023),
Comparison and Bayesian Estimation of Feature Allocations,
Journal of Computational and Graphical Statistics,
\doi{10.1080/10618600.2023.2204136}.
}
