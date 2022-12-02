use std::io;
use std::io::BufRead;

fn main() -> io::Result<()> {
    let mut current = 0;

    let mut v: Vec::<i32> = Vec::new();

    let stdin = io::stdin();
    {
        let handle = stdin.lock();
        for line in handle.lines() {
            if let Ok(calorie) = line {
                if calorie == "" {
                    v.push(current);
                    current = 0;
                } else {
                    let c: i32 = calorie.parse().unwrap();
                    current = current + c;
                }
            }
        }
    }

    v.sort_by(|a, b| b.cmp(a));
    println!("{}", v[0] + v[1] + v[2]);
    Ok(())
}
