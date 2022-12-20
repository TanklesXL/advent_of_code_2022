pub fn repeatedly(with start: a, num times: Int, do f: fn(a) -> a) -> a {
  case times {
    0 -> start
    _ -> repeatedly(f(start), times - 1, f)
  }
}

pub fn pair_try_map(p: #(a, a), f: fn(a) -> Result(b, c)) -> Result(#(b, b), c) {
  try a = f(p.0)
  try b = f(p.1)
  Ok(#(a, b))
}

pub fn pair_apply(p: #(a, b), f: fn(a, b) -> c) -> c {
  f(p.0, p.1)
}
