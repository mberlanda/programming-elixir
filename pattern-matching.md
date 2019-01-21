# ch02 Pattern Matching

Pattern-Matching-1

```exs
➜  programming_elixir git:(master) iex
iex(1)> a = [1, 2, 3]
[1, 2, 3]
iex(2)> a = 4
4
iex(3)> 4 = a
4
iex(4)> [a, b] = [1, 2, 3]
** (MatchError) no match of right hand side value: [1, 2, 3]
    (stdlib) erl_eval.erl:453: :erl_eval.expr/5
    (iex) lib/iex/evaluator.ex:249: IEx.Evaluator.handle_eval/5
    (iex) lib/iex/evaluator.ex:229: IEx.Evaluator.do_eval/3
    (iex) lib/iex/evaluator.ex:207: IEx.Evaluator.eval/3
    (iex) lib/iex/evaluator.ex:94: IEx.Evaluator.loop/1
    (iex) lib/iex/evaluator.ex:24: IEx.Evaluator.init/4
iex(4)> a = [[1,2,3]]
[[1, 2, 3]]
iex(5)> [a] = [[1,2,3]]
[[1, 2, 3]]
iex(6)> [[a]] = [[1,2,3]]
** (MatchError) no match of right hand side value: [[1, 2, 3]]
    (stdlib) erl_eval.erl:453: :erl_eval.expr/5
    (iex) lib/iex/evaluator.ex:249: IEx.Evaluator.handle_eval/5
    (iex) lib/iex/evaluator.ex:229: IEx.Evaluator.do_eval/3
    (iex) lib/iex/evaluator.ex:207: IEx.Evaluator.eval/3
    (iex) lib/iex/evaluator.ex:94: IEx.Evaluator.loop/1
    (iex) lib/iex/evaluator.ex:24: IEx.Evaluator.init/4
```

Pattern-Matching-2

```exs
➜  programming_elixir git:(master) ✗ iex
iex(1)> [a,b,a] = [1,2,3]
** (MatchError) no match of right hand side value: [1, 2, 3]
    (stdlib) erl_eval.erl:453: :erl_eval.expr/5
    (iex) lib/iex/evaluator.ex:249: IEx.Evaluator.handle_eval/5
    (iex) lib/iex/evaluator.ex:229: IEx.Evaluator.do_eval/3
    (iex) lib/iex/evaluator.ex:207: IEx.Evaluator.eval/3
    (iex) lib/iex/evaluator.ex:94: IEx.Evaluator.loop/1
    (iex) lib/iex/evaluator.ex:24: IEx.Evaluator.init/4
iex(1)> [a,b,a] = [1,1,2]
** (MatchError) no match of right hand side value: [1, 1, 2]
    (stdlib) erl_eval.erl:453: :erl_eval.expr/5
    (iex) lib/iex/evaluator.ex:249: IEx.Evaluator.handle_eval/5
    (iex) lib/iex/evaluator.ex:229: IEx.Evaluator.do_eval/3
    (iex) lib/iex/evaluator.ex:207: IEx.Evaluator.eval/3
    (iex) lib/iex/evaluator.ex:94: IEx.Evaluator.loop/1
    (iex) lib/iex/evaluator.ex:24: IEx.Evaluator.init/4
iex(1)> [a,b,a] = [1,2,1]
[1, 2, 1]
```

Pattern-Matching-3

```exs
➜  programming_elixir git:(master) ✗ iex

iex(1)> [a,b,a] = [1,2,3]
** (MatchError) no match of right hand side value: [1, 2, 3]
    (stdlib) erl_eval.erl:453: :erl_eval.expr/5
    (iex) lib/iex/evaluator.ex:249: IEx.Evaluator.handle_eval/5
    (iex) lib/iex/evaluator.ex:229: IEx.Evaluator.do_eval/3
    (iex) lib/iex/evaluator.ex:207: IEx.Evaluator.eval/3
    (iex) lib/iex/evaluator.ex:94: IEx.Evaluator.loop/1
    (iex) lib/iex/evaluator.ex:24: IEx.Evaluator.init/4
iex(1)> [a,b,a] = [1,1,2]
** (MatchError) no match of right hand side value: [1, 1, 2]
    (stdlib) erl_eval.erl:453: :erl_eval.expr/5
    (iex) lib/iex/evaluator.ex:249: IEx.Evaluator.handle_eval/5
    (iex) lib/iex/evaluator.ex:229: IEx.Evaluator.do_eval/3
    (iex) lib/iex/evaluator.ex:207: IEx.Evaluator.eval/3
    (iex) lib/iex/evaluator.ex:94: IEx.Evaluator.loop/1
    (iex) lib/iex/evaluator.ex:24: IEx.Evaluator.init/4
iex(1)> a =1
1
iex(2)> ^a = 2
** (MatchError) no match of right hand side value: 2
    (stdlib) erl_eval.erl:453: :erl_eval.expr/5
    (iex) lib/iex/evaluator.ex:249: IEx.Evaluator.handle_eval/5
    (iex) lib/iex/evaluator.ex:229: IEx.Evaluator.do_eval/3
    (iex) lib/iex/evaluator.ex:207: IEx.Evaluator.eval/3
    (iex) lib/iex/evaluator.ex:94: IEx.Evaluator.loop/1
    (iex) lib/iex/evaluator.ex:24: IEx.Evaluator.init/4
iex(2)> ^a = 1
1
iex(3)> ^a = 2 - a
1
```