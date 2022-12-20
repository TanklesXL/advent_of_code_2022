import gleam/string
import gleam/list
import gleam/int
import gleam/map.{Map}
import gleam/option.{Some}
import gleam/function.{compose as c}
import gleam/pair
import gleam/result
import gleam/iterator.{Iterator}
import util

fn parse(input: String) -> #(Map(Int, List(String)), Iterator(Move)) {
  assert Ok(#(stacks, moves)) = string.split_once(input, "\n\n")
  #(parse_stacks(stacks), parse_moves(moves))
}

fn parse_stacks(stacks: String) -> Map(Int, List(String)) {
  assert [nums, ..stacks] =
    stacks
    |> string.split("\n")
    |> list.reverse

  let nums =
    nums
    |> string.split(" ")
    |> list.filter_map(int.parse)

  let stacks =
    stacks
    |> list.map(string.to_graphemes)
    |> list.transpose
    |> list.map(list.filter(_, fn(s) { s != " " && s != "[" && s != "]" }))
    |> list.filter(fn(l) { !list.is_empty(l) })

  use acc, buckets <- list.fold(list.zip(nums, stacks), map.new())
  map.insert(acc, buckets.0, list.reverse(buckets.1))
}

type Move {
  Move(count: Int, from: Int, to: Int)
}

fn parse_moves(moves: String) -> Iterator(Move) {
  let moves =
    moves
    |> string.split("\n")
    |> iterator.from_list

  use move <- iterator.map(moves)
  assert ["move", count, "from", src, "to", dst] = string.split(move, " ")
  assert Ok(count) = int.parse(count)
  assert Ok(src) = int.parse(src)
  assert Ok(dst) = int.parse(dst)
  Move(count: count, from: src, to: dst)
}

fn solve(input, f) {
  let #(stacks, moves) = parse(input)
  assert Ok(firsts) =
    iterator.fold(moves, stacks, f)
    |> map.to_list()
    |> list.sort(fn(p1, p2) { int.compare(p1.0, p2.0) })
    |> list.try_map(c(pair.second, list.first))

  string.concat(firsts)
}

pub fn pt_1(input: String) {
  use stacks, move <- solve(input)
  use stacks <- util.repeatedly(with: stacks, num: move.count)
  assert Ok([val, ..rest]) = map.get(stacks, move.from)
  let stacks = map.insert(stacks, move.from, rest)
  use stack <- map.update(stacks, move.to)
  assert Some(stack) = stack
  [val, ..stack]
}

pub fn pt_2(input: String) {
  use stacks, move <- solve(input)
  assert Ok(#(top, rest)) =
    stacks
    |> map.get(move.from)
    |> result.map(list.split(_, at: move.count))
  let stacks = map.insert(stacks, move.from, rest)
  use stack <- map.update(stacks, move.to)
  assert Some(stack) = stack
  list.append(top, stack)
}
