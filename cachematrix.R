## Put comments here that give an overall description of what your
## functions do

# provides a list of fucntions to: set a defined matrix, get/print the defined matrix, 
## setsolve to define the of the solve function, getsolve to print the result of the solved matrix


makeCacheMatrix <- function(x = matrix()) {
    solv <- NULL
    set <- function(y) {
        x <<- y
        solv <<- NULL
    }
    get <- function() x
    setSolve <- function(Solve) solv <<- Solve
    getSolve <- function() solv
    list(set = set, get = get,
         setSolve = setSolve,
         getSolve = getSolve)
}


# recalls the result of the solve function from the memory if it has already been
## calculated (or set by use of the makeCacheMatrix function), 
### otherwise it executes the solve function 


cacheSolve <- function(x, ...) {
    solv <- x$getSolve()
    if(!is.null(solv)) {
        message("getting cached data")
        return(solv)
    }
    data <- x$get()
    solv <- solve(data, ...)
    x$setSolve(solv)
    solv
}