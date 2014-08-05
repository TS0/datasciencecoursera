## A pair of functions that cache the inverse of a matrix

makeCacheMatrix <- function( m = matrix() ) {
  # creates matrix that can cache its invesers
  i <- NULL
  

  set <- function( matrix ) {
    m <<- matrix
    i <<- NULL
  }
  # setting matrix
  get <- function() {
    #get matrix
    m
    #return it
  }
  
  ## Method to set the inverse of the matrix
  setInverse <- function(inverse) {
    i <<- inverse
  }
  
  ## Method to get the inverse of the matrix
  getInverse <- function() {
    ## Return the inverse property
    i
  }
  
  ## Return a list of the methods
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

## this is a function that gets the solved inverse from the cache and displays it

cacheSolve <- function(x, ...) { 
  m <- x$getInverse()
  # return matrix that is inverse of m
  if( !is.null(m) ) {
    return(m)
  }
  # return inverse if data already there
  data <- x$get()
  #get matrix from object
  m <- solve(data) %*% data
 # calculate inverse
  x$setInverse(m)
  # assign inverse to object
 # show the matrix
  m
}
