% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/diff.r
\name{diffj}
\alias{diffj}
\title{Multiple JSON Objects Diff}
\usage{
diffj(json_new, json_old, sep = "@", primary)
}
\arguments{
\item{json_new}{\code{list}. The new JSON objects.}

\item{json_old}{\code{list}. The old JSON objects.}

\item{sep}{\code{character}. A character/string used to separate keys in the nesting path.
Defaults to @ to avoid the occasional overriding. Not recommended to use some risky characters like . and \.
When \code{compact = FALSE}, it is unnecessary to assign \code{sep} explicitly, unless @ has been used in the keys.}

\item{primary}{\code{character}. The primary path(keys) for identifying a unique JSON object.
The value provided should contain the \code{sep} value to specify the nesting information unless it is an outermost key.}
}
\value{
\code{list}. Contains the difference result, including path create, path delete and value change results.
}
\description{
Find the difference between multiple JSON objects yielded by create, delete and update operations.
}
\details{
This function finds out the difference between two JSON lists.
And the difference is as follows:
\itemize{
\item{\code{create}, stores the flattened result of objects only in the \code{json_new}, that is some JSON objects have been created.}
\item{\code{delete}, stores the flattened result of objects only in the \code{json_old}, that is some JSON objects have been deleted.}
\item{\code{change}, stores the value update information in the common objects, reflected by '+(add)', and '-(remove)' in the \code{chng_type} field. }}
The \code{change_summary} provides the general information of value change.
}
\examples{

library(mojson)
j1 <- list(list(x = 1, y = 2, b = list(m = 1, n = 1)),
          list(x = 2, y = 2, b = list(m = 1, n = 1)))
j2 <- list(list(x = 2, y = 3, b = list(m = 1)),
          list(x = 3, y = 2, b = list(m = 1, n = 1)))
diffj(j1, j2, primary = 'x')
}
