setwd('C:/Users/farzadips/Desktop/R')

## set the solved value "s" as a nil

makeCacheMatrix <- function(x = matrix()) {
  j <- NULL
  set <- function(y){
  x <<- y
  j <<- NULL
  }
  get <- function()x
  setInverse <- function(inverse) j <<- inverse
  getInverse <- function() j 
  ## then trying to store in the cache by using model
  list(set = set, get = get, 
  setInverse = setInverse, 
  getInverse = getInverse)
}

## Same here, changed "mean" and  "m"  to "solve" and"s"


cacheSolve <- function(x, ...) {
   ##first tries to see whether this data is available in cashe or not
  j <- x$getInverse()
  if(!is.null(j)){
  message("getting cached data")
  return(j)
  }
  ##if not do the calculation (find inverse)
  mat <- x$get()
  j <- solve(mat,...)
  x$setInverse(j)
  j
}
