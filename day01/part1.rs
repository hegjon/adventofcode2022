use std::cmp;
use std::io;
use std::io::BufRead;

fn main() -> io::Result<()> {
    let mut max = -1;
    let mut current = 0;

    let stdin = io::stdin();
    {
        let handle = stdin.lock();
        for line in handle.lines() {
            if let Ok(calorie) = line {
                if calorie == "" {
                    max = cmp::max(max, current);
                    current = 0;
                } else {
                    let c: i32 = calorie.parse().unwrap();
                    current = current + c;
                }
            }
        }
    }
    //max = cmp::max(max, current);

    println!("{}", max);
    Ok(())
}
