# See README.md for instructions on running the code and output from it
# The assignment states that running the code is not part of the grading 
# but I have the instructions anyway.


# makeCacheMatrix is a function that returns a list of functions
# Its puspose is to store a martix and a cached value of the inverse of the 
# matrix. Contains the following functions:
# * setMatrix      set the value of a matrix
# * getMatrix      get the value of a matrix
# * cacheInverse   get the cahced value (inverse of the matrix)
# * getInverse     get the cahced value (inverse of the matrix)
#
# Notes:
# not sure how the "x = numeric()" part works in the argument list of the 
# function, but it seems to be creating a variable "x" that is not reachable 
# from the global environment, but is available in the environment of the 
# makeCacheMatrix function


makeCacheMatrix <- function(B = numeric()) {      

        # holds the cached value or NULL if nothing is cached
        # initially nothing is cached so set it to NULL
        A <- NULL
        setMatrix <- function(value) {
                B <<- value
                # since the matrix is assigned a value, flush the cache
                A<<- NULL
        }
        # returns the stored matrix
        getMatrix <- function() {
                B
        }
        # cacheInverse the given argument 
        cacheInverse <- function(solve) {
                A <<- solve
        }
        # get the cached value
        getInverse <- function() {
                A
        }      
        # return a list. Each named element of the list is a function
        list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}

# The following function calculates the inverse of a "special" matrix created with 
# makeCacheMatrix
cacheSolve <- function(x, ...) {
        # get value
        inverse <- x$getInverse()
        # if value exists return it
        if(!is.null(inverse)) {
                message("get data")
                return(inverse)
        }
        # otherwise get the matrix, caclulate the inverse and store it in
        # the cache
        mat <- x$getMatrix()
        inverse <- solve(mat)
        x$cacheInverse(inverse)
        
        # return the inverse
        inverse
}

#test function makeCacheMatrix

matrixtest<-makeCacheMatrix(matrix(c(10,26,57,57,17,16,18,94,19),nrow=3,ncol=3));

#summary ginve contenant of variable 
summary(matrixtest)
###             Length Class  Mode    
###setMatrix    1      -none- function
###getMatrix    1      -none- function
###cacheInverse 1      -none- function
###getInverse   1      -none- function

#Test argument of variable for example getMatix()
matrixtest$getMatrix();

###10	57	18
###26	17	94
###57	16	19


#Test argument of variable for example getInverse()
matrixtest$getInverse();

###-0.004622599	-0.003111741	0.019774232
###0.019038374	-0.003272221	-0.001847474
###-0.002164519	0.012090777	-0.005135351

#Test function cacheSolve on variable matrixtest
cacheSolve(matrixtest);

###-0.004622599	-0.003111741	0.019774232
###0.019038374	-0.003272221	-0.001847474
###-0.002164519	0.012090777	-0.005135351

str(str)

