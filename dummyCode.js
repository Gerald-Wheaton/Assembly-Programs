const num = 10

for (let i = 1; i < num; i++) {
  //boolean value
  let prime = true
  if (i === 2) {
    console.log(i)
    continue
  }
  //exclude even numbers because they will not be prime aside from 2
  if (i % 2 === 0) {
    continue
  }
  for (let j = 2; j < i; j++) {
    if (i % j === 0) {
      prime = false
      break //this is because we only care about have >= 1 divisor aside from 1 and the i
    }
  }
  if (prime) {
    console.log(i)
  }
}
