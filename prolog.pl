sum-up-numbers-simple([],0). % Case 0: sum is 0 when list is empty.
sum-up-numbers-simple(L,N):- % Case 1: first element is a number.
    L = [A|B], % check if first element in list is a number.
    number(A), 
    \+ (B=[]), % check if rest of list is not empty.
    sum-up-numbers-simple(B,N1), % compute sum of the rest of the list.
    N is A + N1. % sum is first element plus the sum of the remainder of the list.
sum-up-numbers-simple(L,N):- % Case 2: first element is not a number.
    L = [A|B],
    \+ (number(A)),
    sum-up-numbers-simple(B,N). % result is sum of the remainder of the list.