## The following two functuons are to cache the inverse of a matrix

##makeCacheMatrix is to create  a special matrix, which is really a list containing a function to
## 1.set the value of the matrix
## 2.get the value of the matrix
## 3.set the value of the inverse
## 4.get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  m<- NULL
  set<-function(y){
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setInverse<- function(solve) m <<- solve
  getInverse <- function() m
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)

}


## cacheSolve  calculates the inverse of the  special matrix created with the above function. 
## if the inverse has already been calculated, it gets the inverse from the cache and skips the computation.
## Otherwise, it calculates the inverse of the data and sets the value of the inverse in the cache via the setInverse function.

cacheSolve <- function(x, ...){
  m <- x$getInverse()
if(!is.null(m)) {
  message("getting cached data")
  return(m)
}
data <- x$get()
m <- solve(data, ...)
x$setInverse(m)
m   ## Return a matrix that is the inverse of 'x'
}
      

