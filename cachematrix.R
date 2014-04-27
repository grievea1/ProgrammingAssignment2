## File contains two functions that cache the inverse of a martix


## Function creates a Matrix object that can cache and retrieve its inverse

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL #create a holder for the chached
    
    #Set function for creating the chached matrix when called from the outside
    set <- function(y){
        x <<- y # input y is set to x for use throughout the makeChacheMatrix function
        i <<- NULL # i is set to NULL as above
    }
    
    #Get function for retriving the cached matrix x from an outisde call
    get <- function(){
        x  # return the value of the matrix
    }

    #Set inverse function to set a given inverse to the stored matrix
    setInverse <- function(inverse){
        i <<- inverse ## assing the given inverse to the out internal i variable
    }
    
    #Get inverse function to retrieve the stored inverse of the matrix
    getInverse <- function(){
        i # return the inverse
    }

    # Returns a list with out function calls
    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}




## Function checks to determine if a matrix has been chached and 
## takes the appropriate action of either retrieving the chahed inverse
## or calculating the inverse anew

cacheSolve <- function(x, ...) {
    i <- x$getInverse() # get the inverse of x that is stored via the makeChacheMatrixFunction
    
    # check to see if the inverse was chached
    if(!is.null(i)){    
        message("Getting cached data") # If the value is chached we will retrieve it...
        return(i) # ...and return in       
    }
  
    #If the value is not chached then we need to calculate the inverse ourselves and store it
    data <- x$get() # retrieve the value of the matrix from our function
    i <- solve(data) # this is where we actually calculate the inverse of the matrix
    x$setInverse(i) # set the inverse of the matrix into our function for use later
    i # return the inverse of the matrix
    
    #that is all  
  
}
