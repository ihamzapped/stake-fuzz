import hre, { ethers } from "hardhat";

async function main() {
  try {
    const Stakepool = await ethers.getContractFactory("Stakepool");
    const cf = await Stakepool.deploy();

    await cf.deployTransaction.wait(6);

    console.log(
      `Deployed Stakepool Contract
      Address: ${cf.address}\n`
    );

    await hre.run("verify:verify", {
      address: cf.address,
      // constructorArguments: params,
    });
  } catch (error) {
    throw error;
  }
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
