-module (toh).

-export([start/1]).


start(N) ->
    Game = #{1 => lists:seq(1,N), 2 => [], 3 => []},
    display(Game,N),
    move(N,Game,1,3,N).

move(1,Game,From,To,Size) ->
    [H|NewFrom] = maps:get(From,Game),
    NewTo = [H|maps:get(To,Game)],
    NewGame = maps:update(From,NewFrom,maps:update(To,NewTo,Game)),
    display(NewGame,Size),
    NewGame;
move(N,Game,From,To,Size) ->
    Other = other(From,To),
    Game1 = move(N-1,Game,From,Other,Size),
    Game2 = move(1,Game1,From,To,Size),
    move(N-1,Game2,Other,To,Size).

display(#{1 := A, 2 := B, 3 := C},D) ->
    lists:foreach(fun(X) -> print(X,D) end,lists:zip3(complete(A,D),complete(B,D),complete(C,D))),
    io:format("~n~s~n~n",[lists:duplicate(6*D+5,$-)]).

complete(L,D) -> lists:duplicate(D-length(L),0) ++ L.

print({A,B,C},D) -> io:format("~s ~s ~s~n",[elem(A,D),elem(B,D),elem(C,D)]).

elem(I,D) -> lists:duplicate(D-I,$ ) ++ lists:duplicate(I,$_) ++ "|" ++ lists:duplicate(I,$_) ++ lists:duplicate(D-I,$ ).

other(I,J) -> 6-I-J.