



# following two functions are used to cache the inverse of a matrix.

# makeCacheMatrix creates a list containing a function to
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of inverse of the matrix
# 4. get the value of inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
                    inv <- NULL
                     set <- function(y) {
                            x <<- y
                           inv <<- NULL
                      }
                get <- function() x
                setinverse <- function(inverse) inv <<- inverse
                getinverse <- function() inv
      list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}

## this function to obtain the inverse of the matrix
## In the first run it checks if inverse was calculated before. if yes, it finds the result.
## if not then it calculates.

cacheSolve <- function(x, ...) {
    inv <- x$getinverse()
    if(!is.null(inv)) {
                      message("getting Data from the cache memory")
    return(inv)
    }
  data <- x$get()
  inv <- solve(data)
  x$setinverse(inv)
  message("No Data in Cache. Calculating inverse")
  inv
}


## Sample run:
  my_matrix<- matrix(1:4, nrow = 2, ncol = 2)
  cached_matrix = makeCacheMatrix(my_matrix)
  cached_matrix$get()
  
##  cacheSolve(cached_matrix)

## First Run
##  > cacheSolve(cached_matrix)  
## No Data in Cache. Calculating inverse
##        [,1] [,2]
##  [1,]   -2  1.5
##  [2,]    1 -0.5


## Second Run
## >cacheSolve(cached_matrix)  
## getting Data from the cache memory
##        [,1] [,2]
##  [1,]   -2  1.5
##  [2,]    1 -0.5





  
  
