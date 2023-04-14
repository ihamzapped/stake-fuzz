# stake-fuzz

Simple stake contract to understand property based testing with foundry.

## Setup

**Recommended**

1. Create .env from example file
2. Install [pnpm](https://pnpm.io/installation)
   and [foundry](https://book.getfoundry.sh/getting-started/installation).
3. Run the following command in project root:

```shell
 pnpm deps
```

## Deploy

```shell
 pnpm deploy:<mumbai | fuji>
```

## Test Stake Contract

```shell
 pnpm test
```

## Compile

```shell
 npx hardhat compile | forge compile
```

P.S: This code is un-audited and not to be used in production
