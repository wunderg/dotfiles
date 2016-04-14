export const sum =
`function sum(collection, startValue) {
  // code here
}
`;

export const sumExample =
`var numbers = [1,2,3,4];

sum(numbers); => 10

sum(numbers, 10); => 20
`;

export const sumSolution =
`function sum(collection, startValue) {
  startValue = startValue || 0;
  return reduce(collection, function(memo, item) {
    memo + item;
    return memo;
  }, startValue);
}

***** Pseudo Code *****
//function sum accepts collection and optional startValue
  //if startValue is not defined initiate at 0
  //return reduce with collection, callback and startVallue
    //pass memo and item into the callback
    //add memo and item
    //return memo
`;
