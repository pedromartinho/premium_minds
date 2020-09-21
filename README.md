# Premium Minds - Gotta Catch 'Em All

![Pokemom](https://teste-martinho-page.s3-eu-west-1.amazonaws.com/share/pokemon.png)

## Run Solution

#### Intall dependencies

To install the project dependencies, run:

```bundle install```

#### Run Program with input

To have the program running with a desire input, run the following command line:

```ruby pokemon.rb <input>```

#### Run Tests

Last but not least, to perform the created tests, just run:

```rspec```

## Challenge Approach

In a first instance I've created a brute force solution (Brock) to be confident on the output I was getting no matter the input. After that I've started working on a better solution not only in terms of time but also in memory consumption.

For this second solution (Gary) I've used hash with the keys has the X-axis and the values of each Y-axis stored in the respective key in a array. This would decrease a lot the search time looking for the

Finally, after some reading and thought on the challenge, I remembered I could try to use the Set to insert each combination of coordinates and it resulted in a even faster solution (Ash), however the cost involved is also greater.

In the image bellow, we can see the obtained results. As we can see, the last two trainers achieve must more interesting results in terms of time consumed, being the overall winner, the Ash method as always!

![Pokemom](https://teste-martinho-page.s3-eu-west-1.amazonaws.com/share/results.jpeg)

## Thank you for the opportunity and let's speak soon
