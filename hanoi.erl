-module(hanoi).
-compile(export_all).

create_towers(DiscNum) ->
	TwList = {1, lists:seq(1, DiscNum)},{2, []}, {3, []}, TwList,
	display_towers(TwList).
	%move(DiscNum,TwList,1,3).

display_towers(Towers) ->
	io:format("___________________________________________~n"),
		io:format(" Tower:~p~n Tower:~p~n Tower:~p~n",Towers),
	io:format("___________________________________________~n").

%	move(1,TwList, From, To) ->
%	[H|NewSource] = maps:get(From,TowList),
%	NewDest = [H|maps:get(To,TowList)],
%	NewTowList = maps:update(From,NewSource, maps:update(To,NewDest,Game)),
%	display_towers(NewTowList), NewTowList;

%	move(DiscNum, TwList, From, To) ->
%	Other = other(From,To),
%   Game1 = move(N-1,Game,From,Other,Size),
%	Game2 = move(1,Game1,From,To,Size),
%   move(N-1,Game2,Other,To,Size).

