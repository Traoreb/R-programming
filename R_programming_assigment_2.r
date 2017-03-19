## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
makeCacheMatrix <- function(B = numeric()) {      
        #create variable for storage data
        #name of this variable is A
        A <- NULL
        # data for work 
        setMatrix <- function(value) {
                B <<- value
                A<<- NULL
        }
        # returns matrix
        getMatrix <- function() {
                B
        }
        # cache the given argument 
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


cacheSolve <- function(x, ...) {
        # get value
        inverse <- x$getInverse()
        # if value exists return it
        if(!is.null(inverse)) {
                message("get data")
                return(inverse)
        }
        #calcule inverse
        mat <- x$getMatrix()
        inverse <- solve(mat)
        x$cacheInverse(inverse)
        
        # return the inverse
        inverse
}

matrixtest<-makeCacheMatrix(matrix(c(10,26,57,57,17,16,18,94,19),nrow=3,ncol=3));

summary(matrixtest)

matrixtest$getMatrix();

matrixtest$getInverse();


cacheSolve(matrixtest);

