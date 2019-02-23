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
sum-up-numbers-simple(L,N):- % Case 3: end of list is reached 
    L = [A|B],  
    number(A), 
    B=[], 
    N is A.

sum-up-numbers-general([],0). % Default: list is empty
sum-up-numbers-general(L,N):-
    L=[A|B],
    \+(is_list(A)), % is A a list?
    number(A),% is A number?
    \+(B=[]),
    sum-up-numbers-general(B,N1),
    N is N1 + A.
sum-up-numbers-general(L,N):-
    L=[A|B],
    \+(is_list(A)),
    \+(number(A)),
    \+(B=[]),
    sum-up-numbers-general(B,N1),
    N is N1.
sum-up-numbers-general(L,N):-
    L=[A|B],
    is_list(A),
    sum-up-numbers-general(A,N1),
    \+(B=[]),
    sum-up-numbers-general(B,N2),
    N is N1 + N2.
sum-up-numbers-general(L,N):-
    L=[A|B],
    is_list(A),
    sum-up-numbers-general(A,N1),
    B=[],
    N is N1.
sum-up-numbers-general(L,N):-
    L=[A|B],
    \+(is_list(A)),
    number(A),
    B=[],
    N is A.
sum-up-numbers-general(L,N):-
    L=[A|B],
    \+(is_list(A)),
    \+(number(A)),
    B=[],
    N is 0.