# Mining Simulation

Here we use docker to set up a local AdCoin mining pool on the regtest network. This network starts with a zero-difficulty, allowing for instant blocks.

The mining simulator can be used to test and demonstrate new algorithms like the difficulty regulator.

Unlike default regtest, we've implemented some patches in AdCoin that allow a normal growth in difficulty (like it would on main net) Because of this, we are able to start with a very low difficulty and mine quickly. We can then use the mining power we have at our disposal as if it's the only equipment in the network.

This allows us to:

- Test the difficulty regulator.
- Test if the given difficulty, combined with the speed of our equipment results in the desired duration to create a block (i.e in adcoin each block should be made 10 minutes after the last one)
- Test if a given hash function (i.e scrypt) performs well within the difficulty regulator.

## Get started

- Compile AdCoin and move the binaries `litecoin-cli` and `litcoind` to `docker/bin`.
