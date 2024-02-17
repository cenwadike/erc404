import { ethers } from "hardhat";

async function main() {
    const [initialOwner, initalMintRecipient] = await ethers.getSigners();

    const hybrid_ = ethers.getContractFactory("HybridToken");
    const hybrid = (await hybrid_).deploy("HybridToken", "HYBRD", 18, 1000, initialOwner, initalMintRecipient);
    (await hybrid).waitForDeployment()
}


main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});