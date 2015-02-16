## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) { #sets x to an empty matrix
        inv<-NULL #sets the inverse equal to NULL
        
        set<-function(y){
                x<<-y 
                #sets function assigning the argument to x
                
                inv<<-NULL 
                #once the function is called, inverse will be resetted to NULL
        }
        
        get<-function()x 
        #getting function to return the matrix
        
        setmatrix<-function(solve) inv<<-solve 
        #setmatrix overrides the previous value of inv and assigns the argument to inverse
        
        getmatrix <- function() inv 
        #getmatrix returns the inverse
        
        list(set=set, get=get, setmatrix=setmatrix, getmatrix=getmatrix) 
        #create a list of functions present

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        inv<-x$getmatrix() 
        # retrieve the most recent value for the inverse 
        
        if(!is.null(inv)){
                message("getting cached data")
                return (inv)
                #if the value of inverse does not equal NULL. cachesolve will return the value
        }
        #if the value of the inverse is NULL, then the matrix x will be retrieved and inverse calculated with solve() function
        
        matrix<-x$get()
        inv<-solve(matrix, ...)
        x&setmatrix(inv) 
        #setting inverse to new value
        
        inv 
        ## Return a matrix that is the inverse of 'x'
}
