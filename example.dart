//Gets the nth fibonacci number
int fib(n){
    if(n<=1) return n;
    else return fib(n-1)+fib(n-2);
}

//Calculates a factorial
int fact(n){
    if(n==0) return 1;
    return n*fact(n-1);
}