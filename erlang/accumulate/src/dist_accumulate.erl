-module(dist_accumulate).

-export([accumulate/2]).

accumulate(Fn, Ls) ->
    Procs = lists:map(fun(L) -> init(Fn,L) end, Ls),
    Answers = receive_all(length(Ls), dict:new()),
    io:fwrite("Answers: ~p ~n", [dict:fetch_keys(Answers)]),
    lists:foldr(fun (K, A) -> result_fallback(Answers, K, A) end, [], Procs).

result_fallback(Answers, Key, A) ->
    {key, K, L} = Key,
    case dict:find(K, Answers) of
        {ok, V} -> [{some, hd(V)} | A];
        error -> [{none, L} | A]
    end.

init(Fn, L) ->
    Parent = self(),
    process_flag(trap_exit, true),
    Pid = spawn_link(fun() -> proccess(Parent, Fn, L) end),
    {key, Pid, L}.

proccess(Parent, Fn, L) ->
    Res = Fn(L),
    Parent ! {res, self(), Res}.

receive_all(0, D) -> D;
receive_all(N, D) ->
     receive
         {res, Pid, Res} -> receive_all(N - 1, dict:append(Pid, Res, D));
         {'EXIT', _Pid, normal} -> receive_all(N, D);
         {'EXIT', _Pid, _Reason} -> receive_all(N - 1, D)
     after (N+1)*2000 -> D
     end.
