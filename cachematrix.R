## Put comments here that give an overall description of what your
## functions do

## The purpose of these funcions is to provide an easy way to create private
## variables (not accesible from Global Env) to store a matrix and calculate
## its inverse version. When the inverse value is retrieved the function will
## use a cached result instead of re-calculating its value.

## Write a short comment describing this function

## The function makeCacheMatrix takes a matrix as argument and saves it
## in a different environment as 'x'. Also, it creates an object containing
## 4 functiones used to access or modify the original matrix and the inverse
## matrix. These functiones are used by cacheSolve to retrieve and store the
## values of the matrix.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmatrix <- function(matrix) m <<- matrix
  getmatrix <- function() m
  list(set = set, get = get,
       setmatrix = setmatrix,
       getmatrix = getmatrix)
}


## Write a short comment describing this function

## cacheSolve : 1) check if an inverse matrix exists
## 2) calculate its inverse form and 3) stores it inside of makeCacheMatrix
## using the object created by said function.
## if an inverse matrix exists, it will retrieve the value and print a cached
## version. If not, it will calculate the inverse matrix and store it 
## a private variable using makeCacheMatrix.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  m <- x$getmatrix()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setmatrix(m)
  m
  
}
