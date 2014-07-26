# makeCacheMatrix creates a list containing a function to
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of inverse of the matrix
# 4. get the value of inverse of the matrix


makeCacheMatrix <- function(x = matrix()) {

inv <- NULL
    set <- function(y) {
# x and inv variables outside this environment gets changed        
        x <<- y
        
        inv <<- NULL
    }
    # Just returns the matrix entered
    get <- function() x
    
    # This function updates the inv variable 
    setinverse <- function(inverse) inv <<- inverse
    
    # returns the inverse of a matrix
    getinverse <- function() inv
    
  # This is the list of all the functions needed. 
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


# This function assumes that the matrix is always invertible.

# It is inside this function all the functions mentioned in the list are called.


cacheSolve <- function(x, ...) {
# Calling getinverse() to see if the cache already exists    
inv <- x$getinverse()
    if(!is.null(inv)) {
        message("getting cached data.")
        

        ## Return a matrix that is the inverse of 'x'
        return(inv)    
}
