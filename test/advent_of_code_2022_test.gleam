import gleeunit
import gleeunit/should
import days/day_1
import days/day_2
import days/day_3
import days/day_4
import days/day_5
import days/day_6
import days/day_7

pub fn main() {
  gleeunit.main()
}

pub fn day_1_test() {
  let input =
    "1000
2000
3000

4000

5000
6000

7000
8000
9000

10000"

  day_1.pt_1(input)
  |> should.equal(24_000)

  day_1.pt_2(input)
  |> should.equal(45_000)
}

pub fn day_2_test() {
  let input =
    "A Y
B X
C Z"

  day_2.pt_1(input)
  |> should.equal(15)

  day_2.pt_2(input)
  |> should.equal(12)
}

pub fn day_3_test() {
  let input =
    "vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw"
  day_3.pt_1(input)
  |> should.equal(157)

  day_3.pt_2(input)
  |> should.equal(70)
}

pub fn day_4_test() {
  let input =
    "2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8"

  day_4.pt_1(input)
  |> should.equal(2)

  day_4.pt_2(input)
  |> should.equal(4)
}

pub fn day_5_test() {
  let input =
    "    [D]    
[N] [C]    
[Z] [M] [P]
 1   2   3 

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2"

  day_5.pt_1(input)
  |> should.equal("CMZ")

  day_5.pt_2(input)
  |> should.equal("MCD")
}

pub fn day_6_test() {
  day_6.pt_1("mjqjpqmgbljsphdztnvjfqwrcgsmlb")
  |> should.equal(7)
  day_6.pt_1("bvwbjplbgvbhsrlpgdmjqwftvncz")
  |> should.equal(5)
  day_6.pt_1("nppdvjthqldpwncqszvftbrmjlhg")
  |> should.equal(6)
  day_6.pt_1("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg")
  |> should.equal(10)
  day_6.pt_1("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw")
  |> should.equal(11)

  day_6.pt_2("mjqjpqmgbljsphdztnvjfqwrcgsmlb")
  |> should.equal(19)
  day_6.pt_2("bvwbjplbgvbhsrlpgdmjqwftvncz")
  |> should.equal(23)
  day_6.pt_2("nppdvjthqldpwncqszvftbrmjlhg")
  |> should.equal(23)
  day_6.pt_2("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg")
  |> should.equal(29)
  day_6.pt_2("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw")
  |> should.equal(26)
}

pub fn day_7_test() {
  let input =
    "$ cd /
$ ls
dir a
14848514 b.txt
8504156 c.dat
dir d
$ cd a
$ ls
dir e
29116 f
2557 g
62596 h.lst
$ cd e
$ ls
584 i
$ cd ..
$ cd ..
$ cd d
$ ls
4060174 j
8033020 d.log
5626152 d.ext
7214296 k"
  day_7.pt_1(input)
  |> should.equal(95437)

  day_7.pt_2(input)
  |> should.equal(24933642)
}
