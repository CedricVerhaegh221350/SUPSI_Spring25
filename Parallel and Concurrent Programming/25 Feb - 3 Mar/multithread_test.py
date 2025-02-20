import sys, time, multiprocessing
from threading import Thread


print( f"nogil={getattr(sys.flags, 'nogil', False)}" )

def fib( n : int ) -> int:
    """
    Computes the Fibonacci function for the given value
    
    Args:
        n (int): the value to compute

    Returns:
        int: The value of the Fibonacci function
    """
    if n < 2: return 1
    return fib(n-1) + fib(n-2)

def print_fib( t : int, n : int ) -> None:
    """
    Computes the Fibonacci function and prints the result.
    
    Args:
        t (int): the thread index
        n (int): the input for the Fibonacci function
    """
    start = time.time()
    value = fib( n )
    end   = time.time()
    duration = round( end - start, 2)
    
    print( f"Thread[{t}] => fib({n}) = {value} (took {duration} seconds)" )
    
    
##################
#  *** main ***  #
#################

cores = multiprocessing.cpu_count()
if len(sys.argv) > 1:
    cores = int(sys.argv[1])

start = time.time()
threads = []
for ix in range(cores):
    t = Thread( target=print_fib, args=(ix,30) )
    t.start()
    threads.append(t)
    
for t in threads:
    t.join()

end = time.time()
duration = round( end - start, 2 )
print( f"--- The overall time is {duration} seconds ---" )