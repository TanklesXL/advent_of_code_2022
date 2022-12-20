import gleam/string
import gleam/list
import gleam/int
import gleam/result
import util.{pair_apply, pair_try_map}

// pair helpers

// parse input
fn parse(input: String) -> List(#(#(Int, Int), #(Int, Int))) {
  assert Ok(ranges) = {
    use line <- list.try_map(string.split(input, "\n"))
    line
    |> string.split_once(",")
    |> result.then(pair_try_map(_, string.split_once(_, "-")))
    |> result.then(pair_try_map(_, pair_try_map(_, int.parse)))
  }
  ranges
}

fn solve(input: String, f: fn(#(Int, Int), #(Int, Int)) -> Bool) {
  input
  |> parse
  |> list.filter(pair_apply(_, f))
  |> list.length
}

fn complete_overlap(a: #(Int, Int), b: #(Int, Int)) -> Bool {
  a.0 <= b.0 && a.1 >= b.1 || b.0 <= a.0 && b.1 >= a.1
}

pub fn pt_1(input: String) {
  solve(input, complete_overlap)
}

fn partial_overlap(a: #(Int, Int), b: #(Int, Int)) -> Bool {
  a.0 <= b.0 && b.0 <= a.1 || b.0 <= a.0 && a.0 <= b.1
}

pub fn pt_2(input: String) {
  solve(input, partial_overlap)
}
